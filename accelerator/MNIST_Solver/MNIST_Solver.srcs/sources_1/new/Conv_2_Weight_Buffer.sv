`timescale 1ns / 1ps

module Conv_2_Weight_Buffer (
    input clock,
    input [4:0] addr,
    output logic signed [17:0] data [19:0]
);
    
    Conv_2_Weight_dist_rom rom0 (
        .clock(clock),
        .addr(addr),
        .data(data[0])
    );

    Conv_2_Weight_dist_rom rom1 (
        .clock(clock),
        .addr(addr),
        .data(data[1])
    );

    Conv_2_Weight_dist_rom rom2 (
        .clock(clock),
        .addr(addr),
        .data(data[2])
    );

    Conv_2_Weight_dist_rom rom3 (
        .clock(clock),
        .addr(addr),
        .data(data[3])
    );

    Conv_2_Weight_dist_rom rom4 (
        .clock(clock),
        .addr(addr),
        .data(data[4])
    );

    Conv_2_Weight_dist_rom rom5 (
        .clock(clock),
        .addr(addr),
        .data(data[5])
    );

    Conv_2_Weight_dist_rom rom6 (
        .clock(clock),
        .addr(addr),
        .data(data[6])
    );

    Conv_2_Weight_dist_rom rom7 (
        .clock(clock),
        .addr(addr),
        .data(data[7])
    );

    Conv_2_Weight_dist_rom rom8 (
        .clock(clock),
        .addr(addr),
        .data(data[8])
    );

    Conv_2_Weight_dist_rom rom9 (
        .clock(clock),
        .addr(addr),
        .data(data[9])
    );

    Conv_2_Weight_dist_rom rom10 (
        .clock(clock),
        .addr(addr),
        .data(data[10])
    );

    Conv_2_Weight_dist_rom rom11 (
        .clock(clock),
        .addr(addr),
        .data(data[11])
    );

    Conv_2_Weight_dist_rom rom12 (
        .clock(clock),
        .addr(addr),
        .data(data[12])
    );

    Conv_2_Weight_dist_rom rom13 (
        .clock(clock),
        .addr(addr),
        .data(data[13])
    );

    Conv_2_Weight_dist_rom rom14 (
        .clock(clock),
        .addr(addr),
        .data(data[14])
    );

    Conv_2_Weight_dist_rom rom15 (
        .clock(clock),
        .addr(addr),
        .data(data[15])
    );

    Conv_2_Weight_dist_rom rom16 (
        .clock(clock),
        .addr(addr),
        .data(data[16])
    );

    Conv_2_Weight_dist_rom rom17 (
        .clock(clock),
        .addr(addr),
        .data(data[17])
    );

    Conv_2_Weight_dist_rom rom18 (
        .clock(clock),
        .addr(addr),
        .data(data[18])
    );

    Conv_2_Weight_dist_rom rom19 (
        .clock(clock),
        .addr(addr),
        .data(data[19])
    );

    initial begin
        $readmemb("/home/andrew/infernet/misc/conv_2_weights/Conv_2_Channel_0_weights.mem", rom0.mem);
        $readmemb("/home/andrew/infernet/misc/conv_2_weights/Conv_2_Channel_1_weights.mem", rom1.mem);
        $readmemb("/home/andrew/infernet/misc/conv_2_weights/Conv_2_Channel_2_weights.mem", rom2.mem);
        $readmemb("/home/andrew/infernet/misc/conv_2_weights/Conv_2_Channel_3_weights.mem", rom3.mem);
        $readmemb("/home/andrew/infernet/misc/conv_2_weights/Conv_2_Channel_4_weights.mem", rom4.mem);
        $readmemb("/home/andrew/infernet/misc/conv_2_weights/Conv_2_Channel_5_weights.mem", rom5.mem);
        $readmemb("/home/andrew/infernet/misc/conv_2_weights/Conv_2_Channel_6_weights.mem", rom6.mem);
        $readmemb("/home/andrew/infernet/misc/conv_2_weights/Conv_2_Channel_7_weights.mem", rom7.mem);
        $readmemb("/home/andrew/infernet/misc/conv_2_weights/Conv_2_Channel_8_weights.mem", rom8.mem);
        $readmemb("/home/andrew/infernet/misc/conv_2_weights/Conv_2_Channel_9_weights.mem", rom9.mem);
        $readmemb("/home/andrew/infernet/misc/conv_2_weights/Conv_2_Channel_10_weights.mem", rom10.mem);
        $readmemb("/home/andrew/infernet/misc/conv_2_weights/Conv_2_Channel_11_weights.mem", rom11.mem);
        $readmemb("/home/andrew/infernet/misc/conv_2_weights/Conv_2_Channel_12_weights.mem", rom12.mem);
        $readmemb("/home/andrew/infernet/misc/conv_2_weights/Conv_2_Channel_13_weights.mem", rom13.mem);
        $readmemb("/home/andrew/infernet/misc/conv_2_weights/Conv_2_Channel_14_weights.mem", rom14.mem);
        $readmemb("/home/andrew/infernet/misc/conv_2_weights/Conv_2_Channel_15_weights.mem", rom15.mem);
        $readmemb("/home/andrew/infernet/misc/conv_2_weights/Conv_2_Channel_16_weights.mem", rom16.mem);
        $readmemb("/home/andrew/infernet/misc/conv_2_weights/Conv_2_Channel_17_weights.mem", rom17.mem);
        $readmemb("/home/andrew/infernet/misc/conv_2_weights/Conv_2_Channel_18_weights.mem", rom18.mem);
        $readmemb("/home/andrew/infernet/misc/conv_2_weights/Conv_2_Channel_19_weights.mem", rom19.mem);
    end

endmodule


module Conv_2_Weight_dist_rom (
    input clock,
    input [4:0] addr,
    output logic signed [17:0] data
);

    (* rom_style = "distributed" *) logic signed [17:0] mem [23:0];
    
    always_ff @(posedge clock) begin
        data <= mem[addr];
    end

endmodule