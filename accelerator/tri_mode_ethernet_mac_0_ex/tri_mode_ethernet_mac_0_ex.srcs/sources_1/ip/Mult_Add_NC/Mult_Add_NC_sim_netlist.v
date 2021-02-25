// Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2018.3.1 (lin64) Build 2489853 Tue Mar 26 04:18:30 MDT 2019
// Date        : Wed Feb 24 18:34:51 2021
// Host        : hw-dev running 64-bit Ubuntu 18.04.5 LTS
// Command     : write_verilog -force -mode funcsim
//               /home/quinn/ece532-project/accelerator/tri_mode_ethernet_mac_0_ex/tri_mode_ethernet_mac_0_ex.srcs/sources_1/ip/Mult_Add_NC/Mult_Add_NC_sim_netlist.v
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
Axc/IGcAPOD02xkYuSCMf9/XsIDB1R4WghJ/W3sqGeOzebc2N0/B5TEfeDhTDnO8NwZt+sNuKyU6
mLrNSaYcBk9FaDC3XVo4sYDYzCpwZZKNpLpdg/8z6T8YsioJWz1GUGypgZdXeC/+vNWKt5cmBJCk
vMDXaCbBOsC1992hubZ8jXq9c0ghRkzINQwlp6NzGWEqXbpfyirGZAE8w0woDQknIPC5MKwDUzga
zgo83RXbCZ23V5zKuI5yid/h04jdlPxEtCFgHgJZg0LgtQe/UNjVIwjY3K4IPkCdGg30Hym46onW
AtNKxDjBuM/1/AX2Ynz9o7+gDIgcOi0zXElEnA==

`pragma protect key_keyowner="Synplicity", key_keyname="SYNP15_1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
ZGD642+ywWnQ61xRjTQycTO80Ows75WX4vXi6IPDEeTkmMIvHaUAhvHXOElhrT1pFcY/cXs4c66S
wz178rRr2IUrXap4vzm0SC8jzarzhssMLhOT6YXUXot12xB6dMWfAWyj3dJTkfZ6lZZWwUsebTKh
5/lbf3qKv2dWVNq0C/YURnK+6M10tg8/eDfkJCPsKdCJsBxKuMN1RgM6kcLYRiF5rtcB33/HoCQn
1qj6CPW+nfvLbcpCI9wngxWBMon3riHWwy6UkdahuVNGhAuuNsOa3ybfZKyvDMZparTbF+pITznV
AbfkTwI4jVuNX4g9AdwDn75V/AQwFx8K6EqwOA==

`pragma protect data_method = "AES128-CBC"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 9008)
`pragma protect data_block
+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
FoQ=
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
