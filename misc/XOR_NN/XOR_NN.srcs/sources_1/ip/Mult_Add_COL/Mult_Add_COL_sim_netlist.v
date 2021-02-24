// Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2018.3.1 (lin64) Build 2489853 Tue Mar 26 04:18:30 MDT 2019
// Date        : Tue Feb 23 16:01:57 2021
// Host        : andrew-debian running 64-bit Debian GNU/Linux 10 (buster)
// Command     : write_verilog -force -mode funcsim
//               /home/andrew/infernet/misc/XOR_NN/XOR_NN.srcs/sources_1/ip/Mult_Add_COL/Mult_Add_COL_sim_netlist.v
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
g+Pji55PTGRMMJURhXpewLJxMiAZh/jyYyAJqaMki9px+8mBXI8UhhdOlGQK3hnME1xwCAW1hsdx
uYbLqiUUKoIG9+ZRpmDxxgjeGL8EjFfuzC4Dowqa0rjNMVgX61v7uWGhrtvwkZi0WTmgEUO1MIe4
T8e2eyK3hziBMkHSpzaoI+9UK9OMulJ+eGeLLxruX/yH2uqF8xDSC7xu4X4yO4AwDkAqiV3VbdxW
1Orrg/+T9uSKxV0ZXN4I2VxHQotJ6ZxgT42HfGXpWKIM8BMmQAyC+Vjac59divMBMRQ3o+SBaYwy
nZhDPtU/6wyYi67WLUeUmZ/mFDZlbrNMV6hbsA==

`pragma protect key_keyowner="Synplicity", key_keyname="SYNP15_1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
xriyqUWigC3wwKgeuEmMhqfzqZCDZNaMHDBEFi+QIn6qFI1+coTIOy4T+tSt9VVZaIt1uPgEHXnO
IWWx7FNDUU4i57bppxEPJ4ewohN05U+bV0OfA+BnhNGbWTl7+V0a1s8J+rXCUPyUOk30WZWvxtEe
bmYk0lgyKAKSb2x+qGi06cqIF69rA5zkRmbEDCqqXasob1puhK5UpB7cNuHu6zxkAECe2padeH1p
rj8aU31EG+loC7Rj4M1O5QF9raH4i/ckjipUP2cgPmd2/J2fNSRPkId9T5G+QfkmsHYMiR94wHyI
ilTe/gv1XmUXqKqsX9qfYQpXkDuy1C/QHli39g==

`pragma protect data_method = "AES128-CBC"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 9072)
`pragma protect data_block
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
H83Mg5o1Ukca
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
