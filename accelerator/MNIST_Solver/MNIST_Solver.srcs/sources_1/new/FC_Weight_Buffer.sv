`timescale 1ns / 1ps

module FC_Weight_Buffer (
    input [4:0] addr,
    output logic signed [17:0] data [9:0]
);

    (* rom_style = "distributed " *) logic signed [17:0] mem0 [19:0];
    (* rom_style = "distributed " *) logic signed [17:0] mem1 [19:0];
    (* rom_style = "distributed " *) logic signed [17:0] mem2 [19:0];
    (* rom_style = "distributed " *) logic signed [17:0] mem3 [19:0];
    (* rom_style = "distributed " *) logic signed [17:0] mem4 [19:0];
    (* rom_style = "distributed " *) logic signed [17:0] mem5 [19:0];
    (* rom_style = "distributed " *) logic signed [17:0] mem6 [19:0];
    (* rom_style = "distributed " *) logic signed [17:0] mem7 [19:0];
    (* rom_style = "distributed " *) logic signed [17:0] mem8 [19:0];
    (* rom_style = "distributed " *) logic signed [17:0] mem9 [19:0];

    
    assign data[0] = mem0[addr];
    assign data[1] = mem1[addr];
    assign data[2] = mem2[addr];
    assign data[3] = mem3[addr];
    assign data[4] = mem4[addr];
    assign data[5] = mem5[addr];
    assign data[6] = mem6[addr];
    assign data[7] = mem7[addr];
    assign data[8] = mem8[addr];
    assign data[9] = mem9[addr];


    initial begin
        $readmemb("/home/andrew/infernet/misc/fc_weights/FC_Neuron_0_weights.mem", mem0);
        $readmemb("/home/andrew/infernet/misc/fc_weights/FC_Neuron_1_weights.mem", mem1);
        $readmemb("/home/andrew/infernet/misc/fc_weights/FC_Neuron_2_weights.mem", mem2);
        $readmemb("/home/andrew/infernet/misc/fc_weights/FC_Neuron_3_weights.mem", mem3);
        $readmemb("/home/andrew/infernet/misc/fc_weights/FC_Neuron_4_weights.mem", mem4);
        $readmemb("/home/andrew/infernet/misc/fc_weights/FC_Neuron_5_weights.mem", mem5);
        $readmemb("/home/andrew/infernet/misc/fc_weights/FC_Neuron_6_weights.mem", mem6);
        $readmemb("/home/andrew/infernet/misc/fc_weights/FC_Neuron_7_weights.mem", mem7);
        $readmemb("/home/andrew/infernet/misc/fc_weights/FC_Neuron_8_weights.mem", mem8);
        $readmemb("/home/andrew/infernet/misc/fc_weights/FC_Neuron_9_weights.mem", mem9);
    end

endmodule