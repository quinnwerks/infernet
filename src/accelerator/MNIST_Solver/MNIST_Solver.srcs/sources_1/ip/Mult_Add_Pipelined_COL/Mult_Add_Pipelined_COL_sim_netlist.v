// Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2018.3.1 (lin64) Build 2489853 Tue Mar 26 04:18:30 MDT 2019
// Date        : Mon Feb 22 19:55:12 2021
// Host        : andrew-debian running 64-bit Debian GNU/Linux 10 (buster)
// Command     : write_verilog -force -mode funcsim
//               /home/andrew/ECE532-sandbox/MNIST_Solver/MNIST_Solver.srcs/sources_1/ip/Mult_Add_Pipelined_COL/Mult_Add_Pipelined_COL_sim_netlist.v
// Design      : Mult_Add_Pipelined_COL
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7a100tcsg324-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "Mult_Add_Pipelined_COL,xbip_multadd_v3_0_13,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "xbip_multadd_v3_0_13,Vivado 2018.3.1" *) 
(* NotValidForBitStream *)
module Mult_Add_Pipelined_COL
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
  wire [47:0]C;
  wire CE;
  wire CLK;
  wire [47:0]P;
  wire [47:0]PCIN;
  wire [47:0]PCOUT;
  wire SCLR;
  wire SUBTRACT;

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
  Mult_Add_Pipelined_COL_xbip_multadd_v3_0_13 U0
       (.A(A),
        .B(B),
        .C(C),
        .CE(CE),
        .CLK(CLK),
        .P(P),
        .PCIN(PCIN),
        .PCOUT(PCOUT),
        .SCLR(SCLR),
        .SUBTRACT(SUBTRACT));
endmodule

(* C_AB_LATENCY = "-1" *) (* C_A_TYPE = "0" *) (* C_A_WIDTH = "25" *) 
(* C_B_TYPE = "0" *) (* C_B_WIDTH = "18" *) (* C_CE_OVERRIDES_SCLR = "0" *) 
(* C_C_LATENCY = "0" *) (* C_C_TYPE = "0" *) (* C_C_WIDTH = "48" *) 
(* C_OUT_HIGH = "47" *) (* C_OUT_LOW = "0" *) (* C_TEST_CORE = "0" *) 
(* C_USE_PCIN = "1" *) (* C_VERBOSITY = "0" *) (* C_XDEVICEFAMILY = "artix7" *) 
(* ORIG_REF_NAME = "xbip_multadd_v3_0_13" *) (* downgradeipidentifiedwarnings = "yes" *) 
module Mult_Add_Pipelined_COL_xbip_multadd_v3_0_13
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
  wire [47:0]PCOUT;
  wire SCLR;
  wire SUBTRACT;

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
  Mult_Add_Pipelined_COL_xbip_multadd_v3_0_13_viv i_synth
       (.A(A),
        .B(B),
        .C({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .CE(CE),
        .CLK(CLK),
        .P(P),
        .PCIN(PCIN),
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
DcLJVfibBCpNt1EXk/PX8DmsBeqr+k/K1O4a8NQWxfaN149kbQ5c9nacMw/QNUIzZVOIWamA2P69
8IWfbs9/HsubJXRTBOhzJnW1Job+bbkSnATP8O3sE725qeDPBom2O16MKOHTcWYkaXXxxhk7wbHs
WEGaUpIwXSVeS1zinRD9t00ryxdzabc677FaZL1h/D2wouYdncqU8CNZcrC0tCN9cGgjW5INHNV6
WfxnQgtawAE4DJ6KaVqX5VvY/I55MTFbYavWqgAoIAZvwYMsAtX3f7hTTSd+PD7p2FZiQ8RP9Mow
oZ/C/K41wlI4IXrG//8PnRsjiMqSUMLBWxR5IA==

`pragma protect key_keyowner="Synplicity", key_keyname="SYNP15_1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
VYMVnjOcocYazH1THk8cAmjGfdrXJmry2ZWzEKkTFEdi0/9DFv/XJQGooGT9N0m/dRETSHkaIBq5
KGKxXbk6ALSOCVIVnR2AzHZ2O7dL+wwkbW0sjEbn0/CRYYaivvbV/naKHWPl5ze//QSBJ0lmGHxP
zIFdY+8OvtX7j0HobLpPBKr9F5nzFD7gbeUmZ8FALsnEaFqvgI6t6RHg9hgUxQHx5RXiONkZqUKh
dLgGCMUtvuLvS1d8rYu+zdle8d5BrkAMv/tBmupLKFuQkOYQXT7unxJeB1cue/2x4DpHyAAGikBv
v8bCoE0gj5wFE0CR7mm9DvBi8ASWJ0Vq7v8XDA==

`pragma protect data_method = "AES128-CBC"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 9168)
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
