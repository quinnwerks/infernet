`timescale 1ns / 1ps

module Conv_Layer_1 #(
    parameter signed [17:0] weights [5:0][2:0][2:0] = '{6{'{'{18'h0, 18'h0, 18'h0}, 
                                                            '{18'h0, 18'h0, 18'h0}, 
                                                            '{18'h0, 18'h0, 18'h0}}}},
    parameter signed [17:0] biases [5:0] = '{18'h0, 18'h0, 18'h0, 18'h0, 18'h0, 18'h0} 
)(
    // Control signals
    input clock,
    input reset_n,
    input start,
    output logic done,
    // Channel to read data in
    input signed [17:0] in_data,
    output logic [4:0] in_row,
    output logic [4:0] in_col,
    // Output data
    output logic signed [17:0] out_data [5:0],
    output logic [4:0] out_row,
    output logic [4:0] out_col,
    output logic out_w_enable
);
    
    logic channel_enable, read_enable, mult_enable, kernel_in_enable;
    logic signed [17:0] kernel_in [2:0][2:0];
    logic signed [17:0] kernel_out [5:0];
    logic signed [17:0] relu_out [5:0];
    
    logic [4:0] row, col, cell_row, cell_col, cell_row_offset, cell_col_offset;
    logic [4:0] cell_row_old, cell_col_old, cell_row_offset_old, cell_col_offset_old;
    assign cell_row = row - 1 + cell_row_offset;
    assign cell_col = col - 1 + cell_col_offset;
    assign in_row = (cell_row != 0 && cell_row != 29) ? cell_row - 1 : 0;
    assign in_col = (cell_col != 0 && cell_col != 29) ? cell_col - 1 : 0;
    
    logic [3:0] move_window_counter;
    
    genvar i;
    generate
    for (i = 0; i < 6; i++) begin : conv_channels_gen
        assign out_data[i] = relu_out[i];
        
        Conv_Kernel_3by3 #(
            .weights(weights[i]),
            .bias(biases[i])
        ) kernel (
            .clock(clock),
            .reset_n(reset_n),
            .x(kernel_in),
            .out(kernel_out[i])
        );
        
        ReLU #(
            .WIDTH(18)
        ) relu (
            .in(kernel_out[i]),
            .out(relu_out[i])
        );
    end
    endgenerate
    
    assign out_w_enable = (channel_enable && move_window_counter == 4'd0);
    assign out_row = row - 1;
    assign out_col = col - 1;
    
    always_ff @(posedge clock) begin
        if (reset_n == 1'b0) begin
            move_window_counter <= 4'd04;
        end else begin
            if (channel_enable && mult_enable) begin
                if (move_window_counter == 4'd0) begin
                    move_window_counter <= 4'd04;
                end else begin
                    move_window_counter <= move_window_counter - 1;
                end
            end
        end
    end
    
    always_ff @(posedge clock) begin
        if (reset_n == 1'b0) begin
            channel_enable <= 1'b0;
            read_enable <= 1'b0;
            mult_enable <= 1'b0;
            done <= 1'b0;
            row <= 5'd1;
            col <= 5'd1;
            cell_row_offset <= 5'd0;
            cell_col_offset <= 5'd0;
            cell_row_offset_old <= 5'd0;
            cell_col_offset_old <= 5'd0;
            cell_row_old <= 5'd0;
            cell_col_old <= 5'd0;
            kernel_in_enable <= 1'b0;
        end else begin
            cell_row_old <= cell_row;
            cell_col_old <= cell_col;
            cell_row_offset_old <= cell_row_offset;
            cell_col_offset_old <= cell_col_offset;
            kernel_in_enable <= read_enable;
            
            if (start && !channel_enable) begin
                channel_enable <= 1'b1;
                read_enable <= 1'b1;
            end
            if (channel_enable && move_window_counter == 4'd0) begin
                if (row == 5'd28 && col == 5'd28) begin
                    row <= 5'd1;
                    col <= 5'd1;
                    channel_enable <= 1'b0;
                    mult_enable <= 1'b0;
                    read_enable <= 1'b0;
                    done <= 1'b1;
                end else if (col == 5'd28) begin
                    read_enable <= 1'b1;
                    mult_enable <= 1'b0;
                    col <= 5'd1;
                    row <= row + 1;
                end else begin
                    read_enable <= 1'b1;
                    mult_enable <= 1'b0;
                    col <= col + 1;
                end
            end
            if (done) begin
                done <= 1'b0;
            end
            
            if (read_enable) begin
                // Control variables for reading data into kernel_in
                if (cell_row_offset == 5'd2 && cell_col_offset == 5'd2) begin
                    cell_row_offset <= 5'd0;
                    cell_col_offset <= 5'd0;
                    read_enable <= 1'b0;
                    mult_enable <= 1'b1;
                end else if (cell_col_offset == 5'd2) begin
                    cell_row_offset <= cell_row_offset + 1;
                    cell_col_offset <= 5'd0;
                end else begin
                    cell_col_offset <= cell_col_offset + 1;
                end
            end
            
            if (kernel_in_enable) begin
                // Actually read the data into kernel_in
                if (cell_row_old == 5'd0 || cell_col_old == 5'd0 || cell_row_old == 5'd29 || cell_col_old == 5'd29) begin
                    kernel_in[cell_row_offset_old][cell_col_offset_old] <= 18'b0;
                end else begin
                    kernel_in[cell_row_offset_old][cell_col_offset_old] <= in_data;
                end
            end
        end
    end

endmodule
