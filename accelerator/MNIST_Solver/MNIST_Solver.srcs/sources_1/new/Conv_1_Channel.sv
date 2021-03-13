`timescale 1ns / 1ps

module Conv_1_Channel #(
//    parameter signed [17:0] weights [2:0][2:0] = '{'{18'h0, 18'h0, 18'h0}, 
//                                                   '{18'h0, 18'h0, 18'h0}, 
//                                                   '{18'h0, 18'h0, 18'h0}},
//    parameter signed [17:0] bias = 18'h0
)(
    input clock,
    input reset_n,
    input start,
    input logic signed [17:0] x_pad [29:0][29:0],
    input logic signed [17:0] weights [2:0][2:0],
    input logic signed [17:0] bias,
    output logic signed [17:0] y [27:0][27:0],
    output logic done
);

//    logic signed [17:0] x_padded [29:0][29:0];
    
    // TODO: verify this actually does what we want
//    genvar a, b;
//    generate
//        for (a = 0; a < 30; a++) begin
//            for (b = 0; b < 30; b++) begin
//                if (a == 0 || b == 0 || a == 29 || b == 29) begin
//                    assign x_padded[a][b] = x[a][b];
//                end else begin
//                    assign x_padded[a][b] = 18'b0;
//                end
//            end
//        end
//    endgenerate
    

    logic enable;
    logic signed [17:0] kernel_in [2:0][2:0];
    logic signed [17:0] kernel_out, relu_out;
    
    logic [4:0] row, col;
    
    logic [3:0] move_window_counter;
    
    genvar i, j;
    generate
    for (i = -1; i < 2; i++) begin
        for (j = -1; j < 2; j++) begin
            assign kernel_in[i + 1][j + 1] = x_pad[row + i][col + j];
        end
    end
    endgenerate
    
    always_ff @(posedge clock) begin
        if (reset_n == 1'b0) begin
            move_window_counter <= 4'd12;
        end else begin
            if (enable) begin
                if (move_window_counter == 4'd0) begin
                    move_window_counter <= 4'd12;
                end else begin
                    move_window_counter <= move_window_counter - 1;
                end
            end
        end
    end
    
    always_ff @(posedge clock) begin
        if (reset_n == 1'b0) begin
            enable <= 1'b0;
            done <= 1'b0;
            row <= 5'd1;
            col <= 5'd1;
        end else begin
            if (start && !enable) begin
                enable <= 1'b1;
            end
            if (enable && move_window_counter == 4'd0) begin
                if (row == 5'd28 && col == 5'd28) begin
                    row <= 5'd1;
                    col <= 5'd1;
                    enable <= 1'b0;
                    done <= 1'b1;
                end else if (col == 5'd28) begin
                    col <= 5'd1;
                    row <= row + 1;
                end else begin
                    col <= col + 1;
                end
                y[row - 1][col - 1] <= relu_out;
            end
            if (done) begin
                done <= 1'b0;
            end
        end
    end

    Conv_Kernel_3by3 #(
//        .weights(weights),
//        .bias(bias)
    ) kernel (
        .clock(clock),
        .reset_n(reset_n),
        .x(kernel_in),
        .weights(weights),
        .bias(bias),
        .out(kernel_out)
    );
    
    ReLU #(
        .WIDTH(18)
    ) relu (
        .in(kernel_out),
        .out(relu_out)
    );

endmodule
