`timescale 1ns / 1ps

// This module implements the common "ReLU" or "Rectified Linear Unit"
//     activation function
// https://machinelearningmastery.com/rectified-linear-activation-function-for-deep-learning-neural-networks/
// Basically, acts as a clamp function - values less than 0 are set to 0,
//     greater than 0 are passed through
module ReLU #(
    parameter WIDTH = 18
)(
    input signed [WIDTH-1 : 0] in,
    input signed [WIDTH-1 : 0] out
);
    
    assign out = (in[WIDTH - 1]) ? 'b0 : in;
    
endmodule
