// Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2018.3.1 (lin64) Build 2489853 Tue Mar 26 04:18:30 MDT 2019
// Date        : Tue Feb 23 16:01:32 2021
// Host        : andrew-debian running 64-bit Debian GNU/Linux 10 (buster)
// Command     : write_verilog -force -mode funcsim -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
//               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ Mult_Add_NC_sim_netlist.v
// Design      : Mult_Add_NC
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7a100tcsg324-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "Mult_Add_NC,xbip_multadd_v3_0_13,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "xbip_multadd_v3_0_13,Vivado 2018.3.1" *) 
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
cq/IG3OZCKJuNuQoQdVuGPkinqNcx2G6CHY/zd9IwviW1DxK7orq19KfsLVYJ66iudvw4kEXXhQf
oGoop9AYaGDD1SPWjXIQp09BM6wy8sXwGr0Y2rDryx5+HmuqkfggWF9pGH73aQ4A/tBPNHcQOn9u
LYcQWksxjdTiH484T3WgOB+b0N1g6Q073EfK3eG10oAQePUV7w+cjfLeDebC/fmVPtmhtSqaVX6t
gzfPa4URoOSPh8ciqEkg+A/OC+X6jYjjpL2xPDUL94ilvGm0AzxxbWQg7fJhVGqJbfWncD3dbUPw
vDxy+/ZXwmNrhz3Mb8grP+05jlBExl33qq8gUw==

`pragma protect key_keyowner="Synplicity", key_keyname="SYNP15_1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
fOIXbpzKpjaOUGcVuc/6/RxAwgAA+SUqYiLyeDhEgPo9sKf/WvsPKQSjsawKoAOr71anoh3r9wD1
vZM3iwf0mqcDKTaw9V70k11MbfMOntI/NggnJzQMcjezkqV/sYLLcLTGebD6bHPi5y4PVOu54en3
wCs9PTleRHCb6CRUQx5DA1n1sdfT0uEKxljiAhfcQNahpCNUQN0TCb6YHm3czohFIoRUPHHCXRCP
mFiyEipQWArrkneTCeeVl+En+qOu4RuP6xriYfk7Vvpf+i6LpUomwAsP5nX/6s7mqQpqxZKIuLiC
9UktKztkhAkrZB46kDj8twu9wmcomYc499nnig==

`pragma protect data_method = "AES128-CBC"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 9024)
`pragma protect data_block
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
Q6otcsbJhr3osHV8d6WqmCuI
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
