// Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2018.3.1 (lin64) Build 2489853 Tue Mar 26 04:18:30 MDT 2019
// Date        : Wed Feb 24 18:35:21 2021
// Host        : hw-dev running 64-bit Ubuntu 18.04.5 LTS
// Command     : write_verilog -force -mode funcsim -rename_top Mult_Add_COL -prefix
//               Mult_Add_COL_ Mult_Add_COL_sim_netlist.v
// Design      : Mult_Add_COL
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7a100tcsg324-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "Mult_Add_COL,xbip_multadd_v3_0_13,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "xbip_multadd_v3_0_13,Vivado 2018.3.1" *) 
(* NotValidForBitStream *)
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
  Mult_Add_COL_xbip_multadd_v3_0_13 U0
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
(* downgradeipidentifiedwarnings = "yes" *) 
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
  Mult_Add_COL_xbip_multadd_v3_0_13_viv i_synth
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
pbaTS1FUHQbiEIEGR9CklErHIuCfPrLrUvVs65sxlugCmfvgxrKv4jbRkP8OdxQXO7RqcGR+mUaQ
W90fgcvbCDOLWY+zyDDMTRJqDBFq7MvqzKs+8EguJLwY/bBmrtuyC8IQmDxI7ERX6FgoZsa2n3p2
3kSH9k6wSSQ8KHk8ER/KXKJY6K3vge4OJRGp2zspAB9Zktkx+7k9SSmFLt6UErfP6AkFIE7X5nHZ
cy/F1hoXMcFkyxjzgXuqqjGIhgMa6zF6UGGCfz4oNyo0cSsB3wCdnlpV4JL4l6KYVpIJHbIuzVn8
g7BvuMZTBmgeidnYbJxa8R01mRaWt/tmWyxJ2A==

`pragma protect key_keyowner="Synplicity", key_keyname="SYNP15_1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
eTZJ/DElC5dQk4s2PSgeUsc2eaf1iDgd5sk0gPnIOUfwAIbURc22owS54PF41E648WFn6sZRqLSV
tRPG78QNkvSZEudnZ8qhEpelqt39NJUiw5XXmgHieQ/JKAbqmKZy219sltg6GnTRa4JMBIwAOVZl
urDiIBt5B3zavXypTTJ2mwYIALsiVMNcHe60Lvt4He7G74lbsCvxYkvhfMzieCgh6FAradNV6vbl
uRUSWmFvcJJ4Gnjn9vcKdpoFQG7fRnuFhu23VsxEKYxFK4jmaBLb7vvkDJpI4UPsa69+zmIqq8Jw
D0dGlCSAUPrt4HzohHmpXv9Yc0ffV+KNrGTFjg==

`pragma protect data_method = "AES128-CBC"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 9088)
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
