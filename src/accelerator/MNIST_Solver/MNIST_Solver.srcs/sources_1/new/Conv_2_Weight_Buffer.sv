`timescale 1ns / 1ps

module Conv_2_Weight_Buffer (
    input clock,
    input [4:0] addr,
    output logic signed [17:0] data [19:0]
);

    (* rom_style = "distributed " *) logic signed [17:0] mem0 [23:0];
    (* rom_style = "distributed " *) logic signed [17:0] mem1 [23:0];
    (* rom_style = "distributed " *) logic signed [17:0] mem2 [23:0];
    (* rom_style = "distributed " *) logic signed [17:0] mem3 [23:0];
    (* rom_style = "distributed " *) logic signed [17:0] mem4 [23:0];
    (* rom_style = "distributed " *) logic signed [17:0] mem5 [23:0];
    (* rom_style = "distributed " *) logic signed [17:0] mem6 [23:0];
    (* rom_style = "distributed " *) logic signed [17:0] mem7 [23:0];
    (* rom_style = "distributed " *) logic signed [17:0] mem8 [23:0];
    (* rom_style = "distributed " *) logic signed [17:0] mem9 [23:0];
    (* rom_style = "distributed " *) logic signed [17:0] mem10 [23:0];
    (* rom_style = "distributed " *) logic signed [17:0] mem11 [23:0];
    (* rom_style = "distributed " *) logic signed [17:0] mem12 [23:0];
    (* rom_style = "distributed " *) logic signed [17:0] mem13 [23:0];
    (* rom_style = "distributed " *) logic signed [17:0] mem14 [23:0];
    (* rom_style = "distributed " *) logic signed [17:0] mem15 [23:0];
    (* rom_style = "distributed " *) logic signed [17:0] mem16 [23:0];
    (* rom_style = "distributed " *) logic signed [17:0] mem17 [23:0];
    (* rom_style = "distributed " *) logic signed [17:0] mem18 [23:0];
    (* rom_style = "distributed " *) logic signed [17:0] mem19 [23:0];
    
    always_ff @(posedge clock) begin
        data[0] <= mem0[addr];
        data[1] <= mem1[addr];
        data[2] <= mem2[addr];
        data[3] <= mem3[addr];
        data[4] <= mem4[addr];
        data[5] <= mem5[addr];
        data[6] <= mem6[addr];
        data[7] <= mem7[addr];
        data[8] <= mem8[addr];
        data[9] <= mem9[addr];
        data[10] <= mem10[addr];
        data[11] <= mem11[addr];
        data[12] <= mem12[addr];
        data[13] <= mem13[addr];
        data[14] <= mem14[addr];
        data[15] <= mem15[addr];
        data[16] <= mem16[addr];
        data[17] <= mem17[addr];
        data[18] <= mem18[addr];
        data[19] <= mem19[addr];
    end

    initial begin
        $readmemb("/home/quinn/ece532-project/misc/conv_2_weights/Conv_2_Channel_0_weights.mem", mem0);
        $readmemb("/home/quinn/ece532-project/misc/conv_2_weights/Conv_2_Channel_1_weights.mem", mem1);
        $readmemb("/home/quinn/ece532-project/misc/conv_2_weights/Conv_2_Channel_2_weights.mem", mem2);
        $readmemb("/home/quinn/ece532-project/misc/conv_2_weights/Conv_2_Channel_3_weights.mem", mem3);
        $readmemb("/home/quinn/ece532-project/misc/conv_2_weights/Conv_2_Channel_4_weights.mem", mem4);
        $readmemb("/home/quinn/ece532-project/misc/conv_2_weights/Conv_2_Channel_5_weights.mem", mem5);
        $readmemb("/home/quinn/ece532-project/misc/conv_2_weights/Conv_2_Channel_6_weights.mem", mem6);
        $readmemb("/home/quinn/ece532-project/misc/conv_2_weights/Conv_2_Channel_7_weights.mem", mem7);
        $readmemb("/home/quinn/ece532-project/misc/conv_2_weights/Conv_2_Channel_8_weights.mem", mem8);
        $readmemb("/home/quinn/ece532-project/misc/conv_2_weights/Conv_2_Channel_9_weights.mem", mem9);
        $readmemb("/home/quinn/ece532-project/misc/conv_2_weights/Conv_2_Channel_10_weights.mem", mem10);
        $readmemb("/home/quinn/ece532-project/misc/conv_2_weights/Conv_2_Channel_11_weights.mem", mem11);
        $readmemb("/home/quinn/ece532-project/misc/conv_2_weights/Conv_2_Channel_12_weights.mem", mem12);
        $readmemb("/home/quinn/ece532-project/misc/conv_2_weights/Conv_2_Channel_13_weights.mem", mem13);
        $readmemb("/home/quinn/ece532-project/misc/conv_2_weights/Conv_2_Channel_14_weights.mem", mem14);
        $readmemb("/home/quinn/ece532-project/misc/conv_2_weights/Conv_2_Channel_15_weights.mem", mem15);
        $readmemb("/home/quinn/ece532-project/misc/conv_2_weights/Conv_2_Channel_16_weights.mem", mem16);
        $readmemb("/home/quinn/ece532-project/misc/conv_2_weights/Conv_2_Channel_17_weights.mem", mem17);
        $readmemb("/home/quinn/ece532-project/misc/conv_2_weights/Conv_2_Channel_18_weights.mem", mem18);
        $readmemb("/home/quinn/ece532-project/misc/conv_2_weights/Conv_2_Channel_19_weights.mem", mem19);
    end

endmodule