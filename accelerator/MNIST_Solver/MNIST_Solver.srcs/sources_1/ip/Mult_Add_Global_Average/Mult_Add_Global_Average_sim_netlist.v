// Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2018.3.1 (lin64) Build 2489853 Tue Mar 26 04:18:30 MDT 2019
// Date        : Mon Feb 22 19:54:17 2021
// Host        : andrew-debian running 64-bit Debian GNU/Linux 10 (buster)
// Command     : write_verilog -force -mode funcsim -rename_top Mult_Add_Global_Average -prefix
//               Mult_Add_Global_Average_ Mult_Add_Pipelined_NC_sim_netlist.v
// Design      : Mult_Add_Pipelined_NC
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7a100tcsg324-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "Mult_Add_Pipelined_NC,xbip_multadd_v3_0_13,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "xbip_multadd_v3_0_13,Vivado 2018.3.1" *) 
(* NotValidForBitStream *)
module Mult_Add_Global_Average
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
  Mult_Add_Global_Average_xbip_multadd_v3_0_13 U0
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
module Mult_Add_Global_Average_xbip_multadd_v3_0_13
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
  Mult_Add_Global_Average_xbip_multadd_v3_0_13_viv i_synth
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
ayKGHwwWmsS61jbIbLyFdxKdB9SknCyfQKoZ328=
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
