`timescale 1ns / 1ps

module Conv_1_Frame_Buffer(
    input clock,
    // Write signals
    // Row and col should both be >= 0, < 28
    input [4:0] w_row,
    input [4:0] w_col,
    input signed [17:0] w_data,
    input w_en,
    // Read signals
    // Row and col should both be >= 0, < 28
    input [4:0] r_row,
    input [4:0] r_col,
    output signed [17:0] r_data
);

    Conv_1_BRAM ram (
        .addra({w_row, w_col}),
        .clka(clock),
        .dina(w_data),
        .wea(w_en),
        .addrb({r_row, r_col}),
        .clkb(clock),
        .doutb(r_data)
    );

endmodule
