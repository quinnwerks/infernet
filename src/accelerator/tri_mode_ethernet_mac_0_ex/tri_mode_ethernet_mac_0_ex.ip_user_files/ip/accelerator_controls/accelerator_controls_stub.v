// Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2018.3.1 (lin64) Build 2489853 Tue Mar 26 04:18:30 MDT 2019
// Date        : Tue Apr  6 06:38:07 2021
// Host        : hw-dev running 64-bit Ubuntu 18.04.5 LTS
// Command     : write_verilog -force -mode synth_stub
//               /home/quinn/ece532-project/accelerator/tri_mode_ethernet_mac_0_ex/tri_mode_ethernet_mac_0_ex.srcs/sources_1/ip/accelerator_controls/accelerator_controls_stub.v
// Design      : accelerator_controls
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7a100tcsg324-1
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* X_CORE_INFO = "vio,Vivado 2018.3.1" *)
module accelerator_controls(clk, probe_out0, probe_out1, probe_out2)
/* synthesis syn_black_box black_box_pad_pin="clk,probe_out0[0:0],probe_out1[1:0],probe_out2[0:0]" */;
  input clk;
  output [0:0]probe_out0;
  output [1:0]probe_out1;
  output [0:0]probe_out2;
endmodule
