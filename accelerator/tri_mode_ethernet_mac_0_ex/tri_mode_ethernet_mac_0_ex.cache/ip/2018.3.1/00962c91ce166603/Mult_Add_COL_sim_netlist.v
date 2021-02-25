// Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2018.3.1 (lin64) Build 2489853 Tue Mar 26 04:18:30 MDT 2019
// Date        : Wed Feb 24 18:35:21 2021
// Host        : hw-dev running 64-bit Ubuntu 18.04.5 LTS
// Command     : write_verilog -force -mode funcsim -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
//               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ Mult_Add_COL_sim_netlist.v
// Design      : Mult_Add_COL
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7a100tcsg324-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "Mult_Add_COL,xbip_multadd_v3_0_13,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "xbip_multadd_v3_0_13,Vivado 2018.3.1" *) 
(* NotValidForBitStream *)
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix
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
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xbip_multadd_v3_0_13 U0
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
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xbip_multadd_v3_0_13
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
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xbip_multadd_v3_0_13_viv i_synth
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
DmwgK+OkmkdiqLY9XUS5wSEMKXnA8vk4pA==
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
