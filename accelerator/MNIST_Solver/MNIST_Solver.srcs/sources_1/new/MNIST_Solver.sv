`timescale 1ns / 1ps

module MNIST_Solver(
    // Control signals
    input clock,
    input reset_n,
    input start,
    output done,
    
    // Input data, i.e. write to the first ibuf
    input [4:0] w_row,
    input [4:0] w_col,
    input signed [17:0] w_data,
    input w_en,
    
    // Output data, i.e. read from the last obuf
    input [4:0] r_row,
    input [4:0] r_col,
    output signed [17:0] r_data [5:0]
);

    // start/done signals
    logic c1_done;

    // Input data buffer signals
    wire signed [17:0] c1_in_data, c1_out_data;
    wire [4:0] c1_in_row, c1_in_col;
    
    // conv_1 output buffer signals
    wire [4:0] c1_obuf_row, c1_obuf_col;
    wire c1_obuf_w_en;
    wire signed [17:0] c1_obuf_wdata [5:0];
    
    // max_pool input buffer signals
    wire [4:0] mp_ibuf_row, mp_ibuf_col;
    wire signed [17:0] mp_ibuf_rdata [5:0];
    
    // max pool output buffer signals
    wire [4:0] mp_obuf_row, mp_obuf_col;
    wire mp_obuf_w_en;
    wire signed [17:0] mp_obuf_wdata [5:0];

    Conv_Layer_1 #(
        .weights('{
                   '{
                        '{18'b1_1111110_1011011110, 18'b1_1111110_1100110010, 18'b1_1111100_1111100100},
                        '{18'b1_1111101_0010000011, 18'b1_1111110_1100011110, 18'b1_1111101_1101111101},
                        '{18'b1_1111100_0111110010, 18'b0_0000010_1001001101, 18'b0_0000000_1000011110}
                    },
                   '{
                        '{18'b1_1111011_1011100001, 18'b1_1111100_0100111000, 18'b1_1111010_1111011101},
                        '{18'b0_0000010_0000011110, 18'b1_1111111_1000011101, 18'b1_1111010_0101000010},
                        '{18'b0_0000101_1101110100, 18'b0_0000100_0001001001, 18'b0_0000001_0010000001}
                    },
                   '{
                        '{18'b0_0000100_0111111001, 18'b0_0000001_1101011110, 18'b1_1111110_0110010100},
                        '{18'b1_1111110_1000011111, 18'b0_0000010_0000100011, 18'b0_0000000_0011010010},
                        '{18'b1_1111100_0011010110, 18'b1_1111111_1101111010, 18'b0_0000001_0101010101}
                    },
                   '{
                        '{18'b0_0000010_1001011010, 18'b0_0000010_0000111001, 18'b1_1111011_0010000001},
                        '{18'b0_0000010_1000001101, 18'b0_0000001_0110001110, 18'b1_1111100_0010101110},
                        '{18'b0_0000010_1111001011, 18'b1_1111101_1110001101, 18'b1_1111010_1110011111}
                    },
                   '{
                        '{18'b1_1111110_0110100010, 18'b1_1111011_1010010001, 18'b1_1111111_0010100110}, 
                        '{18'b1_1111101_1000011000, 18'b0_0000001_1000101111, 18'b0_0000100_1011010101}, 
                        '{18'b0_0000010_1010110010, 18'b0_0000010_1110001100, 18'b0_0000000_1110001101}
                    },
                   '{
                        '{18'b1_1111101_1001100110, 18'b1_1111110_0010110100, 18'b0_0000011_1100100110}, 
                        '{18'b1_1111110_0101110011, 18'b1_1111101_1100111111, 18'b0_0000100_0101111001}, 
                        '{18'b1_1111110_0010101110, 18'b1_1111101_0001111001, 18'b0_0000011_0000010110}
                    }
                   }),
        .biases('{18'b0_0000010_1100000110, 18'b1_1111111_1111111001, 18'b1_1111111_1111111011, 18'b1_1111111_1111111110, 18'b1_1111111_0100110100, 18'b1_1111111_1000000000})
    ) DUT (
        .clock(clock),
        .reset_n(reset_n),
        .start(start),
        .done(c1_done),
        .in_data(c1_in_data),
        .in_row(c1_in_row),
        .in_col(c1_in_col),
        .out_data(c1_obuf_wdata),
        .out_row(c1_obuf_row),
        .out_col(c1_obuf_col),
        .out_w_enable(c1_obuf_w_en)
    );
    
    Max_Pool_Layer MP (
        .clock(clock),
        .reset_n(reset_n),
        .start(c1_done),
        .done(done),
        .in_data(mp_ibuf_rdata),
        .in_row(mp_ibuf_row),
        .in_col(mp_ibuf_col),
        .out_data(mp_obuf_wdata),
        .out_row(mp_obuf_row),
        .out_col(mp_obuf_col),
        .out_w_enable(mp_obuf_w_en)
    );
    
    genvar i;
    generate
    for (i = 0; i < 6; i++) begin : obuf_gen
        Conv_1_Frame_Buffer c1_obuf (
            .clock(clock),
            
            .w_row(c1_obuf_row),
            .w_col(c1_obuf_col),
            .w_data(c1_obuf_wdata[i]),
            .w_en(c1_obuf_w_en),
            
            .r_row(mp_ibuf_row),
            .r_col(mp_ibuf_col),
            .r_data(mp_ibuf_rdata[i])
        );
        
        Conv_1_Frame_Buffer mp_obuf (
            .clock(clock),
            
            .w_row(mp_obuf_row),
            .w_col(mp_obuf_col),
            .w_data(mp_obuf_wdata[i]),
            .w_en(mp_obuf_w_en),
            
            .r_row(r_row),
            .r_col(r_col),
            .r_data(r_data[i])
        );
    end
    endgenerate
    
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

endmodule
