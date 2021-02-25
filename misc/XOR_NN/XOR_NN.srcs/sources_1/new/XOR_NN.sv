`timescale 1ns / 1ps

module XOR_NN(
    input clock,
    input reset_n,
    input start,
    input [31:0] ip_address,
    input [47:0] mac_address,
    input x,
    input y,
    output logic done,
    output [31:0] ip_out,
    output [47:0] mac_out,
    output out
);
    
    logic [3:0] counter;
    logic operating;
    
    // Fixed-point copies of X, Y
    logic signed [17:0] x_FP;
    logic signed [17:0] y_FP;
    // Neuron outputs
    logic signed [17:0] N1_wires;
    logic signed [17:0] N2_wires;
    logic signed [17:0] N3_wires;
    
    logic [31:0] ip_latch;
    logic [47:0] mac_latch;
        
    assign x_FP = {7'b0, x, 10'b0};
    assign y_FP = {7'b0, y, 10'b0};
    
    assign mac_out = mac_latch;
    assign ip_out = ip_latch;
    
    // Start/done control logic
    always_ff @(posedge clock) begin
        if (reset_n == 1'b0) begin
            counter <= 3'b110;
            done <= 1'b0;
            operating <= 1'b0;
        end else begin
            if (start && !operating) begin
                operating <= 1'b1;
                ip_latch <= ip_address;
                mac_latch <= mac_address;
            end
            if (operating && counter != 3'b000) begin
                counter = counter - 1'b1;
            end
            if (counter == 3'b000) begin
                operating <= 1'b0;
                done <= 1'b1;
                counter <= 3'b110;
            end
            if (done == 1'b1) begin
                done <= 1'b0;
            end
        end
    end
    
    FC_Neuron #(
        .weights({18'b0_0000001_0000000000, 18'b0_0000001_0000000000}),
        .bias(18'b1_1111111_0111111111)
    ) N1 (
        .clock(clock),
        .reset_n(reset_n),
        .x({x_FP, y_FP}),
        .out(N1_wires)
    );
    
    FC_Neuron #(
        .weights({18'b0_0000001_0000000000, 18'b0_0000001_0000000000}),
        .bias(18'b1_1111110_0111111111)
    ) N2 (
        .clock(clock),
        .reset_n(reset_n),
        .x({x_FP, y_FP}),
        .out(N2_wires)
    );
    
    FC_Neuron #(
        .weights({18'b0_0000001_0000000000, 18'b1_1111110_1111111111}),
        .bias(18'b1_1111111_0111111111)
    ) N3 (
        .clock(clock),
        .reset_n(reset_n),
        .x({N1_wires, N2_wires}),
        .out(N3_wires)
    );
    
    assign out = N3_wires[10];

endmodule


// We use S3.4 fixed-point numbers for our XOR NN
module FC_Neuron #(
    // Defaults don't matter too much here, we'll always override them
    parameter signed [17:0] weights [1:0] = {18'h0, 18'h0},
    parameter signed [17:0] bias = 18'h0
)(   
    input signed [17:0] x [1:0],
    input clock,
    input reset_n,
    output signed [17:0] out
);
    logic signed [24:0] x_SE [1:0];
//    logic signed [47:0] mult_products [1:0];
    logic signed [17:0] pre_activation;
    
    assign x_SE[0] = x[0];
    assign x_SE[1] = x[1];
    
    logic signed [47:0] mult_outs [1:0];
    
    logic signed [47:0] bias_full_width;
    logic signed [27:0] bias_SE;
    
    assign bias_SE = {bias, {10{1'b0}}};
    
    assign bias_full_width = bias_SE;
    
    Mult_Add_NC M0 (
        .CLK(clock),
        .CE(1'b1),
        .SCLR(~reset_n),
        .A(x_SE[0]),
        .B(weights[0]),
        .C(bias_full_width),
        .SUBTRACT(1'b0),
        // Leave P unconnected, we just need this output to cascade into the
        //     next mult
        .P(),
        .PCOUT(mult_outs[0])
    );
    
    Mult_Add_COL M1 (
        .CLK(clock),
        .CE(1'b1),
        .SCLR(~reset_n),
        .A(x_SE[1]),
        .B(weights[1]),
        // We tie this to 0 to avoid warnings - this port is unconnected internally
        //     anyways when the PCIN port is enabled
        .C(48'b0),
        .PCIN(mult_outs[0]),
        .SUBTRACT(1'b0),
        .P(mult_outs[1]),
        // Leave PCOUT unconnected, we're exiting the DSP column
        .PCOUT()
    );
    
    FW_FP_Converter #(
        .NUM_P(48),
        .NUM_M(7),
        .NUM_F(10)
    ) rounding (
        .in(mult_outs[1]),
        .out(pre_activation)
    );
    
    Hard_Threshold #(
        .WIDTH(18)
    ) HT (
        .in(pre_activation),
        .out(out)
    );

endmodule


// This module implements the common "Hard Threshold" activation function
// Transforms values into binary - all nonnegative values map to 1,
//     all negative to 0
module Hard_Threshold #(
    parameter WIDTH = 18
)(
    input signed [WIDTH-1 : 0] in,
    output signed [WIDTH-1 : 0] out
);

    assign out = (in[WIDTH-1]) ? 'b0 : 'b0_0000001_0000000000;

endmodule