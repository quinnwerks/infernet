// Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2018.3.1 (lin64) Build 2489853 Tue Mar 26 04:18:30 MDT 2019
// Date        : Tue Feb 23 16:01:32 2021
// Host        : andrew-debian running 64-bit Debian GNU/Linux 10 (buster)
// Command     : write_verilog -force -mode funcsim
//               /home/andrew/infernet/misc/XOR_NN/XOR_NN.srcs/sources_1/ip/Mult_Add_NC/Mult_Add_NC_sim_netlist.v
// Design      : Mult_Add_NC
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7a100tcsg324-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "Mult_Add_NC,xbip_multadd_v3_0_13,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "xbip_multadd_v3_0_13,Vivado 2018.3.1" *) 
(* NotValidForBitStream *)
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
  wire [47:0]P;
  wire [47:0]PCOUT;
  wire SCLR;
  wire SUBTRACT;

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
        .P(P),
        .PCIN({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
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
  wire [47:0]P;
  wire [47:0]PCOUT;
  wire SCLR;
  wire SUBTRACT;

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
        .P(P),
        .PCIN({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
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
nEiRuarPGVaTWH6x0eeS7FI2opePiwKSrcpKH2tKjCZdZ2zHsWqgknkga/N4hj+Sp+zNEoLWzzII
41kmA2YcEp93qdc1V+PphJ3d1zPSukv62kg+7BMeGaey37Wh5XgfQGiIjb4A98WfGQ+HdcvBtuoT
PgAseJ+Q319rgXcE5JjkdUCyYcS7g/fU3qyEFTBeOVDqxbF4Cx6wMMx6ARoTH+oYa6PVfxE2Viv7
sJjNdiZqjLy5PPliP4cd2oXmb10BLd+Me9dgq0798ZAbLyAgd+2ysXiaV6yHHPIHXCEk6NFMIunW
asC1Lq18pI0Jq/82YDhM87q89+yyODXsoZflHA==

`pragma protect key_keyowner="Synplicity", key_keyname="SYNP15_1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
Xh3KKfSGSUQwstcrls8akAKZYZCzADWwjFPMr8veLruSq7zTzDo36WEormEy4DQiCBv30Jloi6jA
1hwoyOc9dJQf70GaoT8TeVKhVTcB1z/9rAC12oUxXaK/wf/QbpgxdDIJK30R5xQPTZczFjlPi56+
+jj3WXasHg/aftJoUE843jeH7LctTuQe9eEu5d80MZ0ZgLrIqN7yPl/3MUWRhNQov3D8dyHNIDNO
gJiebhE3PXmKmzXeuCEc2mKCj0hJgHFBQ8D8IQvJbWvzBs8jkjB7S/HV3s9PTcZmoFncWxzvsXtF
GTBEGT4o1ruIcxt2jMkXbpTGKDIFK+zfCoqRYw==

`pragma protect data_method = "AES128-CBC"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 9008)
`pragma protect data_block
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
rBY=
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
