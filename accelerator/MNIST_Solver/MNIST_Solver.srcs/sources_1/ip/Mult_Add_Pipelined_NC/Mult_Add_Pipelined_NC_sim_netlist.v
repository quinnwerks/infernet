// Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2018.3.1 (lin64) Build 2489853 Tue Mar 26 04:18:30 MDT 2019
// Date        : Mon Feb 22 19:54:17 2021
// Host        : andrew-debian running 64-bit Debian GNU/Linux 10 (buster)
// Command     : write_verilog -force -mode funcsim
//               /home/andrew/ECE532-sandbox/MNIST_Solver/MNIST_Solver.srcs/sources_1/ip/Mult_Add_Pipelined_NC/Mult_Add_Pipelined_NC_sim_netlist.v
// Design      : Mult_Add_Pipelined_NC
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7a100tcsg324-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "Mult_Add_Pipelined_NC,xbip_multadd_v3_0_13,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "xbip_multadd_v3_0_13,Vivado 2018.3.1" *) 
(* NotValidForBitStream *)
module Mult_Add_Pipelined_NC
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
  Mult_Add_Pipelined_NC_xbip_multadd_v3_0_13 U0
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
module Mult_Add_Pipelined_NC_xbip_multadd_v3_0_13
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
  Mult_Add_Pipelined_NC_xbip_multadd_v3_0_13_viv i_synth
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
imYGWXp7rYv1QdNMZKPWITOuvsKUFMy2ul3OvONBnHNrKbinJ7Ep9SLyc+nsHcwwaws8gpvdtOUe
sLcX8uQ+lVgrh1I82Z+SRm+21BMB34av/n5NWdXJ+afjV50EjD+KOvItWIqnRSOzBn2KQAASKUG9
Xxv4yvolH+rsl+QccE2UT0Okx1TO7TJfrqMvJuG9iDXjHzCf9cHZ5iNx/Pw9cstk9b7yjJDfpzij
0Wiyr3WUCsAWMSckZjvcRHvYPd52oWzbVk7SfAM1RFS/hsZ6SwLrRQdw034/T9wOEeIdt+0TrMgd
XOIbWFSOPE3OvqHA8SSmltbrXN1WWTbpmhhNMg==

`pragma protect key_keyowner="Synplicity", key_keyname="SYNP15_1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
S10LSTryiB1nAQ6pgd/dy4CQY6JepuHGz/FtnE+fhloNLIageu966tut8osjaI1vEEaMEassD0+M
Aivv2kRqNKvyANdVIoFoXTaOt1pcOv/nV3BwPYUOLurEVJCx7/AEwD5WkrM8lX1ZPQcgwNGlQrJe
64Hok+pQGof8RJaFzVuLUV6WoNkaPq7xJV+CQr60svz6zpc1wtED57/BkpgOnpCH1z5CzpscZB1N
fD3UfX4n9TMwTx0osg8/LfaeCI3AxmjYpzcRDbtGTwJ+Wdq2I204m1vpV1C4rqtjC7xVp9LNS5IC
3zMGVagOi9vGd9Obz9griuuG82+gmipFA8XLaQ==

`pragma protect data_method = "AES128-CBC"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 9088)
`pragma protect data_block
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
BXFm1HkkgQlQgYo1C3n8L9KFyLziaeAucA==
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
