// Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2018.3.1 (lin64) Build 2489853 Tue Mar 26 04:18:30 MDT 2019
// Date        : Mon Feb 22 19:55:12 2021
// Host        : andrew-debian running 64-bit Debian GNU/Linux 10 (buster)
// Command     : write_verilog -force -mode funcsim -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
//               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ Mult_Add_Pipelined_COL_sim_netlist.v
// Design      : Mult_Add_Pipelined_COL
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7a100tcsg324-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "Mult_Add_Pipelined_COL,xbip_multadd_v3_0_13,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "xbip_multadd_v3_0_13,Vivado 2018.3.1" *) 
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
N7qUCKG0FQ0ejXXOZP0ea9byiOM3JMi9KWXe+btkx3avNUi9EUWw0w8mw1teu9TB9SPTBJb3fIbW
nOusTIj21ot9rQGfdvPDZPO3Qs2Xs2pHY6TgQThdfU0J9DdPCMlC3n/obcsNyPFwMw9O81NgtgpK
9fESCQujZGmsc53R+VCGtO/iJ9UnYYqXTsB/Hj0hRciFfxav1whPTgyWDG2ihQgBh1yQ+gpOagOQ
so7JwDt3GJTZO0vF2Obs9ZpMZdTE98/qH2Re2RzucStAeC1Sm50IwlECQjUpzPWUiD3G8XWwQ4m2
T7RMm4fc+QQBvXLAmi8u1G2SsbcDf97MxzmuTA==

`pragma protect key_keyowner="Synplicity", key_keyname="SYNP15_1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
ue4wgij9L8IFUOaCq23thLddU+Rmsmn0w9K3KOlpyOpSWFoMYxoJbt80YvDJKALA7DQp+GJW3aD1
MKjlpABnfWwmZ7CFFrYKzDXkSjWFFZuAvnz1jROHtNsEO/tIsGssawFaQJtUVT/GmtClOvvBzVng
U2EGoEdb8qvs0gUnK6096Q0zQZIMDSHe4mb5ZMue1490iLvbhDS47kQihwcm/7GaCEQSuVlMgxVJ
Yq6A4zNaqbzuOwMqueovs3nRo/slVl3DDYpoJKJkiqoZdwQICmoIP3IzdJjbVm5grCUkXnriZMr9
CyDeLKOF+KyKls4EaR8QQW8q50f79Yp/nNzXbw==

`pragma protect data_method = "AES128-CBC"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 9088)
`pragma protect data_block
+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
MDwgwJQkzJQmy7cPKsTFI1Di7DCMxdBgYA==
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
