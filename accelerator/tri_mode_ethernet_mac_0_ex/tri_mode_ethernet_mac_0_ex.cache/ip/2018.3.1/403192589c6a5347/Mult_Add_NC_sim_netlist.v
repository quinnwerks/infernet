// Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2018.3.1 (lin64) Build 2489853 Tue Mar 26 04:18:30 MDT 2019
// Date        : Wed Feb 24 18:34:50 2021
// Host        : hw-dev running 64-bit Ubuntu 18.04.5 LTS
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
ZVppEE+zjWtevfmHOcKfHJ+0Uj/qnVbRiw6RiyLffK2mxtOk9UTSRwXegAygiLAFDeB3XOTRWwKv
83hg2izW9pDdAzzVSxmTULAUUxgRUp54eeOCO3XBHk4Q6QWFLeFTjyr9dobncrJO9sjtpD7vVASx
8YLknubkYcdbJm2yyCM1iMaq0YlGijrs5Bi26sK3CukwjBtNlQ041r2fDZJnT85AkbV1Hsv3WKtn
BcGpmg0+ObLKYuKM/Vb8pQyEN5ZQjLBZZ7i2SjnNwwZ78VXdV3/kmv7LmuRhvLvh/7ywdXr7XD53
HNNof6QJmerPrWCwMbfFzJ/JA32cZEBP8uiOQw==

`pragma protect key_keyowner="Synplicity", key_keyname="SYNP15_1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
FbhA6EVgV1YSW4pNmHtHdRAjp+9NzeDwJvtxpfX4Mz9+LeKPjccPOyUK6/k6E+yhm+5xsYaEmjJ1
7Mhv6iqKIlQT3+3qGrHmmSAkcy4/md6d07DX/XKlWLmvuM/fdAiOnwf56hiPRWycn6pNdlZM/RJ+
iXoSip56/UTEDEA7e/8xctD1GaC9wt+o+FDJ17KugDDISTOUWEyGJQlq6utA8HyRDB32G0CbLS8D
+s5ptUSlhgGfnSBIVS5FRF75MqUMs1/9Mu8fKLeTW7ppN0j6MPRHcxeh4Tmv+/GQj9PjWljy1WnF
VljqJUAyQbQSoC1Juaav4RovQQgmVXoXww0M3w==

`pragma protect data_method = "AES128-CBC"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 9024)
`pragma protect data_block
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
pQ0wZy3vYipdZsSMZ9AtST8r
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
