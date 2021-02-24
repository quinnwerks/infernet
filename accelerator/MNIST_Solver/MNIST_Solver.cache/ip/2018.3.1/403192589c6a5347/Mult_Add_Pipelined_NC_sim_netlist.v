// Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2018.3.1 (lin64) Build 2489853 Tue Mar 26 04:18:30 MDT 2019
// Date        : Mon Feb 22 19:54:17 2021
// Host        : andrew-debian running 64-bit Debian GNU/Linux 10 (buster)
// Command     : write_verilog -force -mode funcsim -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
//               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ Mult_Add_Pipelined_NC_sim_netlist.v
// Design      : Mult_Add_Pipelined_NC
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7a100tcsg324-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "Mult_Add_Pipelined_NC,xbip_multadd_v3_0_13,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "xbip_multadd_v3_0_13,Vivado 2018.3.1" *) 
(* NotValidForBitStream *)
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix
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
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xbip_multadd_v3_0_13 U0
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
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xbip_multadd_v3_0_13_viv i_synth
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
dbF046NG+LuHWgwAZEkH3IHXrQXNVAcMkAKjh8JHlv9bVAmh4TwPOuCNkm/vIQa8ROK+VyOQD9jf
Brm9cl1gQG+DLARmxAJ6DSsqRu9Cu3b+DDtd6XDg1LZp2k+Ai52YVRJhMdB92TOKg9uhaVGTk2Cj
MaAYbmxCrzpvkWqpfyIR4zYYRWcbhuvcLg7Gywg0QwnkkIzMxyODqc4jEY6A9LQp19Ms3LPzqr4+
oChcvxgqkkxHHAfFZGf9eNRqbcrTbN26gFEiGA41KTD7flJqlFD/tLn1nIi1FXBoiPlW9o05yucp
HzDDo4/aOp8/3uGFaqKyzyJPg2ixX6slzz4k/g==

`pragma protect key_keyowner="Synplicity", key_keyname="SYNP15_1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
F4Rj9XYUxEh8zlLmHl2AQ7kMDdorEDuDWCwe+YicUcBgg7dls1HjS5jrMgVEoDgBNnR/GalCAlNu
lnMYniQ9ZEYtzwQOhc7W1rqBAd1oYi06OTa6nO6TqnJx/F3B/gsMwmVxf7vSwEk+RFtEgQlO99ZZ
+Axy/PuGbWCoUR1dS/dlrKv66VALT1tsgnBEdhtkowf4AJqOzfZ1ZNgKpD19Ihf2UaoUaEZB9J0M
urMplPP+usVkQ24XH0pkOI+TWE2BLlXjTrCgOmhphYrGV/vzO2kPsjlF+JpIs4TC4O7x5lfCWm4n
l/+YOLocHx/jVgDw7Os+r7qE5Jht8jTE4rEilw==

`pragma protect data_method = "AES128-CBC"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 9024)
`pragma protect data_block
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
+OF+pnTMeGOEnocRLpHIzhDY
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
