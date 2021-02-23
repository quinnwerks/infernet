// Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2018.3.1 (lin64) Build 2489853 Tue Mar 26 04:18:30 MDT 2019
// Date        : Tue Feb 23 16:01:56 2021
// Host        : andrew-debian running 64-bit Debian GNU/Linux 10 (buster)
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
VEJvwgdbCt1RLJ7HV/5AiCxEU4tT7XAaed/BEhIeQaBpt+5Kk2zu/i1sNecFoUVjPHXFmIKWBjCy
fqH8ppOSu6M/VeF9cRnXeROltIGdG6GqWsdOqL38n8B+d0WPh4/H3bTG5LVBxtXSKpOE0CnvYSLE
JKHBMPKLeQu3ryKemHl2aUoIq9UiNhYp3YQiC1ohhEg3EyKHBc1BxhjAF4QbeZNuFy7okqBAh/kb
McZkHC5Ua3NQrSRiWS4EXD68vFXBB5Q9iKV6y1vQ2g0MFccY4V8KuUJNo22pRkOLX936cQyhNX4B
AjXS4uP8ZOW22cY4671cPvTpKfHQ6mUqf3CfUg==

`pragma protect key_keyowner="Synplicity", key_keyname="SYNP15_1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
tAYQZ4D7MkhlOt/N7g8ANlphFptXdIXM0JPcM8Rv0tc2Pf0zp69d5kveqWWb4GxNwqRWz7eXW/Le
NInRIPiSUiqZ+Uk3DjrA7ajVZ3E1kj2F+BM1sFCApVycXK9yVrUICPxdb5r8Z2VXkbUDntGekm6d
1lXnWcGeM+NShYNnYVUgenrR3ME9nbk8PQ9nBfFI3a8+qYp5KNd09AD9iglz5r7loOtLU8CoG7Dd
5NnL8B210nLXRP1QNx+635u/OgQj6NC06ocA6a8dp09X+TDuiSRtdQmUyJhm9RR5FEcBdeuHYZVm
1folgYkfbEG8Ykt01t8o8WMXCWtJaf8+49o7Og==

`pragma protect data_method = "AES128-CBC"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 9088)
`pragma protect data_block
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
NkqVOaaPfhbNaKVQ/USM1oqAUk1NFjXzEg==
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
