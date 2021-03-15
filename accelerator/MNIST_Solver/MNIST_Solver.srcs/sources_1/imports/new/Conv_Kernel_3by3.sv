`timescale 1ns / 1ps

// Output appears 12 cycles after inputs clocked in
module Conv_Kernel_3by3 #(
    parameter signed [17:0] weights [2:0][2:0] = '{'{18'h0, 18'h0, 18'h0}, 
                                                   '{18'h0, 18'h0, 18'h0}, 
                                                   '{18'h0, 18'h0, 18'h0}},
    parameter signed [17:0] bias = 18'h0
)(
    input clock,
    input reset_n,
    input signed [17:0] x [2:0][2:0],
    output signed [17:0] out
);

    logic signed [24:0] x_SE [2:0][2:0];
    logic signed [47:0] bias_SE;
    logic signed [47:0] mult_outs [2:0][2:0];
    logic signed [47:0] summed_products;
    
    
    always_comb begin
        bias_SE = bias;
    end
    
    genvar i, j;
    generate 
    for (i = 0; i < 3; i++) begin
        for (j = 0; j < 3; j++) begin
            assign x_SE[i][j] = x[i][j];
        end
    end
    endgenerate
    
    FP_Round #(
        .NUM_M(7),
        .NUM_F(10),
        .NUM_P(48)
    ) rounding (
        .in(mult_outs[2][2]),
        .out(out)
    );
    
    // Multipliers below
    Mult_Add_Pipelined_NC M0_0 (
        .CLK(clock),
        .CE(1'b1),
        .SCLR(~reset_n),
        .A(x_SE[0][0]),
        .B(weights[0][0]),
        .C({bias_SE, {10{1'b0}}}),
        .SUBTRACT('b0),
        .PCOUT(mult_outs[0][0])
    );
    
    Mult_Add_Pipelined_COL M0_1 (
        .CLK(clock),
        .CE(1'b1),
        .SCLR(~reset_n),
        .A(x_SE[0][1]),
        .B(weights[0][1]),
        .PCIN(mult_outs[0][0]),
        .SUBTRACT(1'b0),
        .PCOUT(mult_outs[0][1])
    );
    
    Mult_Add_Pipelined_COL M0_2 (
        .CLK(clock),
        .CE(1'b1),
        .SCLR(~reset_n),
        .A(x_SE[0][2]),
        .B(weights[0][2]),
        .PCIN(mult_outs[0][1]),
        .SUBTRACT(1'b0),
        .PCOUT(mult_outs[0][2])
    );
    
    Mult_Add_Pipelined_COL M1_0 (
        .CLK(clock),
        .CE(1'b1),
        .SCLR(~reset_n),
        .A(x_SE[1][0]),
        .B(weights[1][0]),
        .PCIN(mult_outs[0][2]),
        .SUBTRACT(1'b0),
        .PCOUT(mult_outs[1][0])
    );

    Mult_Add_Pipelined_COL M1_1 (
        .CLK(clock),
        .CE(1'b1),
        .SCLR(~reset_n),
        .A(x_SE[1][1]),
        .B(weights[1][1]),
        .PCIN(mult_outs[1][0]),
        .SUBTRACT(1'b0),
        .PCOUT(mult_outs[1][1])
    );
    
    Mult_Add_Pipelined_COL M1_2 (
        .CLK(clock),
        .CE(1'b1),
        .SCLR(~reset_n),
        .A(x_SE[1][2]),
        .B(weights[1][2]),
        .PCIN(mult_outs[1][1]),
        .SUBTRACT(1'b0),
        .PCOUT(mult_outs[1][2])
    );
    
    Mult_Add_Pipelined_COL M2_0 (
        .CLK(clock),
        .CE(1'b1),
        .SCLR(~reset_n),
        .A(x_SE[2][0]),
        .B(weights[2][0]),
        .PCIN(mult_outs[1][2]),
        .SUBTRACT(1'b0),
        .PCOUT(mult_outs[2][0])
    );
    
    Mult_Add_Pipelined_COL M2_1 (
        .CLK(clock),
        .CE(1'b1),
        .SCLR(~reset_n),
        .A(x_SE[2][1]),
        .B(weights[2][1]),
        .PCIN(mult_outs[2][0]),
        .SUBTRACT(1'b0),
        .PCOUT(mult_outs[2][1])
    );
    
    Mult_Add_Pipelined_COL M2_2 (
        .CLK(clock),
        .CE(1'b1),
        .SCLR(~reset_n),
        .A(x_SE[2][2]),
        .B(weights[2][2]),
        .PCIN(mult_outs[2][1]),
        .SUBTRACT(1'b0),
        .P(mult_outs[2][2])
    );

endmodule
