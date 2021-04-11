`timescale 1ns / 1ps

module N_Channel_Frame_Buffer #(
    parameter N_CHANNELS = 1
) (
    input clock,
    // Write signals
    // Row and col should both be >= 0, < 28
    input [4:0] w_row,
    input [4:0] w_col,
    input signed [17:0] w_data [N_CHANNELS - 1 : 0],
    input w_en,
    // Read signals
    // Row and col should both be >= 0, < 28
    input [4:0] r_row,
    input [4:0] r_col,
    output signed [17:0] r_data [N_CHANNELS - 1 : 0]
);

    genvar i;
    generate
    for (i = 0; i < N_CHANNELS; i++) begin : BRAM_gen
        Frame_Buffer_BRAM ram (
            .addra({w_row, w_col}),
            .clka(clock),
            .dina(w_data[i]),
            .wea(w_en),
            .addrb({r_row, r_col}),
            .clkb(clock),
            .doutb(r_data[i])
        );    
    end
    endgenerate

endmodule
