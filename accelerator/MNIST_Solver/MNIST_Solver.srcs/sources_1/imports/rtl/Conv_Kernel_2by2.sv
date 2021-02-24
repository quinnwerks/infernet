`timescale 1ns / 1ps

// Output appears 7 cycles after inputs clocked in
module Conv_Kernel_2by2 #(
    parameter signed [17:0] weights [1:0][1:0] = '{'{18'h0, 18'h0}, '{18'h0, 18'h0}},
    parameter signed [17:0] bias = 18'h0
)(
    input clock,
    input reset_n,
    input signed [17:0] x [1:0][1:0],
    output signed [17:0] out
);

    logic signed [24:0] x_SE [1:0][1:0];
    logic signed [47:0] bias_SE;
    logic signed [47:0] mult_outs [1:0][1:0];
    logic signed [47:0] summed_products;
    
    assign x_SE[0][0] = x[0][0];
    assign x_SE[0][1] = x[0][1];
    assign x_SE[1][0] = x[1][0];
    assign x_SE[1][1] = x[1][1];
    assign bias_SE = bias;

    Mult_Add_Pipelined_NC M0 (
        .CLK(clock),
        .CE(1'b1),
        .SCLR(~reset_n),
        .A(x_SE[0][0]),
        .B(weights[0][0]),
        .C({bias_SE, {10{1'b0}}}),
        .SUBTRACT('b0),
        .PCOUT(mult_outs[0][0])
    );
    
    Mult_Add_Pipelined_COL M1 (
        .CLK(clock),
        .CE(1'b1),
        .SCLR(~reset_n),
        .A(x_SE[0][1]),
        .B(weights[0][1]),
        .C('b0),
        .PCIN(mult_outs[0][0]),
        .SUBTRACT('b0),
        .PCOUT(mult_outs[0][1])
    );
    
    Mult_Add_Pipelined_COL M2 (
        .CLK(clock),
        .CE(1'b1),
        .SCLR(~reset_n),
        .A(x_SE[1][0]),
        .B(weights[1][0]),
        .C('b0),
        .PCIN(mult_outs[0][1]),
        .SUBTRACT('b0),
        .PCOUT(mult_outs[1][0])
    );
    
    Mult_Add_Pipelined_COL M3 (
        .CLK(clock),
        .CE(1'b1),
        .SCLR(~reset_n),
        .A(x_SE[1][1]),
        .B(weights[1][1]),
        .C('b0),
        .PCIN(mult_outs[1][0]),
        .SUBTRACT('b0),
        .P(summed_products)
    );
    
    FP_Round #(
        .NUM_M(7),
        .NUM_F(10),
        .NUM_P(48)
    ) rounding (
        .in(summed_products),
        .out(out)
    );

endmodule
