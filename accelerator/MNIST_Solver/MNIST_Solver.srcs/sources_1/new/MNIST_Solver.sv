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
    input [4:0] r_chan,
    output signed [17:0] r_data_out
);

    // start/done signals
    logic c1_done, mp_done, c2_done, ga_done, fc_done;

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
    
    // conv_2 input buffer signals
    wire [4:0] c2_ibuf_row, c2_ibuf_col;
    wire signed [17:0] c2_ibuf_rdata [5:0];
    
    // conv_2 weight buffer signals
    wire [4:0] c2_wbuf_addr;
    wire signed [17:0] c2_wbuf_data [19:0];
    
    // conv_2 output buffer signals
    wire [4:0] c2_obuf_row, c2_obuf_col;
    wire c2_obuf_w_en;
    wire signed [17:0] c2_obuf_wdata [19:0];
    
    // global average input buffer signals
    wire [4:0] ga_ibuf_row, ga_ibuf_col;
    wire signed [17:0] ga_ibuf_data [19:0];
    
    // fully connected input signals
    wire [4:0] fc_ibuf_chan;
    wire signed [17:0] fc_ibuf_data;
    
    // fully connected weight buffer signals
    wire [4:0] fc_wbuf_addr;
    wire signed [17:0] fc_wbuf_data [9:0];
    
    // fully connected output signals
    wire [4:0] fc_obuf_neuron;
    wire signed [17:0] fc_obuf_data;
    
    assign r_data_out = fc_obuf_data;
    assign fc_obuf_neuron = r_chan;
    assign done = fc_done;

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
    ) C1 (
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
        .done(mp_done),
        .in_data(mp_ibuf_rdata),
        .in_row(mp_ibuf_row),
        .in_col(mp_ibuf_col),
        .out_data(mp_obuf_wdata),
        .out_row(mp_obuf_row),
        .out_col(mp_obuf_col),
        .out_w_enable(mp_obuf_w_en)
    );
    
    Conv_2_Weight_Buffer c2_wbuf (
        .clock(clock),
        .addr(c2_wbuf_addr),
        .data(c2_wbuf_data)
    );
    
    Conv_Layer_2 #(
        .biases('{18'b0_0000000_0010011101,18'b1_1111111_0011011110,18'b1_1111111_1000000111,18'b0_0000000_0111110111,
                  18'b1_1111111_0000011101,18'b1_1111110_1110111011,18'b1_1111111_1011100001,18'b1_1111111_1010001001,
                  18'b1_1111111_0101000110,18'b1_1111110_0101110100,18'b1_1111101_1000000001,18'b0_0000000_0011101000,
                  18'b0_0000000_1000110101,18'b1_1111110_0010000010,18'b1_1111111_1000100001,18'b0_0000000_0111101011,
                  18'b1_1111110_1001100010,18'b0_0000001_1001111001,18'b1_1111111_0101101100,18'b1_1111111_0001110011})
    ) C2 (
        .clock(clock),
        .reset_n(reset_n),
        .start(mp_done),
        .done(c2_done),
        
        .in_weight_row(c2_wbuf_addr[1]),
        .in_weight_col(c2_wbuf_addr[0]),
        .in_weight_chan(c2_wbuf_addr[4:2]),
        .in_weight(c2_wbuf_data),
        
        .in_data(c2_ibuf_rdata),
        .in_row(c2_ibuf_row),
        .in_col(c2_ibuf_col),
        
        .out_data(c2_obuf_wdata),
        .out_row(c2_obuf_row),
        .out_col(c2_obuf_col),
        .out_w_enable(c2_obuf_w_en)
    );
    
    Global_Average_Layer GA (
        .clock(clock),
        .reset_n(reset_n),
        .start(c2_done),
        .done(ga_done),
        
        .in_data(ga_ibuf_data),
        .in_row(ga_ibuf_row),
        .in_col(ga_ibuf_col),
        
        .out_chan(fc_ibuf_chan),
        .out_data(fc_ibuf_data)
    );
    
    FC_Weight_Buffer fc_wbuf (
        .addr(fc_wbuf_addr),
        .data(fc_wbuf_data)
    );
    
    Fully_Connected_Layer #(
        .biases('{  18'b0_0000000_0010010110,18'b1_1111111_1000011101,
                    18'b0_0000000_1111010000,18'b0_0000000_0011001101,
                    18'b1_1111111_0000000111,18'b0_0000000_0010001100,
                    18'b1_1111111_0011111111,18'b0_0000000_1000011010,
                    18'b0_0000000_1010010011,18'b1_1111111_1001110000  })
    ) FC (
        .clock(clock),
        .reset_n(reset_n),
        .start(ga_done),
        .done(fc_done),
        
        .in_weight_chan(fc_wbuf_addr),
        .in_weight(fc_wbuf_data),
        
        .in_data(fc_ibuf_data),
        .in_chan(fc_ibuf_chan),
        
        .out_neuron(fc_obuf_neuron),
        .out_data(fc_obuf_data)
        
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
            
            .r_row(c2_ibuf_row),
            .r_col(c2_ibuf_col),
            .r_data(c2_ibuf_rdata[i])
        );
    end
    
    for (i = 0; i < 20; i++) begin : conv_2_obuf_gen
        Conv_1_Frame_Buffer c2_obuf (
            .clock(clock),
            
            .w_row(c2_obuf_row),
            .w_col(c2_obuf_col),
            .w_data(c2_obuf_wdata[i]),
            .w_en(c2_obuf_w_en),
            
            .r_row(ga_ibuf_row),
            .r_col(ga_ibuf_col),
            .r_data(ga_ibuf_data[i])
        );
    end
    endgenerate

endmodule
