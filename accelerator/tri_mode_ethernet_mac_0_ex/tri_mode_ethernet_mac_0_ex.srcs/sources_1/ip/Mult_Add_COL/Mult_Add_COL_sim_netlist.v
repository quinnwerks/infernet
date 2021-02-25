// Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2018.3.1 (lin64) Build 2489853 Tue Mar 26 04:18:30 MDT 2019
// Date        : Wed Feb 24 18:35:21 2021
// Host        : hw-dev running 64-bit Ubuntu 18.04.5 LTS
// Command     : write_verilog -force -mode funcsim
//               /home/quinn/ece532-project/accelerator/tri_mode_ethernet_mac_0_ex/tri_mode_ethernet_mac_0_ex.srcs/sources_1/ip/Mult_Add_COL/Mult_Add_COL_sim_netlist.v
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
d1Y10YtR0XrqRFsJcv79yUgNyp3c2BO4887oFhJ/mMtqsL81ydY3FvknPypnmM4fdRiqcc7d4wCr
tY+S/m/B4Fm+hntZdYJpcTD4CPOri3UlxFLeSv6EooCHmrGucfNcdaYM19Ev8Rcw94kDRpCaG+dD
cUZfWehT9fhXYRiBaTJspoS4IQNHMqq9pg4EhHXsxg7lsVYA7YXu8tcrLsM24qV4MhiwBERc+z2j
WZgj5Tl9D7NK5npsbpCxLrD4ElRQsUC7fOOWIB7lgrT4qjukVFYPpa6D0TXg2Y+kgD3dXsJ6ZKdF
6gSsE6zsCRQJ5Lq3KxQTG4zL0939nGwYeSc2Yw==

`pragma protect key_keyowner="Synplicity", key_keyname="SYNP15_1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
UBzm5QtNFZeQlXEH6oGg7ErBiqwLMLuadrJLZprL6y3aLfMi6yxw4ELxUs+EmO/22dfj7WFECFca
k+pmxig1AON63eR+c5Gt9X4tw6JVaRkXfJk7Yzw3hIZebYnHOk2uJ9nnSfGa/XgjmBZsCZBlMmM8
Viz+niM9E3o+wKIQ3a6wAfpNWiVK51nQq5TiBYne79n5sMxclWO+jST+Z6iL2TLOM4mGvo2r1fcb
M7KQgIphWnRM3QyVNARm0fUQSlAqO9F5E5mvNKVqK4PdaMHcvuPXdXHJhl7RwmiHB8Ks2WoWsgVb
lf/1as5gE0WNRdfZmNXWyIW2CEzDq8xksmyo/Q==

`pragma protect data_method = "AES128-CBC"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 9072)
`pragma protect data_block
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
o27AQP1rolpi
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
