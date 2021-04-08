// Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2018.3.1 (lin64) Build 2489853 Tue Mar 26 04:18:30 MDT 2019
// Date        : Wed Mar 24 14:09:03 2021
// Host        : andrew-debian running 64-bit Debian GNU/Linux 10 (buster)
// Command     : write_verilog -force -mode funcsim -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
//               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ Mult_Add_Global_Average_sim_netlist.v
// Design      : Mult_Add_Global_Average
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7a100tcsg324-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "Mult_Add_Global_Average,xbip_multadd_v3_0_13,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "xbip_multadd_v3_0_13,Vivado 2018.3.1" *) 
(* NotValidForBitStream *)
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix
   (A,
    B,
    C,
    SUBTRACT,
    P,
    PCOUT);
  (* x_interface_info = "xilinx.com:signal:data:1.0 a_intf DATA" *) (* x_interface_parameter = "XIL_INTERFACENAME a_intf, LAYERED_METADATA undef" *) input [24:0]A;
  (* x_interface_info = "xilinx.com:signal:data:1.0 b_intf DATA" *) (* x_interface_parameter = "XIL_INTERFACENAME b_intf, LAYERED_METADATA undef" *) input [17:0]B;
  (* x_interface_info = "xilinx.com:signal:data:1.0 c_intf DATA" *) (* x_interface_parameter = "XIL_INTERFACENAME c_intf, LAYERED_METADATA undef" *) input [47:0]C;
  (* x_interface_info = "xilinx.com:signal:data:1.0 subtract_intf DATA" *) (* x_interface_parameter = "XIL_INTERFACENAME subtract_intf, LAYERED_METADATA undef" *) input SUBTRACT;
  (* x_interface_info = "xilinx.com:signal:data:1.0 p_intf DATA" *) (* x_interface_parameter = "XIL_INTERFACENAME p_intf, LAYERED_METADATA undef" *) output [47:0]P;
  (* x_interface_info = "xilinx.com:signal:data:1.0 pcout_intf DATA" *) (* x_interface_parameter = "XIL_INTERFACENAME pcout_intf, LAYERED_METADATA undef" *) output [47:0]PCOUT;

  wire [24:0]A;
  wire [17:0]B;
  wire [47:0]C;
  wire [47:0]P;
  wire [47:0]PCOUT;
  wire SUBTRACT;

  (* C_AB_LATENCY = "0" *) 
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
  (* C_USE_PCIN = "0" *) 
  (* C_VERBOSITY = "0" *) 
  (* C_XDEVICEFAMILY = "artix7" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xbip_multadd_v3_0_13 U0
       (.A(A),
        .B(B),
        .C(C),
        .CE(1'b0),
        .CLK(1'b0),
        .P(P),
        .PCIN({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .PCOUT(PCOUT),
        .SCLR(1'b0),
        .SUBTRACT(SUBTRACT));
endmodule

(* C_AB_LATENCY = "0" *) (* C_A_TYPE = "0" *) (* C_A_WIDTH = "25" *) 
(* C_B_TYPE = "0" *) (* C_B_WIDTH = "18" *) (* C_CE_OVERRIDES_SCLR = "0" *) 
(* C_C_LATENCY = "0" *) (* C_C_TYPE = "0" *) (* C_C_WIDTH = "48" *) 
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
  wire [47:0]P;
  wire [47:0]PCOUT;
  wire SUBTRACT;

  (* C_AB_LATENCY = "0" *) 
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
  (* C_USE_PCIN = "0" *) 
  (* C_VERBOSITY = "0" *) 
  (* C_XDEVICEFAMILY = "artix7" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xbip_multadd_v3_0_13_viv i_synth
       (.A(A),
        .B(B),
        .C(C),
        .CE(1'b0),
        .CLK(1'b0),
        .P(P),
        .PCIN({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .PCOUT(PCOUT),
        .SCLR(1'b0),
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
cQG8Zbmy0uiCyw1zoPyV2vpNnH3+ISvPK16eTu/szeTwKV53L24+Fp6TfZo8lz8nfdik8zREU9P+
LUVGM3J2DabyBkwzrdYnO6O3fiyyrYcQXG46ACaIjM8aiAwMhegLNM46niaj8I8mDR2cEIkoV+eK
sm/dGKvZoqrS6dNI8TX5Y0ISXbnVsa+efPChQcvjhHQ8DeQ7DrX4Cicp2xStd2wvZ6Q3WdvHWIba
FXBhtHPjivKPpYQ0s3qFxuWtWUYU5TOKgQbAz6+Y8YlH36ZX1imEH6ntykL/zgfdH56SHYahXgvP
sq3auFWivLhOUsYRN8SXBWda44rq7J4hOFsiKg==

`pragma protect key_keyowner="Synplicity", key_keyname="SYNP15_1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
Z+r4yNLwnH976RGcq3EJkeggpBYkb+2q3kfysnQ35IHTL/ITACrTbkUsomUK6o/QrI9xvCMkHK1p
vTPQqg3f/b66xaVmpbPfpI6uNknSMyb5qdxX+43V/8XXANnKJGuFBLAtYnfIBsAzebWGBBVuYhQu
LHpT4WmAUF+jIlb72FELkhdp8HcYkLVPyndJeJVEcmlkz1IZotdVIT6OdhM+p5ei35MJr2Cem9Mu
kCZoz5oluxHB9QgxX6kIytAXHxWCFejHRftiuXfAMJfBxfeHz3jKGE3Vo6VdG+VPcAeaE9zb2N4P
anzv38dTQWRDFe8SUgTY8SMUERcBUoCjFPw+IA==

`pragma protect data_method = "AES128-CBC"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 8432)
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
