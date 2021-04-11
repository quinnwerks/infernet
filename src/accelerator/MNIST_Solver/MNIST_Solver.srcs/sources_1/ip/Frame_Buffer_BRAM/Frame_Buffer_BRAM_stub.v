// Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2018.3.1 (lin64) Build 2489853 Tue Mar 26 04:18:30 MDT 2019
// Date        : Sat Apr 10 19:18:34 2021
// Host        : andrew-debian running 64-bit Debian GNU/Linux 10 (buster)
// Command     : write_verilog -force -mode synth_stub
//               /home/andrew/infernet/src/accelerator/MNIST_Solver/MNIST_Solver.srcs/sources_1/ip/Frame_Buffer_BRAM/Frame_Buffer_BRAM_stub.v
// Design      : Frame_Buffer_BRAM
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7a100tcsg324-1
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* x_core_info = "blk_mem_gen_v8_4_2,Vivado 2018.3.1" *)
module Frame_Buffer_BRAM(clka, wea, addra, dina, clkb, addrb, doutb)
/* synthesis syn_black_box black_box_pad_pin="clka,wea[0:0],addra[9:0],dina[17:0],clkb,addrb[9:0],doutb[17:0]" */;
  input clka;
  input [0:0]wea;
  input [9:0]addra;
  input [17:0]dina;
  input clkb;
  input [9:0]addrb;
  output [17:0]doutb;
endmodule
