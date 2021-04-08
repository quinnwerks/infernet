`timescale 1ns / 1ps

// This module takes a wide signed fixed-point signal, and performs rounding, 
//     overflow/underflow saturation, and truncation to outputa fixed-point
//     value of the desired width
// 
module FP_Round #(
    // NUM_M is the number of magnitude bits in the output signal, not counting
    //     the sign bit.
    // Similarly, NUM_F is the number of fractional bits in the output signal
    // The output signal thus has a width of NUM_M + NUM_F + 1 bits
    //     (+1 for the sign bit)
    parameter NUM_M = 7,
    parameter NUM_F = 10,
    // NUM_P is the width of the input fixed-point signal, including the sign
    //     bit
    parameter NUM_P = 43
)(
    input signed        [NUM_P - 1 : 0]         in,
    output logic signed [NUM_M + NUM_F : 0]     out,
    output logic        [0 : 0]                 overflow,
    output logic        [0 : 0]                 underflow,
    output logic        [0 : 0]                 lack_precision
);

    logic signed [NUM_P - 1 : 0] in_rounded;
    
    assign lack_precision = |in[NUM_F - 1 : 0];
    
    // We might be able to omit rounding logic to save some area
    always_comb begin
        if (lack_precision && in[NUM_F - 1]) begin
            in_rounded = in + (1'b1 << NUM_F);
        end else begin
            in_rounded = in;
        end
    end
    
    // We don't include the sign bit when ORing the output to check for overflow
    // We check all bits down to the bit that is the sign bit in the truncated value,
    //     because if the full-width is unsigned then the future sign bit being HIGH
    //     indicates a value 1 too big to fit into our precision
    assign overflow = ~in_rounded[NUM_P - 1] & |in_rounded[NUM_P - 2 : NUM_M + 2*NUM_F];
    // Checking for underflow basically is checking that we can "collapse" the
    //     leading sign bits of the full-width value, i.e. that there's no 0s in them
    assign underflow = in_rounded[NUM_P - 1] & ~(&in_rounded[NUM_P - 2 : NUM_M + 2*NUM_F]);
    
    assign out = overflow ? {1'b0, {(NUM_M + NUM_F){1'b1}}} :
                 underflow ? {1'b1, {(NUM_M + NUM_F){1'b0}}} :
                 in_rounded[NUM_M + NUM_F*2 : NUM_F];

endmodule
