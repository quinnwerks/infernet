`timescale 1ns / 1ps

module MNIST_Solver(
    // Control signals
    input clock,
    input reset_n,
    input start,
    output done,
    
//    // Input data
    input [4:0] w_row,
    input [4:0] w_col,
    input [17:0] w_data,
    input w_en,
    
//    // Output data
    input [4:0] r_row,
    input [4:0] r_col,
    output [17:0] r_data
);

    wire [17:0] c1_in_data, c1_out_data;
    wire [4:0] c1_in_row, c1_in_col, c1_out_row, c1_out_col;
    wire c1_out_w_en;

    Conv_1_Channel #(
//        .weights(),
//        .bias()
    ) channel1 (
        // Control signals
        .clock(clock),
        .reset_n(reset_n),
        .start(start),
        .done(done),
        // Data into channel
        .in_data(c1_in_data),
        .in_row(c1_in_row),
        .in_col(c1_in_col),
        // Data out from channel
        .out_data(c1_out_data),
        .out_row(c1_out_row),
        .out_col(c1_out_col),
        .out_w_enable(c1_out_w_en)
    );
    
    Conv_1_Frame_Buffer in_buf (
        .clock(clock),
        
        .w_row(w_row),
        .w_col(w_col),
        .w_data(w_data),
        .w_en(w_en),
        
        .r_row(c1_in_row),
        .r_col(c1_in_col),
        .r_data(c1_in_data)
    );
    
    Conv_1_Frame_Buffer out_buf (
        .clock(clock),
        
        .w_row(c1_out_row),
        .w_col(c1_out_col),
        .w_data(c1_out_data),
        .w_en(c1_out_w_en),
        
        .r_row(r_row),
        .r_col(r_col),
        .r_data(r_data)
    );

endmodule
