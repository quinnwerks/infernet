`timescale 1ns / 1ps

module Conv_Layer_2 #(
    parameter signed [17:0] biases [19:0] = '{ 18'h0, 18'h0, 18'h0, 18'h0, 18'h0, 
                                               18'h0, 18'h0, 18'h0, 18'h0, 18'h0, 
                                               18'h0, 18'h0, 18'h0, 18'h0, 18'h0, 
                                               18'h0, 18'h0, 18'h0, 18'h0, 18'h0 } 
)(
    // Control signals
    input clock,
    input reset_n,
    input start,
    output logic done,
    // Channel to read weights in
    output logic in_weight_row,
    output logic in_weight_col,
    output logic [2:0] in_weight_chan,
    input signed [17:0] in_weight [19:0],
    // Channel to read data in
    input signed [17:0] in_data [5:0],
    output logic [4:0] in_row,
    output logic [4:0] in_col,
    // Output data
    output logic signed [17:0] out_data [19:0],
    output logic [4:0] out_row,
    output logic [4:0] out_col,
    output logic out_w_enable
);
    
    logic channel_enable, read_enable, mult_enable, kernel_in_enable, sum_enable;
    logic signed [17:0] kernel_in [1:0][1:0];
    logic signed [17:0] kernel_weights [19:0][1:0][1:0];
    logic signed [17:0] kernel_out [19:0];
    logic signed [17:0] sums [19:0];
    logic signed [17:0] relu_out [19:0];
    
    logic [4:0] row, col, cell_row, cell_col, cell_row_offset, cell_col_offset;
    logic [4:0] cell_row_old, cell_col_old, cell_row_offset_old, cell_col_offset_old;
    
    logic [2:0] in_chan, in_chan_old;
    
    assign cell_row = row + cell_row_offset;
    assign cell_col = col + cell_col_offset;
    assign in_row = (cell_row != 9) ? cell_row : 0;
    assign in_col = (cell_col != 9) ? cell_col : 0;
//    assign out_row = row;
//    assign out_col = col;
    assign in_weight_row = cell_row_offset[0];
    assign in_weight_col = cell_col_offset[0];
    assign in_weight_chan = in_chan;
    
    logic [3:0] move_window_counter;
    
    genvar i;
    generate
    for (i = 0; i < 20; i++) begin : conv_channels_gen
        assign out_data[i] = relu_out[i];
        
        Conv_Kernel_2by2 #(
        ) kernel (
            .clock(clock),
            .reset_n(reset_n),
            .weights(kernel_weights[i]),
            .x(kernel_in),
            .out(kernel_out[i])
        );
        
        ReLU #(
            .WIDTH(18)
        ) relu (
            .in(sums[i]),
            .out(relu_out[i])
        );
        
        // Sum kernel outputs
        always_ff @(posedge clock) begin
            if (reset_n == 1'b0) begin
                sums[i] <= biases[i];
            end else begin
                if (out_w_enable) begin
                    sums[i] <= biases[i];
                end else if (sum_enable) begin
                    sums[i] <= sums[i] + kernel_out[i];
                end
            end
        end
        
        // Read in weights
        always_ff @(posedge clock) begin
            if (reset_n == 1'b0) begin
                kernel_weights[i] <= '{2{'{2{18'b0}}}};
            end else begin
                if (kernel_in_enable) begin
                    kernel_weights[i][cell_row_offset_old][cell_col_offset_old] <= in_weight[i];
                end
            end
        end
    end
    endgenerate
    
//    assign out_w_enable = (channel_enable && move_window_counter == 4'd0 & in_chan == 'd5);
    assign sum_enable = (channel_enable && move_window_counter == 4'd0);
    
    always_ff @(posedge clock) begin
        if (reset_n == 1'b0) begin
            out_w_enable <= 1'b0;
            out_row <= 'b0;
            out_col <= 'b0;
        end else begin
            if (sum_enable && in_chan == 'd5) begin
                out_w_enable <= 1'b1;
                out_row <= row;
                out_col <= col;
            end
            if (out_w_enable) begin
                out_w_enable <= 1'b0;
            end
        end
    end
    
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
            row <= 5'd0;
            col <= 5'd0;
            cell_row_offset <= 5'd0;
            cell_col_offset <= 5'd0;
            cell_row_offset_old <= 5'd0;
            cell_col_offset_old <= 5'd0;
            cell_row_old <= 5'd0;
            cell_col_old <= 5'd0;
            kernel_in_enable <= 1'b0;
            in_chan <= 'b0;
            in_chan_old <= 'b0;
        end else begin
            cell_row_old <= cell_row;
            cell_col_old <= cell_col;
            in_chan_old <= in_chan;
            cell_row_offset_old <= cell_row_offset;
            cell_col_offset_old <= cell_col_offset;
            kernel_in_enable <= read_enable;
            
            if (start && !channel_enable) begin
                channel_enable <= 1'b1;
                read_enable <= 1'b1;
            end
            if (channel_enable && move_window_counter == 4'd0) begin
                if (in_chan == 'd5 && row == 'd8 && col == 'd8) begin
                    in_chan <= 'd0;
                    row <= 'd0;
                    col <= 'd0;
                    channel_enable <= 1'b0;
                    mult_enable <= 1'b0;
                    read_enable <= 1'b0;
                    done <= 1'b1;
                end else if (in_chan == 'd5 && col == 'd8) begin
                    col <= 'd0;
                    in_chan <= 'd0;
                    row <= row + 1;
                    read_enable <= 1'b1;
                    mult_enable <= 1'b0;
                end else if (in_chan == 'd5) begin
                    in_chan <= 'd0;
                    col <= col + 1;
                    read_enable <= 1'b1;
                    mult_enable <= 1'b0;
                end else begin
                    in_chan <= in_chan + 1;
                    read_enable <= 1'b1;
                    mult_enable <= 1'b0;
                end
            end
            if (done) begin
                done <= 1'b0;
            end
            
            if (read_enable) begin
                // Control variables for reading data into kernel_in
                if (cell_row_offset == 5'd1 && cell_col_offset == 5'd1) begin
                    cell_row_offset <= 5'd0;
                    cell_col_offset <= 5'd0;
                    read_enable <= 1'b0;
                    mult_enable <= 1'b1;
                end else if (cell_col_offset == 5'd1) begin
                    cell_row_offset <= cell_row_offset + 1;
                    cell_col_offset <= 5'd0;
                end else begin
                    cell_col_offset <= cell_col_offset + 1;
                end
            end
            
            if (kernel_in_enable) begin
                // Actually read the data into kernel_in
                if (cell_row_old == 5'd9 || cell_col_old == 5'd9) begin
                    kernel_in[cell_row_offset_old][cell_col_offset_old] <= 18'b0;
                end else begin
                    kernel_in[cell_row_offset_old][cell_col_offset_old] <= in_data[in_chan];
                end
            end
        end
    end

endmodule
