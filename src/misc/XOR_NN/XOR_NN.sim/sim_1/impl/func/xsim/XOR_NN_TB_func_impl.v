// Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2018.3.1 (lin64) Build 2489853 Tue Mar 26 04:18:30 MDT 2019
// Date        : Wed Feb 24 18:30:58 2021
// Host        : andrew-debian running 64-bit Debian GNU/Linux 10 (buster)
// Command     : write_verilog -mode funcsim -nolib -force -file
//               /home/andrew/infernet/misc/XOR_NN/XOR_NN.sim/sim_1/impl/func/xsim/XOR_NN_TB_func_impl.v
// Design      : Top
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7a100tcsg324-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module FC_Neuron
   (O,
    CLK,
    SCLR,
    A,
    M1_i_11_0);
  output [0:0]O;
  input CLK;
  input SCLR;
  input [0:0]A;
  input [0:0]M1_i_11_0;

  wire [0:0]A;
  wire CLK;
  wire M1_i_10_n_0;
  wire [0:0]M1_i_11_0;
  wire M1_i_11_n_0;
  wire M1_i_12_n_0;
  wire M1_i_3_n_0;
  wire M1_i_4_n_0;
  wire M1_i_5_n_0;
  wire M1_i_6_n_0;
  wire M1_i_7_n_0;
  wire M1_i_8_n_0;
  wire M1_i_9_n_0;
  wire [0:0]O;
  wire SCLR;
  wire [47:0]\mult_outs[0]_0 ;
  wire [47:0]\mult_outs[1]_1 ;
  wire [47:0]NLW_M0_P_UNCONNECTED;
  wire [47:0]NLW_M1_C_UNCONNECTED;
  wire [8:0]NLW_M1_P_UNCONNECTED;
  wire [47:0]NLW_M1_PCOUT_UNCONNECTED;
  wire [2:0]NLW_M1_i_10_CO_UNCONNECTED;
  wire [3:0]NLW_M1_i_10_O_UNCONNECTED;
  wire [2:0]NLW_M1_i_11_CO_UNCONNECTED;
  wire [3:0]NLW_M1_i_11_O_UNCONNECTED;
  wire [3:0]NLW_M1_i_2_CO_UNCONNECTED;
  wire [3:0]NLW_M1_i_2_O_UNCONNECTED;
  wire [2:0]NLW_M1_i_3_CO_UNCONNECTED;
  wire [3:0]NLW_M1_i_3_O_UNCONNECTED;
  wire [2:0]NLW_M1_i_4_CO_UNCONNECTED;
  wire [3:0]NLW_M1_i_4_O_UNCONNECTED;
  wire [2:0]NLW_M1_i_5_CO_UNCONNECTED;
  wire [3:0]NLW_M1_i_5_O_UNCONNECTED;
  wire [2:0]NLW_M1_i_6_CO_UNCONNECTED;
  wire [3:0]NLW_M1_i_6_O_UNCONNECTED;
  wire [2:0]NLW_M1_i_7_CO_UNCONNECTED;
  wire [3:0]NLW_M1_i_7_O_UNCONNECTED;
  wire [2:0]NLW_M1_i_8_CO_UNCONNECTED;
  wire [3:0]NLW_M1_i_8_O_UNCONNECTED;
  wire [2:0]NLW_M1_i_9_CO_UNCONNECTED;
  wire [3:0]NLW_M1_i_9_O_UNCONNECTED;

  (* x_core_info = "xbip_multadd_v3_0_13,Vivado 2018.3.1" *) 
  Mult_Add_NC M0
       (.A({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,A,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .B({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b1,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .C({1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b0,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .CE(1'b1),
        .CLK(CLK),
        .P(NLW_M0_P_UNCONNECTED[47:0]),
        .PCOUT(\mult_outs[0]_0 ),
        .SCLR(SCLR),
        .SUBTRACT(1'b0));
  (* x_core_info = "xbip_multadd_v3_0_13,Vivado 2018.3.1" *) 
  Mult_Add_COL M1
       (.A({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,M1_i_11_0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .B({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b1,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .C(NLW_M1_C_UNCONNECTED[47:0]),
        .CE(1'b1),
        .CLK(CLK),
        .P({\mult_outs[1]_1 [47:9],NLW_M1_P_UNCONNECTED[8:0]}),
        .PCIN(\mult_outs[0]_0 ),
        .PCOUT(NLW_M1_PCOUT_UNCONNECTED[47:0]),
        .SCLR(SCLR),
        .SUBTRACT(1'b0));
  (* OPT_MODIFIED = "SWEEP " *) 
  CARRY4 M1_i_10
       (.CI(M1_i_11_n_0),
        .CO({M1_i_10_n_0,NLW_M1_i_10_CO_UNCONNECTED[2:0]}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(NLW_M1_i_10_O_UNCONNECTED[3:0]),
        .S(\mult_outs[1]_1 [16:13]));
  (* OPT_MODIFIED = "PROPCONST SWEEP " *) 
  CARRY4 M1_i_11
       (.CI(1'b0),
        .CO({M1_i_11_n_0,NLW_M1_i_11_CO_UNCONNECTED[2:0]}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,\mult_outs[1]_1 [9],1'b0}),
        .O(NLW_M1_i_11_O_UNCONNECTED[3:0]),
        .S({\mult_outs[1]_1 [12:11],M1_i_12_n_0,\mult_outs[1]_1 [9]}));
  LUT2 #(
    .INIT(4'h6)) 
    M1_i_12
       (.I0(\mult_outs[1]_1 [9]),
        .I1(\mult_outs[1]_1 [10]),
        .O(M1_i_12_n_0));
  (* OPT_MODIFIED = "SWEEP " *) 
  CARRY4 M1_i_2
       (.CI(M1_i_3_n_0),
        .CO(NLW_M1_i_2_CO_UNCONNECTED[3:0]),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({NLW_M1_i_2_O_UNCONNECTED[3],O,NLW_M1_i_2_O_UNCONNECTED[1:0]}),
        .S({1'b0,\mult_outs[1]_1 [47:45]}));
  (* OPT_MODIFIED = "SWEEP " *) 
  CARRY4 M1_i_3
       (.CI(M1_i_4_n_0),
        .CO({M1_i_3_n_0,NLW_M1_i_3_CO_UNCONNECTED[2:0]}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(NLW_M1_i_3_O_UNCONNECTED[3:0]),
        .S(\mult_outs[1]_1 [44:41]));
  (* OPT_MODIFIED = "SWEEP " *) 
  CARRY4 M1_i_4
       (.CI(M1_i_5_n_0),
        .CO({M1_i_4_n_0,NLW_M1_i_4_CO_UNCONNECTED[2:0]}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(NLW_M1_i_4_O_UNCONNECTED[3:0]),
        .S(\mult_outs[1]_1 [40:37]));
  (* OPT_MODIFIED = "SWEEP " *) 
  CARRY4 M1_i_5
       (.CI(M1_i_6_n_0),
        .CO({M1_i_5_n_0,NLW_M1_i_5_CO_UNCONNECTED[2:0]}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(NLW_M1_i_5_O_UNCONNECTED[3:0]),
        .S(\mult_outs[1]_1 [36:33]));
  (* OPT_MODIFIED = "SWEEP " *) 
  CARRY4 M1_i_6
       (.CI(M1_i_7_n_0),
        .CO({M1_i_6_n_0,NLW_M1_i_6_CO_UNCONNECTED[2:0]}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(NLW_M1_i_6_O_UNCONNECTED[3:0]),
        .S(\mult_outs[1]_1 [32:29]));
  (* OPT_MODIFIED = "SWEEP " *) 
  CARRY4 M1_i_7
       (.CI(M1_i_8_n_0),
        .CO({M1_i_7_n_0,NLW_M1_i_7_CO_UNCONNECTED[2:0]}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(NLW_M1_i_7_O_UNCONNECTED[3:0]),
        .S(\mult_outs[1]_1 [28:25]));
  (* OPT_MODIFIED = "SWEEP " *) 
  CARRY4 M1_i_8
       (.CI(M1_i_9_n_0),
        .CO({M1_i_8_n_0,NLW_M1_i_8_CO_UNCONNECTED[2:0]}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(NLW_M1_i_8_O_UNCONNECTED[3:0]),
        .S(\mult_outs[1]_1 [24:21]));
  (* OPT_MODIFIED = "SWEEP " *) 
  CARRY4 M1_i_9
       (.CI(M1_i_10_n_0),
        .CO({M1_i_9_n_0,NLW_M1_i_9_CO_UNCONNECTED[2:0]}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(NLW_M1_i_9_O_UNCONNECTED[3:0]),
        .S(\mult_outs[1]_1 [20:17]));
endmodule

(* ORIG_REF_NAME = "FC_Neuron" *) 
module FC_Neuron__parameterized0
   (O,
    CLK,
    SCLR,
    A,
    M0_i_11_0);
  output [0:0]O;
  input CLK;
  input SCLR;
  input [0:0]A;
  input [0:0]M0_i_11_0;

  wire [0:0]A;
  wire CLK;
  wire M0_i_10_n_0;
  wire [0:0]M0_i_11_0;
  wire M0_i_11_n_0;
  wire M0_i_12_n_0;
  wire M0_i_3_n_0;
  wire M0_i_4_n_0;
  wire M0_i_5_n_0;
  wire M0_i_6_n_0;
  wire M0_i_7_n_0;
  wire M0_i_8_n_0;
  wire M0_i_9_n_0;
  wire [0:0]O;
  wire SCLR;
  wire [47:0]\mult_outs[0]_2 ;
  wire [47:0]\mult_outs[1]_3 ;
  wire [47:0]NLW_M0_P_UNCONNECTED;
  wire [2:0]NLW_M0_i_10_CO_UNCONNECTED;
  wire [3:0]NLW_M0_i_10_O_UNCONNECTED;
  wire [2:0]NLW_M0_i_11_CO_UNCONNECTED;
  wire [3:0]NLW_M0_i_11_O_UNCONNECTED;
  wire [3:0]NLW_M0_i_2_CO_UNCONNECTED;
  wire [3:0]NLW_M0_i_2_O_UNCONNECTED;
  wire [2:0]NLW_M0_i_3_CO_UNCONNECTED;
  wire [3:0]NLW_M0_i_3_O_UNCONNECTED;
  wire [2:0]NLW_M0_i_4_CO_UNCONNECTED;
  wire [3:0]NLW_M0_i_4_O_UNCONNECTED;
  wire [2:0]NLW_M0_i_5_CO_UNCONNECTED;
  wire [3:0]NLW_M0_i_5_O_UNCONNECTED;
  wire [2:0]NLW_M0_i_6_CO_UNCONNECTED;
  wire [3:0]NLW_M0_i_6_O_UNCONNECTED;
  wire [2:0]NLW_M0_i_7_CO_UNCONNECTED;
  wire [3:0]NLW_M0_i_7_O_UNCONNECTED;
  wire [2:0]NLW_M0_i_8_CO_UNCONNECTED;
  wire [3:0]NLW_M0_i_8_O_UNCONNECTED;
  wire [2:0]NLW_M0_i_9_CO_UNCONNECTED;
  wire [3:0]NLW_M0_i_9_O_UNCONNECTED;
  wire [47:0]NLW_M1_C_UNCONNECTED;
  wire [8:0]NLW_M1_P_UNCONNECTED;
  wire [47:0]NLW_M1_PCOUT_UNCONNECTED;

  (* x_core_info = "xbip_multadd_v3_0_13,Vivado 2018.3.1" *) 
  Mult_Add_NC_HD3 M0
       (.A({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,A,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .B({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b1,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .C({1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b0,1'b0,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .CE(1'b1),
        .CLK(CLK),
        .P(NLW_M0_P_UNCONNECTED[47:0]),
        .PCOUT(\mult_outs[0]_2 ),
        .SCLR(SCLR),
        .SUBTRACT(1'b0));
  (* OPT_MODIFIED = "SWEEP " *) 
  CARRY4 M0_i_10
       (.CI(M0_i_11_n_0),
        .CO({M0_i_10_n_0,NLW_M0_i_10_CO_UNCONNECTED[2:0]}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(NLW_M0_i_10_O_UNCONNECTED[3:0]),
        .S(\mult_outs[1]_3 [16:13]));
  (* OPT_MODIFIED = "PROPCONST SWEEP " *) 
  CARRY4 M0_i_11
       (.CI(1'b0),
        .CO({M0_i_11_n_0,NLW_M0_i_11_CO_UNCONNECTED[2:0]}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,\mult_outs[1]_3 [9],1'b0}),
        .O(NLW_M0_i_11_O_UNCONNECTED[3:0]),
        .S({\mult_outs[1]_3 [12:11],M0_i_12_n_0,\mult_outs[1]_3 [9]}));
  LUT2 #(
    .INIT(4'h6)) 
    M0_i_12
       (.I0(\mult_outs[1]_3 [9]),
        .I1(\mult_outs[1]_3 [10]),
        .O(M0_i_12_n_0));
  (* OPT_MODIFIED = "SWEEP " *) 
  CARRY4 M0_i_2
       (.CI(M0_i_3_n_0),
        .CO(NLW_M0_i_2_CO_UNCONNECTED[3:0]),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({NLW_M0_i_2_O_UNCONNECTED[3],O,NLW_M0_i_2_O_UNCONNECTED[1:0]}),
        .S({1'b0,\mult_outs[1]_3 [47:45]}));
  (* OPT_MODIFIED = "SWEEP " *) 
  CARRY4 M0_i_3
       (.CI(M0_i_4_n_0),
        .CO({M0_i_3_n_0,NLW_M0_i_3_CO_UNCONNECTED[2:0]}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(NLW_M0_i_3_O_UNCONNECTED[3:0]),
        .S(\mult_outs[1]_3 [44:41]));
  (* OPT_MODIFIED = "SWEEP " *) 
  CARRY4 M0_i_4
       (.CI(M0_i_5_n_0),
        .CO({M0_i_4_n_0,NLW_M0_i_4_CO_UNCONNECTED[2:0]}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(NLW_M0_i_4_O_UNCONNECTED[3:0]),
        .S(\mult_outs[1]_3 [40:37]));
  (* OPT_MODIFIED = "SWEEP " *) 
  CARRY4 M0_i_5
       (.CI(M0_i_6_n_0),
        .CO({M0_i_5_n_0,NLW_M0_i_5_CO_UNCONNECTED[2:0]}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(NLW_M0_i_5_O_UNCONNECTED[3:0]),
        .S(\mult_outs[1]_3 [36:33]));
  (* OPT_MODIFIED = "SWEEP " *) 
  CARRY4 M0_i_6
       (.CI(M0_i_7_n_0),
        .CO({M0_i_6_n_0,NLW_M0_i_6_CO_UNCONNECTED[2:0]}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(NLW_M0_i_6_O_UNCONNECTED[3:0]),
        .S(\mult_outs[1]_3 [32:29]));
  (* OPT_MODIFIED = "SWEEP " *) 
  CARRY4 M0_i_7
       (.CI(M0_i_8_n_0),
        .CO({M0_i_7_n_0,NLW_M0_i_7_CO_UNCONNECTED[2:0]}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(NLW_M0_i_7_O_UNCONNECTED[3:0]),
        .S(\mult_outs[1]_3 [28:25]));
  (* OPT_MODIFIED = "SWEEP " *) 
  CARRY4 M0_i_8
       (.CI(M0_i_9_n_0),
        .CO({M0_i_8_n_0,NLW_M0_i_8_CO_UNCONNECTED[2:0]}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(NLW_M0_i_8_O_UNCONNECTED[3:0]),
        .S(\mult_outs[1]_3 [24:21]));
  (* OPT_MODIFIED = "SWEEP " *) 
  CARRY4 M0_i_9
       (.CI(M0_i_10_n_0),
        .CO({M0_i_9_n_0,NLW_M0_i_9_CO_UNCONNECTED[2:0]}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(NLW_M0_i_9_O_UNCONNECTED[3:0]),
        .S(\mult_outs[1]_3 [20:17]));
  (* x_core_info = "xbip_multadd_v3_0_13,Vivado 2018.3.1" *) 
  Mult_Add_COL_HD19 M1
       (.A({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,M0_i_11_0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .B({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b1,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .C(NLW_M1_C_UNCONNECTED[47:0]),
        .CE(1'b1),
        .CLK(CLK),
        .P({\mult_outs[1]_3 [47:9],NLW_M1_P_UNCONNECTED[8:0]}),
        .PCIN(\mult_outs[0]_2 ),
        .PCOUT(NLW_M1_PCOUT_UNCONNECTED[47:0]),
        .SCLR(SCLR),
        .SUBTRACT(1'b0));
endmodule

(* ORIG_REF_NAME = "FC_Neuron" *) 
module FC_Neuron__parameterized1
   (SCLR,
    O,
    CLK,
    reset_n_IBUF,
    M1_0,
    M0_0);
  output SCLR;
  output [0:0]O;
  input CLK;
  input reset_n_IBUF;
  input [0:0]M1_0;
  input [0:0]M0_0;

  wire CLK;
  wire [0:0]M0_0;
  wire [0:0]M1_0;
  wire [10:10]N1_wires;
  wire [10:10]N2_wires;
  wire [0:0]O;
  wire SCLR;
  wire [47:0]\mult_outs[0]_4 ;
  wire [47:0]\mult_outs[1]_5 ;
  wire out_i_12_n_0;
  wire out_reg_i_10_n_0;
  wire out_reg_i_11_n_0;
  wire out_reg_i_3_n_0;
  wire out_reg_i_4_n_0;
  wire out_reg_i_5_n_0;
  wire out_reg_i_6_n_0;
  wire out_reg_i_7_n_0;
  wire out_reg_i_8_n_0;
  wire out_reg_i_9_n_0;
  wire reset_n_IBUF;
  wire [47:0]NLW_M0_P_UNCONNECTED;
  wire [47:0]NLW_M1_C_UNCONNECTED;
  wire [8:0]NLW_M1_P_UNCONNECTED;
  wire [47:0]NLW_M1_PCOUT_UNCONNECTED;
  wire [2:0]NLW_out_reg_i_10_CO_UNCONNECTED;
  wire [3:0]NLW_out_reg_i_10_O_UNCONNECTED;
  wire [2:0]NLW_out_reg_i_11_CO_UNCONNECTED;
  wire [3:0]NLW_out_reg_i_11_O_UNCONNECTED;
  wire [3:0]NLW_out_reg_i_2_CO_UNCONNECTED;
  wire [3:0]NLW_out_reg_i_2_O_UNCONNECTED;
  wire [2:0]NLW_out_reg_i_3_CO_UNCONNECTED;
  wire [3:0]NLW_out_reg_i_3_O_UNCONNECTED;
  wire [2:0]NLW_out_reg_i_4_CO_UNCONNECTED;
  wire [3:0]NLW_out_reg_i_4_O_UNCONNECTED;
  wire [2:0]NLW_out_reg_i_5_CO_UNCONNECTED;
  wire [3:0]NLW_out_reg_i_5_O_UNCONNECTED;
  wire [2:0]NLW_out_reg_i_6_CO_UNCONNECTED;
  wire [3:0]NLW_out_reg_i_6_O_UNCONNECTED;
  wire [2:0]NLW_out_reg_i_7_CO_UNCONNECTED;
  wire [3:0]NLW_out_reg_i_7_O_UNCONNECTED;
  wire [2:0]NLW_out_reg_i_8_CO_UNCONNECTED;
  wire [3:0]NLW_out_reg_i_8_O_UNCONNECTED;
  wire [2:0]NLW_out_reg_i_9_CO_UNCONNECTED;
  wire [3:0]NLW_out_reg_i_9_O_UNCONNECTED;

  (* x_core_info = "xbip_multadd_v3_0_13,Vivado 2018.3.1" *) 
  Mult_Add_NC_HD10 M0
       (.A({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,N2_wires,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .B({1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b0,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1}),
        .C({1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b0,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .CE(1'b1),
        .CLK(CLK),
        .P(NLW_M0_P_UNCONNECTED[47:0]),
        .PCOUT(\mult_outs[0]_4 ),
        .SCLR(SCLR),
        .SUBTRACT(1'b0));
  LUT1 #(
    .INIT(2'h1)) 
    M0_i_1
       (.I0(M0_0),
        .O(N2_wires));
  LUT1 #(
    .INIT(2'h1)) 
    M0_i_1__0
       (.I0(reset_n_IBUF),
        .O(SCLR));
  (* x_core_info = "xbip_multadd_v3_0_13,Vivado 2018.3.1" *) 
  Mult_Add_COL_HD26 M1
       (.A({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,N1_wires,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .B({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b1,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .C(NLW_M1_C_UNCONNECTED[47:0]),
        .CE(1'b1),
        .CLK(CLK),
        .P({\mult_outs[1]_5 [47:9],NLW_M1_P_UNCONNECTED[8:0]}),
        .PCIN(\mult_outs[0]_4 ),
        .PCOUT(NLW_M1_PCOUT_UNCONNECTED[47:0]),
        .SCLR(SCLR),
        .SUBTRACT(1'b0));
  LUT1 #(
    .INIT(2'h1)) 
    M1_i_1
       (.I0(M1_0),
        .O(N1_wires));
  LUT2 #(
    .INIT(4'h6)) 
    out_i_12
       (.I0(\mult_outs[1]_5 [9]),
        .I1(\mult_outs[1]_5 [10]),
        .O(out_i_12_n_0));
  (* OPT_MODIFIED = "SWEEP " *) 
  CARRY4 out_reg_i_10
       (.CI(out_reg_i_11_n_0),
        .CO({out_reg_i_10_n_0,NLW_out_reg_i_10_CO_UNCONNECTED[2:0]}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(NLW_out_reg_i_10_O_UNCONNECTED[3:0]),
        .S(\mult_outs[1]_5 [16:13]));
  (* OPT_MODIFIED = "PROPCONST SWEEP " *) 
  CARRY4 out_reg_i_11
       (.CI(1'b0),
        .CO({out_reg_i_11_n_0,NLW_out_reg_i_11_CO_UNCONNECTED[2:0]}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,\mult_outs[1]_5 [9],1'b0}),
        .O(NLW_out_reg_i_11_O_UNCONNECTED[3:0]),
        .S({\mult_outs[1]_5 [12:11],out_i_12_n_0,\mult_outs[1]_5 [9]}));
  (* OPT_MODIFIED = "SWEEP " *) 
  CARRY4 out_reg_i_2
       (.CI(out_reg_i_3_n_0),
        .CO(NLW_out_reg_i_2_CO_UNCONNECTED[3:0]),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({NLW_out_reg_i_2_O_UNCONNECTED[3],O,NLW_out_reg_i_2_O_UNCONNECTED[1:0]}),
        .S({1'b0,\mult_outs[1]_5 [47:45]}));
  (* OPT_MODIFIED = "SWEEP " *) 
  CARRY4 out_reg_i_3
       (.CI(out_reg_i_4_n_0),
        .CO({out_reg_i_3_n_0,NLW_out_reg_i_3_CO_UNCONNECTED[2:0]}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(NLW_out_reg_i_3_O_UNCONNECTED[3:0]),
        .S(\mult_outs[1]_5 [44:41]));
  (* OPT_MODIFIED = "SWEEP " *) 
  CARRY4 out_reg_i_4
       (.CI(out_reg_i_5_n_0),
        .CO({out_reg_i_4_n_0,NLW_out_reg_i_4_CO_UNCONNECTED[2:0]}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(NLW_out_reg_i_4_O_UNCONNECTED[3:0]),
        .S(\mult_outs[1]_5 [40:37]));
  (* OPT_MODIFIED = "SWEEP " *) 
  CARRY4 out_reg_i_5
       (.CI(out_reg_i_6_n_0),
        .CO({out_reg_i_5_n_0,NLW_out_reg_i_5_CO_UNCONNECTED[2:0]}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(NLW_out_reg_i_5_O_UNCONNECTED[3:0]),
        .S(\mult_outs[1]_5 [36:33]));
  (* OPT_MODIFIED = "SWEEP " *) 
  CARRY4 out_reg_i_6
       (.CI(out_reg_i_7_n_0),
        .CO({out_reg_i_6_n_0,NLW_out_reg_i_6_CO_UNCONNECTED[2:0]}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(NLW_out_reg_i_6_O_UNCONNECTED[3:0]),
        .S(\mult_outs[1]_5 [32:29]));
  (* OPT_MODIFIED = "SWEEP " *) 
  CARRY4 out_reg_i_7
       (.CI(out_reg_i_8_n_0),
        .CO({out_reg_i_7_n_0,NLW_out_reg_i_7_CO_UNCONNECTED[2:0]}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(NLW_out_reg_i_7_O_UNCONNECTED[3:0]),
        .S(\mult_outs[1]_5 [28:25]));
  (* OPT_MODIFIED = "SWEEP " *) 
  CARRY4 out_reg_i_8
       (.CI(out_reg_i_9_n_0),
        .CO({out_reg_i_8_n_0,NLW_out_reg_i_8_CO_UNCONNECTED[2:0]}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(NLW_out_reg_i_8_O_UNCONNECTED[3:0]),
        .S(\mult_outs[1]_5 [24:21]));
  (* OPT_MODIFIED = "SWEEP " *) 
  CARRY4 out_reg_i_9
       (.CI(out_reg_i_10_n_0),
        .CO({out_reg_i_9_n_0,NLW_out_reg_i_9_CO_UNCONNECTED[2:0]}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(NLW_out_reg_i_9_O_UNCONNECTED[3:0]),
        .S(\mult_outs[1]_5 [20:17]));
endmodule

(* CHECK_LICENSE_TYPE = "Mult_Add_COL,xbip_multadd_v3_0_13,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "xbip_multadd_v3_0_13,Vivado 2018.3.1" *) 
module Mult_Add_COL
   (CLK,
    CE,
    SCLR,
    A,
    B,
    C,
    PCIN,
    SUBTRACT,
    P,
    PCOUT);
  (* x_interface_info = "xilinx.com:signal:clock:1.0 clk_intf CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME clk_intf, ASSOCIATED_BUSIF pcout_intf:p_intf:subtract_intf:pcin_intf:c_intf:b_intf:a_intf, ASSOCIATED_RESET SCLR, ASSOCIATED_CLKEN CE, FREQ_HZ 100000000, PHASE 0.000, INSERT_VIP 0" *) input CLK;
  (* x_interface_info = "xilinx.com:signal:clockenable:1.0 ce_intf CE" *) (* x_interface_parameter = "XIL_INTERFACENAME ce_intf, POLARITY ACTIVE_LOW" *) input CE;
  (* x_interface_info = "xilinx.com:signal:reset:1.0 sclr_intf RST" *) (* x_interface_parameter = "XIL_INTERFACENAME sclr_intf, POLARITY ACTIVE_HIGH, INSERT_VIP 0" *) input SCLR;
  (* x_interface_info = "xilinx.com:signal:data:1.0 a_intf DATA" *) (* x_interface_parameter = "XIL_INTERFACENAME a_intf, LAYERED_METADATA undef" *) input [24:0]A;
  (* x_interface_info = "xilinx.com:signal:data:1.0 b_intf DATA" *) (* x_interface_parameter = "XIL_INTERFACENAME b_intf, LAYERED_METADATA undef" *) input [17:0]B;
  (* x_interface_info = "xilinx.com:signal:data:1.0 c_intf DATA" *) (* x_interface_parameter = "XIL_INTERFACENAME c_intf, LAYERED_METADATA undef" *) input [47:0]C;
  (* x_interface_info = "xilinx.com:signal:data:1.0 pcin_intf DATA" *) (* x_interface_parameter = "XIL_INTERFACENAME pcin_intf, LAYERED_METADATA undef" *) input [47:0]PCIN;
  (* x_interface_info = "xilinx.com:signal:data:1.0 subtract_intf DATA" *) (* x_interface_parameter = "XIL_INTERFACENAME subtract_intf, LAYERED_METADATA undef" *) input SUBTRACT;
  (* x_interface_info = "xilinx.com:signal:data:1.0 p_intf DATA" *) (* x_interface_parameter = "XIL_INTERFACENAME p_intf, LAYERED_METADATA undef" *) output [47:0]P;
  (* x_interface_info = "xilinx.com:signal:data:1.0 pcout_intf DATA" *) (* x_interface_parameter = "XIL_INTERFACENAME pcout_intf, LAYERED_METADATA undef" *) output [47:0]PCOUT;

  wire [24:0]A;
  wire [17:0]B;
  wire CE;
  wire CLK;
  wire [47:0]P;
  wire [47:0]PCIN;
  wire SCLR;
  wire SUBTRACT;
  wire [47:0]NLW_U0_C_UNCONNECTED;
  wire [8:0]NLW_U0_P_UNCONNECTED;
  wire [47:0]NLW_U0_PCOUT_UNCONNECTED;

  (* C_AB_LATENCY = "-1" *) 
  (* C_A_TYPE = "0" *) 
  (* C_A_WIDTH = "25" *) 
  (* C_B_TYPE = "0" *) 
  (* C_B_WIDTH = "18" *) 
  (* C_CE_OVERRIDES_SCLR = "0" *) 
  (* C_C_LATENCY = "0" *) 
  (* C_C_TYPE = "0" *) 
  (* C_C_WIDTH = "48" *) 
  (* C_OUT_HIGH = "47" *) 
  (* C_OUT_LOW = "0" *) 
  (* C_TEST_CORE = "0" *) 
  (* C_USE_PCIN = "1" *) 
  (* C_VERBOSITY = "0" *) 
  (* C_XDEVICEFAMILY = "artix7" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  Mult_Add_COL_xbip_multadd_v3_0_13 U0
       (.A(A),
        .B(B),
        .C(NLW_U0_C_UNCONNECTED[47:0]),
        .CE(CE),
        .CLK(CLK),
        .P({P[47:9],NLW_U0_P_UNCONNECTED[8:0]}),
        .PCIN(PCIN),
        .PCOUT(NLW_U0_PCOUT_UNCONNECTED[47:0]),
        .SCLR(SCLR),
        .SUBTRACT(SUBTRACT));
endmodule

(* CHECK_LICENSE_TYPE = "Mult_Add_COL,xbip_multadd_v3_0_13,{}" *) (* ORIG_REF_NAME = "Mult_Add_COL" *) (* downgradeipidentifiedwarnings = "yes" *) 
(* x_core_info = "xbip_multadd_v3_0_13,Vivado 2018.3.1" *) 
module Mult_Add_COL_HD19
   (CLK,
    CE,
    SCLR,
    SUBTRACT,
    A,
    B,
    C,
    PCIN,
    P,
    PCOUT);
  (* x_interface_info = "xilinx.com:signal:clock:1.0 clk_intf CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME clk_intf, ASSOCIATED_BUSIF pcout_intf:p_intf:subtract_intf:pcin_intf:c_intf:b_intf:a_intf, ASSOCIATED_RESET SCLR, ASSOCIATED_CLKEN CE, FREQ_HZ 100000000, PHASE 0.000, INSERT_VIP 0" *) input CLK;
  (* x_interface_info = "xilinx.com:signal:clockenable:1.0 ce_intf CE" *) (* x_interface_parameter = "XIL_INTERFACENAME ce_intf, POLARITY ACTIVE_LOW" *) input CE;
  (* x_interface_info = "xilinx.com:signal:reset:1.0 sclr_intf RST" *) (* x_interface_parameter = "XIL_INTERFACENAME sclr_intf, POLARITY ACTIVE_HIGH, INSERT_VIP 0" *) input SCLR;
  (* x_interface_info = "xilinx.com:signal:data:1.0 subtract_intf DATA" *) (* x_interface_parameter = "XIL_INTERFACENAME subtract_intf, LAYERED_METADATA undef" *) input SUBTRACT;
  (* x_interface_info = "xilinx.com:signal:data:1.0 a_intf DATA" *) (* x_interface_parameter = "XIL_INTERFACENAME a_intf, LAYERED_METADATA undef" *) input [24:0]A;
  (* x_interface_info = "xilinx.com:signal:data:1.0 b_intf DATA" *) (* x_interface_parameter = "XIL_INTERFACENAME b_intf, LAYERED_METADATA undef" *) input [17:0]B;
  (* x_interface_info = "xilinx.com:signal:data:1.0 c_intf DATA" *) (* x_interface_parameter = "XIL_INTERFACENAME c_intf, LAYERED_METADATA undef" *) input [47:0]C;
  (* x_interface_info = "xilinx.com:signal:data:1.0 pcin_intf DATA" *) (* x_interface_parameter = "XIL_INTERFACENAME pcin_intf, LAYERED_METADATA undef" *) input [47:0]PCIN;
  (* x_interface_info = "xilinx.com:signal:data:1.0 p_intf DATA" *) (* x_interface_parameter = "XIL_INTERFACENAME p_intf, LAYERED_METADATA undef" *) output [47:0]P;
  (* x_interface_info = "xilinx.com:signal:data:1.0 pcout_intf DATA" *) (* x_interface_parameter = "XIL_INTERFACENAME pcout_intf, LAYERED_METADATA undef" *) output [47:0]PCOUT;

  wire [24:0]A;
  wire [17:0]B;
  wire CE;
  wire CLK;
  wire [47:0]P;
  wire [47:0]PCIN;
  wire SCLR;
  wire SUBTRACT;
  wire [47:0]NLW_U0_C_UNCONNECTED;
  wire [8:0]NLW_U0_P_UNCONNECTED;
  wire [47:0]NLW_U0_PCOUT_UNCONNECTED;

  (* C_AB_LATENCY = "-1" *) 
  (* C_A_TYPE = "0" *) 
  (* C_A_WIDTH = "25" *) 
  (* C_B_TYPE = "0" *) 
  (* C_B_WIDTH = "18" *) 
  (* C_CE_OVERRIDES_SCLR = "0" *) 
  (* C_C_LATENCY = "0" *) 
  (* C_C_TYPE = "0" *) 
  (* C_C_WIDTH = "48" *) 
  (* C_OUT_HIGH = "47" *) 
  (* C_OUT_LOW = "0" *) 
  (* C_TEST_CORE = "0" *) 
  (* C_USE_PCIN = "1" *) 
  (* C_VERBOSITY = "0" *) 
  (* C_XDEVICEFAMILY = "artix7" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  Mult_Add_COL_xbip_multadd_v3_0_13_HD20 U0
       (.A(A),
        .B(B),
        .C(NLW_U0_C_UNCONNECTED[47:0]),
        .CE(CE),
        .CLK(CLK),
        .P({P[47:9],NLW_U0_P_UNCONNECTED[8:0]}),
        .PCIN(PCIN),
        .PCOUT(NLW_U0_PCOUT_UNCONNECTED[47:0]),
        .SCLR(SCLR),
        .SUBTRACT(SUBTRACT));
endmodule

(* CHECK_LICENSE_TYPE = "Mult_Add_COL,xbip_multadd_v3_0_13,{}" *) (* ORIG_REF_NAME = "Mult_Add_COL" *) (* downgradeipidentifiedwarnings = "yes" *) 
(* x_core_info = "xbip_multadd_v3_0_13,Vivado 2018.3.1" *) 
module Mult_Add_COL_HD26
   (CLK,
    CE,
    SCLR,
    SUBTRACT,
    A,
    B,
    C,
    PCIN,
    P,
    PCOUT);
  (* x_interface_info = "xilinx.com:signal:clock:1.0 clk_intf CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME clk_intf, ASSOCIATED_BUSIF pcout_intf:p_intf:subtract_intf:pcin_intf:c_intf:b_intf:a_intf, ASSOCIATED_RESET SCLR, ASSOCIATED_CLKEN CE, FREQ_HZ 100000000, PHASE 0.000, INSERT_VIP 0" *) input CLK;
  (* x_interface_info = "xilinx.com:signal:clockenable:1.0 ce_intf CE" *) (* x_interface_parameter = "XIL_INTERFACENAME ce_intf, POLARITY ACTIVE_LOW" *) input CE;
  (* x_interface_info = "xilinx.com:signal:reset:1.0 sclr_intf RST" *) (* x_interface_parameter = "XIL_INTERFACENAME sclr_intf, POLARITY ACTIVE_HIGH, INSERT_VIP 0" *) input SCLR;
  (* x_interface_info = "xilinx.com:signal:data:1.0 subtract_intf DATA" *) (* x_interface_parameter = "XIL_INTERFACENAME subtract_intf, LAYERED_METADATA undef" *) input SUBTRACT;
  (* x_interface_info = "xilinx.com:signal:data:1.0 a_intf DATA" *) (* x_interface_parameter = "XIL_INTERFACENAME a_intf, LAYERED_METADATA undef" *) input [24:0]A;
  (* x_interface_info = "xilinx.com:signal:data:1.0 b_intf DATA" *) (* x_interface_parameter = "XIL_INTERFACENAME b_intf, LAYERED_METADATA undef" *) input [17:0]B;
  (* x_interface_info = "xilinx.com:signal:data:1.0 c_intf DATA" *) (* x_interface_parameter = "XIL_INTERFACENAME c_intf, LAYERED_METADATA undef" *) input [47:0]C;
  (* x_interface_info = "xilinx.com:signal:data:1.0 pcin_intf DATA" *) (* x_interface_parameter = "XIL_INTERFACENAME pcin_intf, LAYERED_METADATA undef" *) input [47:0]PCIN;
  (* x_interface_info = "xilinx.com:signal:data:1.0 p_intf DATA" *) (* x_interface_parameter = "XIL_INTERFACENAME p_intf, LAYERED_METADATA undef" *) output [47:0]P;
  (* x_interface_info = "xilinx.com:signal:data:1.0 pcout_intf DATA" *) (* x_interface_parameter = "XIL_INTERFACENAME pcout_intf, LAYERED_METADATA undef" *) output [47:0]PCOUT;

  wire [24:0]A;
  wire [17:0]B;
  wire CE;
  wire CLK;
  wire [47:0]P;
  wire [47:0]PCIN;
  wire SCLR;
  wire SUBTRACT;
  wire [47:0]NLW_U0_C_UNCONNECTED;
  wire [8:0]NLW_U0_P_UNCONNECTED;
  wire [47:0]NLW_U0_PCOUT_UNCONNECTED;

  (* C_AB_LATENCY = "-1" *) 
  (* C_A_TYPE = "0" *) 
  (* C_A_WIDTH = "25" *) 
  (* C_B_TYPE = "0" *) 
  (* C_B_WIDTH = "18" *) 
  (* C_CE_OVERRIDES_SCLR = "0" *) 
  (* C_C_LATENCY = "0" *) 
  (* C_C_TYPE = "0" *) 
  (* C_C_WIDTH = "48" *) 
  (* C_OUT_HIGH = "47" *) 
  (* C_OUT_LOW = "0" *) 
  (* C_TEST_CORE = "0" *) 
  (* C_USE_PCIN = "1" *) 
  (* C_VERBOSITY = "0" *) 
  (* C_XDEVICEFAMILY = "artix7" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  Mult_Add_COL_xbip_multadd_v3_0_13_HD27 U0
       (.A(A),
        .B(B),
        .C(NLW_U0_C_UNCONNECTED[47:0]),
        .CE(CE),
        .CLK(CLK),
        .P({P[47:9],NLW_U0_P_UNCONNECTED[8:0]}),
        .PCIN(PCIN),
        .PCOUT(NLW_U0_PCOUT_UNCONNECTED[47:0]),
        .SCLR(SCLR),
        .SUBTRACT(SUBTRACT));
endmodule

(* CHECK_LICENSE_TYPE = "Mult_Add_NC,xbip_multadd_v3_0_13,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "xbip_multadd_v3_0_13,Vivado 2018.3.1" *) 
module Mult_Add_NC
   (CLK,
    CE,
    SCLR,
    A,
    B,
    C,
    SUBTRACT,
    P,
    PCOUT);
  (* x_interface_info = "xilinx.com:signal:clock:1.0 clk_intf CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME clk_intf, ASSOCIATED_BUSIF pcout_intf:p_intf:subtract_intf:pcin_intf:c_intf:b_intf:a_intf, ASSOCIATED_RESET SCLR, ASSOCIATED_CLKEN CE, FREQ_HZ 100000000, PHASE 0.000, INSERT_VIP 0" *) input CLK;
  (* x_interface_info = "xilinx.com:signal:clockenable:1.0 ce_intf CE" *) (* x_interface_parameter = "XIL_INTERFACENAME ce_intf, POLARITY ACTIVE_LOW" *) input CE;
  (* x_interface_info = "xilinx.com:signal:reset:1.0 sclr_intf RST" *) (* x_interface_parameter = "XIL_INTERFACENAME sclr_intf, POLARITY ACTIVE_HIGH, INSERT_VIP 0" *) input SCLR;
  (* x_interface_info = "xilinx.com:signal:data:1.0 a_intf DATA" *) (* x_interface_parameter = "XIL_INTERFACENAME a_intf, LAYERED_METADATA undef" *) input [24:0]A;
  (* x_interface_info = "xilinx.com:signal:data:1.0 b_intf DATA" *) (* x_interface_parameter = "XIL_INTERFACENAME b_intf, LAYERED_METADATA undef" *) input [17:0]B;
  (* x_interface_info = "xilinx.com:signal:data:1.0 c_intf DATA" *) (* x_interface_parameter = "XIL_INTERFACENAME c_intf, LAYERED_METADATA undef" *) input [47:0]C;
  (* x_interface_info = "xilinx.com:signal:data:1.0 subtract_intf DATA" *) (* x_interface_parameter = "XIL_INTERFACENAME subtract_intf, LAYERED_METADATA undef" *) input SUBTRACT;
  (* x_interface_info = "xilinx.com:signal:data:1.0 p_intf DATA" *) (* x_interface_parameter = "XIL_INTERFACENAME p_intf, LAYERED_METADATA undef" *) output [47:0]P;
  (* x_interface_info = "xilinx.com:signal:data:1.0 pcout_intf DATA" *) (* x_interface_parameter = "XIL_INTERFACENAME pcout_intf, LAYERED_METADATA undef" *) output [47:0]PCOUT;

  wire [24:0]A;
  wire [17:0]B;
  wire [47:0]C;
  wire CE;
  wire CLK;
  wire [47:0]PCOUT;
  wire SCLR;
  wire SUBTRACT;
  wire [47:0]NLW_U0_P_UNCONNECTED;
  wire [47:0]NLW_U0_PCIN_UNCONNECTED;

  (* C_AB_LATENCY = "-1" *) 
  (* C_A_TYPE = "0" *) 
  (* C_A_WIDTH = "25" *) 
  (* C_B_TYPE = "0" *) 
  (* C_B_WIDTH = "18" *) 
  (* C_CE_OVERRIDES_SCLR = "0" *) 
  (* C_C_LATENCY = "-1" *) 
  (* C_C_TYPE = "0" *) 
  (* C_C_WIDTH = "48" *) 
  (* C_OUT_HIGH = "47" *) 
  (* C_OUT_LOW = "0" *) 
  (* C_TEST_CORE = "0" *) 
  (* C_USE_PCIN = "0" *) 
  (* C_VERBOSITY = "0" *) 
  (* C_XDEVICEFAMILY = "artix7" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  Mult_Add_NC_xbip_multadd_v3_0_13 U0
       (.A(A),
        .B(B),
        .C(C),
        .CE(CE),
        .CLK(CLK),
        .P(NLW_U0_P_UNCONNECTED[47:0]),
        .PCIN(NLW_U0_PCIN_UNCONNECTED[47:0]),
        .PCOUT(PCOUT),
        .SCLR(SCLR),
        .SUBTRACT(SUBTRACT));
endmodule

(* CHECK_LICENSE_TYPE = "Mult_Add_NC,xbip_multadd_v3_0_13,{}" *) (* ORIG_REF_NAME = "Mult_Add_NC" *) (* downgradeipidentifiedwarnings = "yes" *) 
(* x_core_info = "xbip_multadd_v3_0_13,Vivado 2018.3.1" *) 
module Mult_Add_NC_HD10
   (CLK,
    CE,
    SCLR,
    SUBTRACT,
    A,
    B,
    C,
    P,
    PCOUT);
  (* x_interface_info = "xilinx.com:signal:clock:1.0 clk_intf CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME clk_intf, ASSOCIATED_BUSIF pcout_intf:p_intf:subtract_intf:pcin_intf:c_intf:b_intf:a_intf, ASSOCIATED_RESET SCLR, ASSOCIATED_CLKEN CE, FREQ_HZ 100000000, PHASE 0.000, INSERT_VIP 0" *) input CLK;
  (* x_interface_info = "xilinx.com:signal:clockenable:1.0 ce_intf CE" *) (* x_interface_parameter = "XIL_INTERFACENAME ce_intf, POLARITY ACTIVE_LOW" *) input CE;
  (* x_interface_info = "xilinx.com:signal:reset:1.0 sclr_intf RST" *) (* x_interface_parameter = "XIL_INTERFACENAME sclr_intf, POLARITY ACTIVE_HIGH, INSERT_VIP 0" *) input SCLR;
  (* x_interface_info = "xilinx.com:signal:data:1.0 subtract_intf DATA" *) (* x_interface_parameter = "XIL_INTERFACENAME subtract_intf, LAYERED_METADATA undef" *) input SUBTRACT;
  (* x_interface_info = "xilinx.com:signal:data:1.0 a_intf DATA" *) (* x_interface_parameter = "XIL_INTERFACENAME a_intf, LAYERED_METADATA undef" *) input [24:0]A;
  (* x_interface_info = "xilinx.com:signal:data:1.0 b_intf DATA" *) (* x_interface_parameter = "XIL_INTERFACENAME b_intf, LAYERED_METADATA undef" *) input [17:0]B;
  (* x_interface_info = "xilinx.com:signal:data:1.0 c_intf DATA" *) (* x_interface_parameter = "XIL_INTERFACENAME c_intf, LAYERED_METADATA undef" *) input [47:0]C;
  (* x_interface_info = "xilinx.com:signal:data:1.0 p_intf DATA" *) (* x_interface_parameter = "XIL_INTERFACENAME p_intf, LAYERED_METADATA undef" *) output [47:0]P;
  (* x_interface_info = "xilinx.com:signal:data:1.0 pcout_intf DATA" *) (* x_interface_parameter = "XIL_INTERFACENAME pcout_intf, LAYERED_METADATA undef" *) output [47:0]PCOUT;

  wire [24:0]A;
  wire [17:0]B;
  wire [47:0]C;
  wire CE;
  wire CLK;
  wire [47:0]PCOUT;
  wire SCLR;
  wire SUBTRACT;
  wire [47:0]NLW_U0_P_UNCONNECTED;
  wire [47:0]NLW_U0_PCIN_UNCONNECTED;

  (* C_AB_LATENCY = "-1" *) 
  (* C_A_TYPE = "0" *) 
  (* C_A_WIDTH = "25" *) 
  (* C_B_TYPE = "0" *) 
  (* C_B_WIDTH = "18" *) 
  (* C_CE_OVERRIDES_SCLR = "0" *) 
  (* C_C_LATENCY = "-1" *) 
  (* C_C_TYPE = "0" *) 
  (* C_C_WIDTH = "48" *) 
  (* C_OUT_HIGH = "47" *) 
  (* C_OUT_LOW = "0" *) 
  (* C_TEST_CORE = "0" *) 
  (* C_USE_PCIN = "0" *) 
  (* C_VERBOSITY = "0" *) 
  (* C_XDEVICEFAMILY = "artix7" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  Mult_Add_NC_xbip_multadd_v3_0_13_HD11 U0
       (.A(A),
        .B(B),
        .C(C),
        .CE(CE),
        .CLK(CLK),
        .P(NLW_U0_P_UNCONNECTED[47:0]),
        .PCIN(NLW_U0_PCIN_UNCONNECTED[47:0]),
        .PCOUT(PCOUT),
        .SCLR(SCLR),
        .SUBTRACT(SUBTRACT));
endmodule

(* CHECK_LICENSE_TYPE = "Mult_Add_NC,xbip_multadd_v3_0_13,{}" *) (* ORIG_REF_NAME = "Mult_Add_NC" *) (* downgradeipidentifiedwarnings = "yes" *) 
(* x_core_info = "xbip_multadd_v3_0_13,Vivado 2018.3.1" *) 
module Mult_Add_NC_HD3
   (CLK,
    CE,
    SCLR,
    SUBTRACT,
    A,
    B,
    C,
    P,
    PCOUT);
  (* x_interface_info = "xilinx.com:signal:clock:1.0 clk_intf CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME clk_intf, ASSOCIATED_BUSIF pcout_intf:p_intf:subtract_intf:pcin_intf:c_intf:b_intf:a_intf, ASSOCIATED_RESET SCLR, ASSOCIATED_CLKEN CE, FREQ_HZ 100000000, PHASE 0.000, INSERT_VIP 0" *) input CLK;
  (* x_interface_info = "xilinx.com:signal:clockenable:1.0 ce_intf CE" *) (* x_interface_parameter = "XIL_INTERFACENAME ce_intf, POLARITY ACTIVE_LOW" *) input CE;
  (* x_interface_info = "xilinx.com:signal:reset:1.0 sclr_intf RST" *) (* x_interface_parameter = "XIL_INTERFACENAME sclr_intf, POLARITY ACTIVE_HIGH, INSERT_VIP 0" *) input SCLR;
  (* x_interface_info = "xilinx.com:signal:data:1.0 subtract_intf DATA" *) (* x_interface_parameter = "XIL_INTERFACENAME subtract_intf, LAYERED_METADATA undef" *) input SUBTRACT;
  (* x_interface_info = "xilinx.com:signal:data:1.0 a_intf DATA" *) (* x_interface_parameter = "XIL_INTERFACENAME a_intf, LAYERED_METADATA undef" *) input [24:0]A;
  (* x_interface_info = "xilinx.com:signal:data:1.0 b_intf DATA" *) (* x_interface_parameter = "XIL_INTERFACENAME b_intf, LAYERED_METADATA undef" *) input [17:0]B;
  (* x_interface_info = "xilinx.com:signal:data:1.0 c_intf DATA" *) (* x_interface_parameter = "XIL_INTERFACENAME c_intf, LAYERED_METADATA undef" *) input [47:0]C;
  (* x_interface_info = "xilinx.com:signal:data:1.0 p_intf DATA" *) (* x_interface_parameter = "XIL_INTERFACENAME p_intf, LAYERED_METADATA undef" *) output [47:0]P;
  (* x_interface_info = "xilinx.com:signal:data:1.0 pcout_intf DATA" *) (* x_interface_parameter = "XIL_INTERFACENAME pcout_intf, LAYERED_METADATA undef" *) output [47:0]PCOUT;

  wire [24:0]A;
  wire [17:0]B;
  wire [47:0]C;
  wire CE;
  wire CLK;
  wire [47:0]PCOUT;
  wire SCLR;
  wire SUBTRACT;
  wire [47:0]NLW_U0_P_UNCONNECTED;
  wire [47:0]NLW_U0_PCIN_UNCONNECTED;

  (* C_AB_LATENCY = "-1" *) 
  (* C_A_TYPE = "0" *) 
  (* C_A_WIDTH = "25" *) 
  (* C_B_TYPE = "0" *) 
  (* C_B_WIDTH = "18" *) 
  (* C_CE_OVERRIDES_SCLR = "0" *) 
  (* C_C_LATENCY = "-1" *) 
  (* C_C_TYPE = "0" *) 
  (* C_C_WIDTH = "48" *) 
  (* C_OUT_HIGH = "47" *) 
  (* C_OUT_LOW = "0" *) 
  (* C_TEST_CORE = "0" *) 
  (* C_USE_PCIN = "0" *) 
  (* C_VERBOSITY = "0" *) 
  (* C_XDEVICEFAMILY = "artix7" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  Mult_Add_NC_xbip_multadd_v3_0_13_HD4 U0
       (.A(A),
        .B(B),
        .C(C),
        .CE(CE),
        .CLK(CLK),
        .P(NLW_U0_P_UNCONNECTED[47:0]),
        .PCIN(NLW_U0_PCIN_UNCONNECTED[47:0]),
        .PCOUT(PCOUT),
        .SCLR(SCLR),
        .SUBTRACT(SUBTRACT));
endmodule

(* ECO_CHECKSUM = "47393685" *) 
(* NotValidForBitStream *)
module Top
   (clock,
    reset_n,
    x,
    y,
    out);
  input clock;
  input reset_n;
  input x;
  input y;
  output out;

  wire \N3/rounding/p_0_in ;
  wire NN_n_0;
  wire clock;
  wire clock_IBUF;
  wire clock_IBUF_BUFG;
  wire out;
  wire out_OBUF;
  wire out_wire;
  wire reset_n;
  wire reset_n_IBUF;
  wire x;
  wire x_IBUF;
  wire x_reg;
  wire y;
  wire y_IBUF;
  wire y_reg;

  XOR_NN NN
       (.A(y_reg),
        .CLK(clock_IBUF_BUFG),
        .M1_i_11(x_reg),
        .O(\N3/rounding/p_0_in ),
        .SCLR(NN_n_0),
        .reset_n_IBUF(reset_n_IBUF));
  BUFG clock_IBUF_BUFG_inst
       (.I(clock_IBUF),
        .O(clock_IBUF_BUFG));
  IBUF clock_IBUF_inst
       (.I(clock),
        .O(clock_IBUF));
  OBUF out_OBUF_inst
       (.I(out_OBUF),
        .O(out));
  LUT1 #(
    .INIT(2'h1)) 
    out_i_1
       (.I0(\N3/rounding/p_0_in ),
        .O(out_wire));
  FDRE #(
    .INIT(1'b0)) 
    out_reg
       (.C(clock_IBUF_BUFG),
        .CE(1'b1),
        .D(out_wire),
        .Q(out_OBUF),
        .R(NN_n_0));
  IBUF reset_n_IBUF_inst
       (.I(reset_n),
        .O(reset_n_IBUF));
  IBUF x_IBUF_inst
       (.I(x),
        .O(x_IBUF));
  FDRE #(
    .INIT(1'b0)) 
    x_reg_reg
       (.C(clock_IBUF_BUFG),
        .CE(1'b1),
        .D(x_IBUF),
        .Q(x_reg),
        .R(NN_n_0));
  IBUF y_IBUF_inst
       (.I(y),
        .O(y_IBUF));
  FDRE #(
    .INIT(1'b0)) 
    y_reg_reg
       (.C(clock_IBUF_BUFG),
        .CE(1'b1),
        .D(y_IBUF),
        .Q(y_reg),
        .R(NN_n_0));
endmodule

module XOR_NN
   (SCLR,
    O,
    CLK,
    A,
    M1_i_11,
    reset_n_IBUF);
  output SCLR;
  output [0:0]O;
  input CLK;
  input [0:0]A;
  input [0:0]M1_i_11;
  input reset_n_IBUF;

  wire [0:0]A;
  wire CLK;
  wire [0:0]M1_i_11;
  wire [0:0]O;
  wire SCLR;
  wire reset_n_IBUF;
  wire \rounding/p_0_in ;
  wire \rounding/p_0_in_0 ;

  FC_Neuron N1
       (.A(A),
        .CLK(CLK),
        .M1_i_11_0(M1_i_11),
        .O(\rounding/p_0_in ),
        .SCLR(SCLR));
  FC_Neuron__parameterized0 N2
       (.A(A),
        .CLK(CLK),
        .M0_i_11_0(M1_i_11),
        .O(\rounding/p_0_in_0 ),
        .SCLR(SCLR));
  FC_Neuron__parameterized1 N3
       (.CLK(CLK),
        .M0_0(\rounding/p_0_in_0 ),
        .M1_0(\rounding/p_0_in ),
        .O(O),
        .SCLR(SCLR),
        .reset_n_IBUF(reset_n_IBUF));
endmodule

(* C_AB_LATENCY = "-1" *) (* C_A_TYPE = "0" *) (* C_A_WIDTH = "25" *) 
(* C_B_TYPE = "0" *) (* C_B_WIDTH = "18" *) (* C_CE_OVERRIDES_SCLR = "0" *) 
(* C_C_LATENCY = "0" *) (* C_C_TYPE = "0" *) (* C_C_WIDTH = "48" *) 
(* C_OUT_HIGH = "47" *) (* C_OUT_LOW = "0" *) (* C_TEST_CORE = "0" *) 
(* C_USE_PCIN = "1" *) (* C_VERBOSITY = "0" *) (* C_XDEVICEFAMILY = "artix7" *) 
(* ORIG_REF_NAME = "xbip_multadd_v3_0_13" *) (* downgradeipidentifiedwarnings = "yes" *) 
module Mult_Add_COL_xbip_multadd_v3_0_13
   (CLK,
    CE,
    SCLR,
    A,
    B,
    C,
    PCIN,
    SUBTRACT,
    P,
    PCOUT);
  input CLK;
  input CE;
  input SCLR;
  input [24:0]A;
  input [17:0]B;
  input [47:0]C;
  input [47:0]PCIN;
  input SUBTRACT;
  output [47:0]P;
  output [47:0]PCOUT;

  wire [24:0]A;
  wire [17:0]B;
  wire CE;
  wire CLK;
  wire [47:0]P;
  wire [47:0]PCIN;
  wire SCLR;
  wire SUBTRACT;
  wire [47:0]NLW_i_synth_C_UNCONNECTED;
  wire [8:0]NLW_i_synth_P_UNCONNECTED;
  wire [47:0]NLW_i_synth_PCOUT_UNCONNECTED;

  (* C_AB_LATENCY = "-1" *) 
  (* C_A_TYPE = "0" *) 
  (* C_A_WIDTH = "25" *) 
  (* C_B_TYPE = "0" *) 
  (* C_B_WIDTH = "18" *) 
  (* C_CE_OVERRIDES_SCLR = "0" *) 
  (* C_C_LATENCY = "0" *) 
  (* C_C_TYPE = "0" *) 
  (* C_C_WIDTH = "48" *) 
  (* C_OUT_HIGH = "47" *) 
  (* C_OUT_LOW = "0" *) 
  (* C_TEST_CORE = "0" *) 
  (* C_USE_PCIN = "1" *) 
  (* C_VERBOSITY = "0" *) 
  (* C_XDEVICEFAMILY = "artix7" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  Mult_Add_COL_xbip_multadd_v3_0_13_viv i_synth
       (.A(A),
        .B(B),
        .C(NLW_i_synth_C_UNCONNECTED[47:0]),
        .CE(CE),
        .CLK(CLK),
        .P({P[47:9],NLW_i_synth_P_UNCONNECTED[8:0]}),
        .PCIN(PCIN),
        .PCOUT(NLW_i_synth_PCOUT_UNCONNECTED[47:0]),
        .SCLR(SCLR),
        .SUBTRACT(SUBTRACT));
endmodule

(* C_AB_LATENCY = "-1" *) (* C_A_TYPE = "0" *) (* C_A_WIDTH = "25" *) 
(* C_B_TYPE = "0" *) (* C_B_WIDTH = "18" *) (* C_CE_OVERRIDES_SCLR = "0" *) 
(* C_C_LATENCY = "0" *) (* C_C_TYPE = "0" *) (* C_C_WIDTH = "48" *) 
(* C_OUT_HIGH = "47" *) (* C_OUT_LOW = "0" *) (* C_TEST_CORE = "0" *) 
(* C_USE_PCIN = "1" *) (* C_VERBOSITY = "0" *) (* C_XDEVICEFAMILY = "artix7" *) 
(* ORIG_REF_NAME = "xbip_multadd_v3_0_13" *) (* downgradeipidentifiedwarnings = "yes" *) 
module Mult_Add_COL_xbip_multadd_v3_0_13_HD20
   (CLK,
    CE,
    SCLR,
    SUBTRACT,
    A,
    B,
    C,
    PCIN,
    P,
    PCOUT);
  input CLK;
  input CE;
  input SCLR;
  input SUBTRACT;
  input [24:0]A;
  input [17:0]B;
  input [47:0]C;
  input [47:0]PCIN;
  output [47:0]P;
  output [47:0]PCOUT;

  wire [24:0]A;
  wire [17:0]B;
  wire CE;
  wire CLK;
  wire [47:0]P;
  wire [47:0]PCIN;
  wire SCLR;
  wire SUBTRACT;
  wire [47:0]NLW_i_synth_C_UNCONNECTED;
  wire [8:0]NLW_i_synth_P_UNCONNECTED;
  wire [47:0]NLW_i_synth_PCOUT_UNCONNECTED;

  (* C_AB_LATENCY = "-1" *) 
  (* C_A_TYPE = "0" *) 
  (* C_A_WIDTH = "25" *) 
  (* C_B_TYPE = "0" *) 
  (* C_B_WIDTH = "18" *) 
  (* C_CE_OVERRIDES_SCLR = "0" *) 
  (* C_C_LATENCY = "0" *) 
  (* C_C_TYPE = "0" *) 
  (* C_C_WIDTH = "48" *) 
  (* C_OUT_HIGH = "47" *) 
  (* C_OUT_LOW = "0" *) 
  (* C_TEST_CORE = "0" *) 
  (* C_USE_PCIN = "1" *) 
  (* C_VERBOSITY = "0" *) 
  (* C_XDEVICEFAMILY = "artix7" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  Mult_Add_COL_xbip_multadd_v3_0_13_viv_HD21 i_synth
       (.A(A),
        .B(B),
        .C(NLW_i_synth_C_UNCONNECTED[47:0]),
        .CE(CE),
        .CLK(CLK),
        .P({P[47:9],NLW_i_synth_P_UNCONNECTED[8:0]}),
        .PCIN(PCIN),
        .PCOUT(NLW_i_synth_PCOUT_UNCONNECTED[47:0]),
        .SCLR(SCLR),
        .SUBTRACT(SUBTRACT));
endmodule

(* C_AB_LATENCY = "-1" *) (* C_A_TYPE = "0" *) (* C_A_WIDTH = "25" *) 
(* C_B_TYPE = "0" *) (* C_B_WIDTH = "18" *) (* C_CE_OVERRIDES_SCLR = "0" *) 
(* C_C_LATENCY = "0" *) (* C_C_TYPE = "0" *) (* C_C_WIDTH = "48" *) 
(* C_OUT_HIGH = "47" *) (* C_OUT_LOW = "0" *) (* C_TEST_CORE = "0" *) 
(* C_USE_PCIN = "1" *) (* C_VERBOSITY = "0" *) (* C_XDEVICEFAMILY = "artix7" *) 
(* ORIG_REF_NAME = "xbip_multadd_v3_0_13" *) (* downgradeipidentifiedwarnings = "yes" *) 
module Mult_Add_COL_xbip_multadd_v3_0_13_HD27
   (CLK,
    CE,
    SCLR,
    SUBTRACT,
    A,
    B,
    C,
    PCIN,
    P,
    PCOUT);
  input CLK;
  input CE;
  input SCLR;
  input SUBTRACT;
  input [24:0]A;
  input [17:0]B;
  input [47:0]C;
  input [47:0]PCIN;
  output [47:0]P;
  output [47:0]PCOUT;

  wire [24:0]A;
  wire [17:0]B;
  wire CE;
  wire CLK;
  wire [47:0]P;
  wire [47:0]PCIN;
  wire SCLR;
  wire SUBTRACT;
  wire [47:0]NLW_i_synth_C_UNCONNECTED;
  wire [8:0]NLW_i_synth_P_UNCONNECTED;
  wire [47:0]NLW_i_synth_PCOUT_UNCONNECTED;

  (* C_AB_LATENCY = "-1" *) 
  (* C_A_TYPE = "0" *) 
  (* C_A_WIDTH = "25" *) 
  (* C_B_TYPE = "0" *) 
  (* C_B_WIDTH = "18" *) 
  (* C_CE_OVERRIDES_SCLR = "0" *) 
  (* C_C_LATENCY = "0" *) 
  (* C_C_TYPE = "0" *) 
  (* C_C_WIDTH = "48" *) 
  (* C_OUT_HIGH = "47" *) 
  (* C_OUT_LOW = "0" *) 
  (* C_TEST_CORE = "0" *) 
  (* C_USE_PCIN = "1" *) 
  (* C_VERBOSITY = "0" *) 
  (* C_XDEVICEFAMILY = "artix7" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  Mult_Add_COL_xbip_multadd_v3_0_13_viv_HD28 i_synth
       (.A(A),
        .B(B),
        .C(NLW_i_synth_C_UNCONNECTED[47:0]),
        .CE(CE),
        .CLK(CLK),
        .P({P[47:9],NLW_i_synth_P_UNCONNECTED[8:0]}),
        .PCIN(PCIN),
        .PCOUT(NLW_i_synth_PCOUT_UNCONNECTED[47:0]),
        .SCLR(SCLR),
        .SUBTRACT(SUBTRACT));
endmodule

(* C_AB_LATENCY = "-1" *) (* C_A_TYPE = "0" *) (* C_A_WIDTH = "25" *) 
(* C_B_TYPE = "0" *) (* C_B_WIDTH = "18" *) (* C_CE_OVERRIDES_SCLR = "0" *) 
(* C_C_LATENCY = "-1" *) (* C_C_TYPE = "0" *) (* C_C_WIDTH = "48" *) 
(* C_OUT_HIGH = "47" *) (* C_OUT_LOW = "0" *) (* C_TEST_CORE = "0" *) 
(* C_USE_PCIN = "0" *) (* C_VERBOSITY = "0" *) (* C_XDEVICEFAMILY = "artix7" *) 
(* ORIG_REF_NAME = "xbip_multadd_v3_0_13" *) (* downgradeipidentifiedwarnings = "yes" *) 
module Mult_Add_NC_xbip_multadd_v3_0_13
   (CLK,
    CE,
    SCLR,
    A,
    B,
    C,
    PCIN,
    SUBTRACT,
    P,
    PCOUT);
  input CLK;
  input CE;
  input SCLR;
  input [24:0]A;
  input [17:0]B;
  input [47:0]C;
  input [47:0]PCIN;
  input SUBTRACT;
  output [47:0]P;
  output [47:0]PCOUT;

  wire [24:0]A;
  wire [17:0]B;
  wire [47:0]C;
  wire CE;
  wire CLK;
  wire [47:0]PCOUT;
  wire SCLR;
  wire SUBTRACT;
  wire [47:0]NLW_i_synth_P_UNCONNECTED;
  wire [47:0]NLW_i_synth_PCIN_UNCONNECTED;

  (* C_AB_LATENCY = "-1" *) 
  (* C_A_TYPE = "0" *) 
  (* C_A_WIDTH = "25" *) 
  (* C_B_TYPE = "0" *) 
  (* C_B_WIDTH = "18" *) 
  (* C_CE_OVERRIDES_SCLR = "0" *) 
  (* C_C_LATENCY = "-1" *) 
  (* C_C_TYPE = "0" *) 
  (* C_C_WIDTH = "48" *) 
  (* C_OUT_HIGH = "47" *) 
  (* C_OUT_LOW = "0" *) 
  (* C_TEST_CORE = "0" *) 
  (* C_USE_PCIN = "0" *) 
  (* C_VERBOSITY = "0" *) 
  (* C_XDEVICEFAMILY = "artix7" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  Mult_Add_NC_xbip_multadd_v3_0_13_viv i_synth
       (.A(A),
        .B(B),
        .C(C),
        .CE(CE),
        .CLK(CLK),
        .P(NLW_i_synth_P_UNCONNECTED[47:0]),
        .PCIN(NLW_i_synth_PCIN_UNCONNECTED[47:0]),
        .PCOUT(PCOUT),
        .SCLR(SCLR),
        .SUBTRACT(SUBTRACT));
endmodule

(* C_AB_LATENCY = "-1" *) (* C_A_TYPE = "0" *) (* C_A_WIDTH = "25" *) 
(* C_B_TYPE = "0" *) (* C_B_WIDTH = "18" *) (* C_CE_OVERRIDES_SCLR = "0" *) 
(* C_C_LATENCY = "-1" *) (* C_C_TYPE = "0" *) (* C_C_WIDTH = "48" *) 
(* C_OUT_HIGH = "47" *) (* C_OUT_LOW = "0" *) (* C_TEST_CORE = "0" *) 
(* C_USE_PCIN = "0" *) (* C_VERBOSITY = "0" *) (* C_XDEVICEFAMILY = "artix7" *) 
(* ORIG_REF_NAME = "xbip_multadd_v3_0_13" *) (* downgradeipidentifiedwarnings = "yes" *) 
module Mult_Add_NC_xbip_multadd_v3_0_13_HD11
   (CLK,
    CE,
    SCLR,
    SUBTRACT,
    A,
    B,
    C,
    PCIN,
    P,
    PCOUT);
  input CLK;
  input CE;
  input SCLR;
  input SUBTRACT;
  input [24:0]A;
  input [17:0]B;
  input [47:0]C;
  input [47:0]PCIN;
  output [47:0]P;
  output [47:0]PCOUT;

  wire [24:0]A;
  wire [17:0]B;
  wire [47:0]C;
  wire CE;
  wire CLK;
  wire [47:0]PCOUT;
  wire SCLR;
  wire SUBTRACT;
  wire [47:0]NLW_i_synth_P_UNCONNECTED;
  wire [47:0]NLW_i_synth_PCIN_UNCONNECTED;

  (* C_AB_LATENCY = "-1" *) 
  (* C_A_TYPE = "0" *) 
  (* C_A_WIDTH = "25" *) 
  (* C_B_TYPE = "0" *) 
  (* C_B_WIDTH = "18" *) 
  (* C_CE_OVERRIDES_SCLR = "0" *) 
  (* C_C_LATENCY = "-1" *) 
  (* C_C_TYPE = "0" *) 
  (* C_C_WIDTH = "48" *) 
  (* C_OUT_HIGH = "47" *) 
  (* C_OUT_LOW = "0" *) 
  (* C_TEST_CORE = "0" *) 
  (* C_USE_PCIN = "0" *) 
  (* C_VERBOSITY = "0" *) 
  (* C_XDEVICEFAMILY = "artix7" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  Mult_Add_NC_xbip_multadd_v3_0_13_viv_HD12 i_synth
       (.A(A),
        .B(B),
        .C(C),
        .CE(CE),
        .CLK(CLK),
        .P(NLW_i_synth_P_UNCONNECTED[47:0]),
        .PCIN(NLW_i_synth_PCIN_UNCONNECTED[47:0]),
        .PCOUT(PCOUT),
        .SCLR(SCLR),
        .SUBTRACT(SUBTRACT));
endmodule

(* C_AB_LATENCY = "-1" *) (* C_A_TYPE = "0" *) (* C_A_WIDTH = "25" *) 
(* C_B_TYPE = "0" *) (* C_B_WIDTH = "18" *) (* C_CE_OVERRIDES_SCLR = "0" *) 
(* C_C_LATENCY = "-1" *) (* C_C_TYPE = "0" *) (* C_C_WIDTH = "48" *) 
(* C_OUT_HIGH = "47" *) (* C_OUT_LOW = "0" *) (* C_TEST_CORE = "0" *) 
(* C_USE_PCIN = "0" *) (* C_VERBOSITY = "0" *) (* C_XDEVICEFAMILY = "artix7" *) 
(* ORIG_REF_NAME = "xbip_multadd_v3_0_13" *) (* downgradeipidentifiedwarnings = "yes" *) 
module Mult_Add_NC_xbip_multadd_v3_0_13_HD4
   (CLK,
    CE,
    SCLR,
    SUBTRACT,
    A,
    B,
    C,
    PCIN,
    P,
    PCOUT);
  input CLK;
  input CE;
  input SCLR;
  input SUBTRACT;
  input [24:0]A;
  input [17:0]B;
  input [47:0]C;
  input [47:0]PCIN;
  output [47:0]P;
  output [47:0]PCOUT;

  wire [24:0]A;
  wire [17:0]B;
  wire [47:0]C;
  wire CE;
  wire CLK;
  wire [47:0]PCOUT;
  wire SCLR;
  wire SUBTRACT;
  wire [47:0]NLW_i_synth_P_UNCONNECTED;
  wire [47:0]NLW_i_synth_PCIN_UNCONNECTED;

  (* C_AB_LATENCY = "-1" *) 
  (* C_A_TYPE = "0" *) 
  (* C_A_WIDTH = "25" *) 
  (* C_B_TYPE = "0" *) 
  (* C_B_WIDTH = "18" *) 
  (* C_CE_OVERRIDES_SCLR = "0" *) 
  (* C_C_LATENCY = "-1" *) 
  (* C_C_TYPE = "0" *) 
  (* C_C_WIDTH = "48" *) 
  (* C_OUT_HIGH = "47" *) 
  (* C_OUT_LOW = "0" *) 
  (* C_TEST_CORE = "0" *) 
  (* C_USE_PCIN = "0" *) 
  (* C_VERBOSITY = "0" *) 
  (* C_XDEVICEFAMILY = "artix7" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  Mult_Add_NC_xbip_multadd_v3_0_13_viv_HD5 i_synth
       (.A(A),
        .B(B),
        .C(C),
        .CE(CE),
        .CLK(CLK),
        .P(NLW_i_synth_P_UNCONNECTED[47:0]),
        .PCIN(NLW_i_synth_PCIN_UNCONNECTED[47:0]),
        .PCOUT(PCOUT),
        .SCLR(SCLR),
        .SUBTRACT(SUBTRACT));
endmodule
`pragma protect begin_protected
`pragma protect version = 1
`pragma protect encrypt_agent = "XILINX"
`pragma protect encrypt_agent_info = "Xilinx Encryption Tool 2015"
`pragma protect key_keyowner="Cadence Design Systems.", key_keyname="cds_rsa_key", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=64)
`pragma protect key_block
MHumgepNL+qP36Q5v+sXZoQvh6L5qK6JWAScnFbZ+ByqaZbvkuZ8PlltdP94vJP5UDQuf7MXAzqM
tde5/x/iqw==

`pragma protect key_keyowner="Synopsys", key_keyname="SNPS-VCS-RSA-2", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
VLcwlh+KqL/7VQ7355W4Km5OlC3fhtNlLvOzL/yM1Ny84xdsunEJtvTQLBnxbEfiQ8WVRVaT0xSF
juDxk7zRXdvsBHlyG7kD++vAtaQ0Pg12gXPvLAi7Jb/6Y2y3Mf+LpYAPokmtuZwFyEVyHRxoFbiA
0OC9kX/2tzFIAlYSp/w=

`pragma protect key_keyowner="Aldec", key_keyname="ALDEC15_001", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
F+ebQ6TbSbodWaXe7Vj0VW7/JqPQBPXx5sFh65wTtIj84fQU8R6p3e/svvoRuuu5FbVTPzgoswJR
ObZGTV72aLVNO7xXCwQH5Ty/ileR6XF0veEWDBX4yZemGKGMk2+c7TKyHordfWoV7xcuBfy0D8iq
fp3F6bnhTreIpcpcW2crtjC5WkNI83BIJ2ePQ3q1LDuyvE7kTAGfI2K9cxvvi0J1/GAEVRekQXlk
qYnUgxsMZlCs8Vil0XNSYMwC62uIuCD51fAOHVOpCuw3NHKkDVZjuu8RJJmphKSj2GLArpJxUKO6
7PQZAuXwBd0ppDR/w4NkHCSzX3zTPD/DvVwoOA==

`pragma protect key_keyowner="ATRENTA", key_keyname="ATR-SG-2015-RSA-3", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
C1UyvMQPYRFIvMujlIFwioIpr5RaRsL5qxjQpzBLsot/31XmvfMwBCz6IQgRc0yAnqF05tclIHXX
M8UhtpJbjmfOQON+9EAz5TfWfXxkoVvKJV1X67o1E+1W1NH3W+TQ/l0n9OtiTOIYrrDEPS1yclSQ
JWcFBfG57+I3Qde8k4NZQgzJ0ujfSrOwN8b6JEdkDk/l+PgledR3LQKW8IOJpjDHJbL4AUFvsBKs
PIi7J5Ck/COkzPcU3MvzwBKnkmYHR4Gk+cDHBJKnDw2WJem/kxo2aLWgcjXTC+Pkx+JCiVYg7ptt
bJ7OdFtnPeXSMHoNFrv9cT2WHef6ts5HuIA02A==

`pragma protect key_keyowner="Xilinx", key_keyname="xilinxt_2017_05", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
YS3ZactmWeefeRMeOCvaVrVsrh9njgBh1WjG4u7OB9QiKG2TjlgZTXUWKo8CyyHpzrms501svY1i
xr66xvl45aksUhnRM+LoRYeDBJJ7UiQRgbckXmY8jKKye/GsUJC+dzo8ii17SgjCYZofFmGhob9n
cvPc8XrRlCHcW8BHZLVcUuhHeYzAcHpXTkSlu7aW8g6yjdo+GxV5Nq0WQoOVaQi70O0cWzluprEg
omR712DLQI2ycJybzWj+eT+jl7f/z6XCA4rMrdqtYzLDquzEUKNhSwADLufzcSfsGFlay24lpysd
yIYK+MpdfoKlco68KNivbLVZ5HnVHFElj/rPEA==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VELOCE-RSA", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
MX6l24z+vVxu6x5LJ7UOllIYStuhmJPYKKeSd2+CSpsUbla7u201tuwLL3BbgRGLuHwf5abowOex
fkYoIJIs3UEnJz0TDQyIjQM0a3JCmHNa/c/DqyzUZok7nQDaVuw6ORHU2LwEP3nXhBgQHmTCgx/6
e4HoRhmLA6E9kJoXeaE=

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VERIF-SIM-RSA-2", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
WKEJlfsLWgjTP4H1FtqN43QZF6pLUFeT8fUrWW1KYE44eGBfXrRJU0nyIXZ9hZrGNUj392LV5nIr
i8G+ur3laRR3Ke9m00BnnabKd7N8o9jGY8OUeBlyTEG0A8uz0pphSZLrB1Ild6TJkxF6Z8M7NjCg
SLEMi3/UAmZ65IAyWYENDau0jevfjH9u3532vt7Chw9R5hC+rhy7JIdWWn0F3fRhF+ypu6HWoxFY
Sh42z9HPZTYM3NlplW/tEKucaOBdF1oIuA8t7o/xUPtT3mXjJfI/k7uDzJkd1aRxmFf29pqh2iqN
FUPAvv4KP+9dOYcjkXUoewHkmUeukO2HseFmtA==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-PREC-RSA", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
bDlBPxVcF3m88g5wrGjSVlucflQgwT6851D8AS1wGCdoZzVux+Q+HUATYVthGmcdoQwaFrWuvgJA
2/O19acpNo+kw904VNWxhYhYtFI30Vx86ctC5U2oKRFCvYikdjId56XSL8Dyy/Uf0UfAMup/CP//
Hl3HHOj2BEPnImU8xj8A5w9yRKBPI3/y3qL58dWz5ptKGKVjg/0ANTQANUsfg7DH99WwJ6Fd0CVm
Oat1qB1h2InSeL7ou2/dGOVXEMb7l/6D84ymGnU2LKrgSocZCsSZz/0R/wJeFt3lO/3hmFjXZZYa
X86qRBSGzN/7m2QjSRGctMf6adJhPrcwrHl3Fg==

`pragma protect key_keyowner="Synplicity", key_keyname="SYNP15_1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
nTpGEEiAdwLNNN79qo7lFlEhnolA5anURSnaF3MJECnYQRT2BLe1T4i5xRrdvGc0N/JMqjbiEN63
YJbiLbWYjPTSekMUTqQkJT+KcwIJtdzxKnmEM+6ffAHA1bArkvYQl+F2ZFWJxVXpKJS1aRQPJ91M
tHPwVzQtNs+3DK5j/5YMNKA8v5CPyrd1+E02T7xOEQG/Z0D8owPSuDYfQp9mQfJ/DEdUh2boALj0
eVvCMvBoj5iTAzmsr9/pUEqu4aCR2r13+0/vjvbn/Ue/Vp7O4guMYisu19L8oyXSWlSnoNNixwiI
3aYtJDEquBACb/xuglkP37jUM4fyQTNvPRCpiw==

`pragma protect data_method = "AES128-CBC"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 48144)
`pragma protect data_block
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
`pragma protect end_protected
`ifndef GLBL
`define GLBL
`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;
    wire FCSBO_GLBL;
    wire [3:0] DO_GLBL;
    wire [3:0] DI_GLBL;
   
    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (strong1, weak0) GSR = GSR_int;
    assign (strong1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

endmodule
`endif
