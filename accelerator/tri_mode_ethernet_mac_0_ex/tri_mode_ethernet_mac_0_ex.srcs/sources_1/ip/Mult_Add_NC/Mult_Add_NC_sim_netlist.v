// Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2018.3.1 (lin64) Build 2489853 Tue Mar 26 04:18:30 MDT 2019
// Date        : Wed Feb 24 18:34:50 2021
// Host        : hw-dev running 64-bit Ubuntu 18.04.5 LTS
// Command     : write_verilog -force -mode funcsim -rename_top Mult_Add_NC -prefix
//               Mult_Add_NC_ Mult_Add_NC_sim_netlist.v
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
(* downgradeipidentifiedwarnings = "yes" *) 
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
A1isrHcT6OuuNJMmVAqTEuTYh7LxboDVfG+F+WKKGGRNeh8LG1fyVwAh6r344isqSYa67Ni4mTot
IDPUQrOujt4hH+gHXnfins8LWC0Q/fWT6BnEwMg4UJH/inuBprgBRfGhkUwLN4vNVXVJbKuqfp5n
wvfznD23KCNbb+mCPj/6jPc48tJBttvJu8O015QZbPhxYfQ5VhTnDg9nt9RFKKzs1ZNLMCzZVD4X
12Z8R2Wc21ZOz8FzsikTzPdv10YKwFhBzLv8EL8RjU/0fRPW8lUmCoFDmk0HSEAjhFgmFwiA0lrW
KULkJhSp7FjL+LiDoV3yNBuH4Wl4CRVnxQdQf+asc9AnJpG8rzEnaZDsPCj1CEG1WWazFlkl5Wmv
z1gBUXQmcHS6LRj8HklepalnEyQ8ErqJofr2GmjxLydcJCwu+xdsNMzko+U+m0qCwvgeuedD045e
4H/1fd5p/aS1GnGdoDAuuoTsKBesK/b7nTskXYVLjURwdPHulFDyLktWy1hT/dhem9rMsnnnJ2YI
iTSREoNSenYZeXnC2LB2S73hrl3zhO3b1UrLnRLhsW7d8iW0gthEAeTKRG2YzCOCPBG9MK2DEd55
QOtdSA19EJlurfYniQTn+2zO4FtexTXlnchbpeeFwDeL4DvLM9oUrctg6+Hfkn839j73s2so7tmK
kgXLSUaoUAfgaaUkKlNZ8Ubm4AW7up3DCjl2hKvqfB2TENz3n6rj2ZhyAEr58Wyz278CKHzudoFE
zjoH5is6rZSJdEZ7OiDpgkW8uMBffR9BifdkkvIL+RdlE28cnJgKrL2B5k5D2SL94+5pVycaWCPu
RylPyxopeSRbRLEszvG1lOx1Me+UXbIN3fuYv3sLAl6TUmPcnlAor/jlhkbBvKd3fej/hGMWyRQ9
5glBDEenA5JQ+Z8B0d8bq858W09S72jILhqxhC27U3VVRHZjKaJ3NqEQ1F4DnjrXwI6oHHwUPlCW
FvFHD2Y83IvbbgBBXNaQ02uFNgudXLw72isizCjEpS9N0pG1VRG60BBtOzbhESW26ikNn89vAbOs
WNeKxmRuGStGWCdiP6FxJK6un7xrSyG7wHb2sLgCqe+z+oVzLvRAzm3n+MQfWiylEj1ruTubEyyl
g+VDvqAC4H/z0rS6Nd+JWEICVBF1OjXKUv+XJ64PkTwV13V+zKtFYSdYMd9KHvBMrzkuBI0FiT0c
AaSrrRBXcUs/xCkbG7LxOIbkWAZr3RXQ7dGQe5zjqFpbrQv3A0WkLTtoyqjOJ7f7N1XQ2MkuWr3n
nuev997p/KzXMq5AB5TC53wijEMqXIqtGvPbOp5G9RHwdPVQ7FOS98biwWbNZ46EsTnGFj8wm7kg
QlD12VmRXi4ojm5YLHT1RqQ5Lw7QpUcNop1++3T0gpflKfb7m4cIg4JnV55UYyvplbcvFltEXN8Z
SS7Ij7G4wFW375ltP59Jk34QcBp0+PZDn1CJ+nX5amjq4NcSy9fBCjmJaWxA5La7LzYgMlj6wd0N
JSLEhu9x76bprmXK/+L4Vi0LmSE4oTJ5iX00pyYr4wc6tYuky9RBzxvnJSoES4eWMGBrf7Jtk7VC
fcCLGhChMU7VyXYFV7Jd3fuS0G4eF8Tdccz4OSYit+i2S1cFLTFewpmknSEeLhPEWm/3gUgMe3Qk
pRfp5NXxK5c5/wJzZd/w5mN8EeEG3PjJvgb4yMhPvPSZTkOqOsVNJvTR7SfgjtU8sy3rw9uRDNB8
LLag6lj7K7vAeGj3bSqWnnhTVgVtfsJz7OloSIt0l6VUViTPhkqDJ+HiVSyDwbnbzsh5kyjOT7M4
MrmYJMbigidckQ6PYvOVmvJBXJKFhh54Qq7XGwJxJALA961VYQTvy+oY61suN7rPHjUMj/kYSRer
+FmOdElyTv4S1v80f+0PI99pd5dMZqwjtG/5E/F4jMw9ZwfCg43wiBRrxe0PdE5mEgnestf/j8na
J7++qC6TOlRS8x6K+mV8FEsUOCRmFomi1sEGU0CHJnMy/8d/ktoUNyFxcOQINHpeYKTawbksmcRn
6ox/KibXO9sRpxZYexbbs6m7KDojiXcKBYqT4QjPpjZYOiZWnTkdZ7wW9xUISAMb7cspElsvsz5b
YBIQcsL/3P+/6M004q0BcD2YaovTh/1s01FtWU4jlD+PTvJjBXHB3Wz++J/BmhAteEwKxqmw+luA
QsbxugKsPc8zzkN6rJUC6K2WFpR5WUgmDRNeBmlmlmO07VBWrMS+dRwFN+tF7khg8s5HFUsKHvbm
vq8lxJ0VPHs/Mw2RQg5baAb1yPEaPkB3VDDFSrT/p0Fvev4398NFD9BLOoVNnuzpZBlLk34KpL8o
ZIOoucZm2MeJL4+Bmw24ueIVqHclDv4FSSg1AcPY7kKcGA2lbO4eojnONg+GKbOglNCncSYE0Jc3
23WnPygWywaIcEAdxjyPOAQwLy3E4vuKJhFraYefdrJ6u6L35ZJ8ai9ruM2mvcE7IHVRghQuCcDo
jyOgCgiRzUi/Y15ZzlmltQcxkKJrAedXovvGXWlPx6E62yq5gvqlQGpk4t/k5iugCxfXrjt+fqTo
OaitLmgsueMg5yrWxepz9QJD9Fl+UQwkkQ95wPQ4n6VHt9yWfiSMjYqHtKJ/E4Jaai/oOP4kqQNF
n46Rdn4BCGkOIeT6lHunLeRtXaAgfrYZkYNmnqT3IMq+NeDc63IpI7HKk4fq0q5h5ilPXI3df6rb
zbGPGMxpnIQdGziEJFFHrG5NdtFQFSuWA9KMbcHUAuEfME/nv6c6MTAj6V/8TJllYut/7D3PeczN
IozEK7ab6OAfO9cyo+CO2j5m7OigixX4MiEB8X4bjlU2N6KBMtpmxsWN4l1st/gYuaXSPq2H0tAw
w7monFnoRFBZ6IQF3sPrLD/IhkzrIIzOI6BO45E5mvq3yRiUrN1UX1ZD0c6xWVPkhk5Ap7gJ6/e/
nA3D/Efw8g+6x4oxSXPc3CJz8TduLTfnJ8X63YZPbAf12x47oacNDrZywczF9HeyORvia9nPRYLW
lLesr8Cpr222oxvDzX21e/Z3IGKEXupAcMvLSCcavpGkn01O2N6N/wXmuRZqXi9pA3chI19Pq0C8
bvY5KGQYDysYi8PaoMS9ZLw09vGQgTdy5OEUsNLUE5RnbJyj0gRyDuMM4El6MtMIpIbd+KtYWImm
d5VzTf//fnBXyCVtG+DwElK4/N1claB5lCGUDKMWxmkouQ1zyHbCZiOkZATm1fBRUpQWi/iSGNBb
UztOGxYRAZe9UjTw4nnMwE2SH+un53Q5UYn9/uUipfAPmko4IPV85H9BCOPwVCUKjSt4LiS8VJ1V
467A9yttm6FqhBcTwqIbWiESqq90szUB0hvHWxZMHu4U1BCQguhVupNVrxptb3GJEmzQjBpNjtZK
OWPLDtipV7UlnKd76kyOoKwlybb/vv6im1hHGEi2kEaCSkx4FBqlymE6oLSKjt5vFEHSmobeNRgJ
4/vMfb+veQgM5wG0hQne5CtBJPR5AAetWE0uAE8WFMoR+Eo12391cevjB0FN2WtyeIFF9wKKJssa
cIfsmfVHj7Pv1zU7vcBQLhe16sspR//BWlGNERWDebYZAiKT8xIhGe0+C4z1NQxAihIsqELv3hA8
E27biRGctXJTnWb6smBDIs29WoJdMsyBAO+4aoEqvQy3D/oItmPE0cWhKdX1uvg4Sba0yCx6Tdbu
d+PpxdZ+VHx7J6SZkuz9CpqMT6U1K4RHpn7MkDsbkER5ST8o0NXXYWQENhNn7mBY4AzvNjMQzH4j
sZkl6AdT+HryeJ/KCblzgmOjNlSxLxus7qnDZe3p98SvbvSiWshbbqHyLBFtl0MJwIsPlu/Iq2xQ
pnK7Jw3QtRgyD2W+VdBUPf//ERaCCQyCxHJ33DdPbymCsHfMfVtzib3guhQdeFgJI3KuUVxc3CmF
J+qjrMp2GN+9N6hGoRAvMz/lpZIwLpzaJZ+dfb4u4xkQHB0JQuLbxZ0TLaSm4uWAMWkYDDkU7cGx
3kkpD3MyyW2DQtdrr42qVHD/+vWxs6Ee5em8kKrmAEWlISFxpxIeieUQrcWLMTJsyXRMR1B/Ynzn
9CUqgS0KLHBh2Vc+61/6lK+OXNUYjvsqQUg9AtjMLWBf8PB27S1rZA9ujc5IrE1sEtGjEM2+zsxK
/JrD2vVPbY05ZI+tJatgCxbeHNFxqUWDee8zi8obUfeDOeoS9J636xOt6t6InEYeOePqNn6Xzqht
SpiyvKY/C70xxQ9opcOEfTSb4dGIPnZcYbCHC6CU1TWKqGYHC9/9HbYmYYWBGDvp723G9p00rz37
2vOnKA1u3/QpdD1neQync5DPgTpevxcS2KyIcLLd+mtKwRMVPWQQnsHBApC7LWZwHJvyjg9BuTTr
xsFgj+i2IGNVmXo8OwWSvyp5A8fQ7Qbel3yUEHVV6uYge/YR+xhbTFHw7PbG/cxBks48OYsij99R
P5JuqRXBM81bFRmP0J6B3jn4glfhie92Aph2mSy7fHdu1Yn9DObddJO5TBWlXP7Kt6qrfwAsiHtu
nyLlnQGP7jY/cOwU2Zsz3RGqwoC4EHxB31yRKcsZ498GWggbjFyIRo2XV0fGGRe4COKP5oZXQ1FI
EUnBLWMZ1LLbBtXCIXL0T8UhD6Xvz875chjuEGAEyBO4Unya00UF8wWZLcOv5Dc7/78jbMKWwJ3g
BcHH2P0bt64FFcfpIePRXl7oc/8/THIqxKI+/3Y/uSA9cNXtPe8oUA0BEj9LAgJOBIULJt2w36Om
OufLTupKWP+4d862PfDHeIyhKz9ETiRxZnSeoNUkxndI59OmaQyt1XYmB4gcqGeV4Obk2ueajoWT
VN+8frnjvSfVaAzVLYp3gsTu9ebkkzrJGuAid9AM9sSCZnYtd78O7jfzVcH3jDOdKMMKqDyDkYFf
qtbQgw+IxDodIXEE79x8WeppyKKCzxbcJJd1bDSHm+Ql5m/+JbXUXo7M3/ThrcDjCtqmILWMomHC
fiGLnaLOOz5nufJ1eHpBWkdutg/gBopylfCGGgao9UcanBERWds3xDVh9a6GQpN1XD85YLDyi4Sy
UTkJuOQFoqaqFBXkWI+m0Pec3Sh4U00+BNYr7tJvRyV52d6kNuD7NH8eWk1IfFBlUzekL6KuY3Q2
M1k1jGrkf8b6c0RGmaPzX2/QrHdqdfARg2KUIbWl1T/6eLwa9Zd+p0cVAVEm3UiUzUXwkB7qvz4U
yribk1S6PXS+Hi2sviK99mpzmJBNlElCiKfGIRUfC9tIbeA2ns+VIWazgNY3tsp8XsSpnvY448Ia
aY1bTRmpK972L8gRmw+mowxLu0Ve8R0DTSf/qFIrBcj47iI/CfTHbH9Np+6iAgcwu00/mmJL/81U
KZHtYNQwv+d+nXLhb2YIwe4e2jEp5AV7nnAI9dPHl0wfYE9Dy9VbqTkTtDr26xsy5k0GaTVYIpBW
HTlHBw8mwLc0nxP5UC/52z1Q/N6nCMWtxHaVSH9q7wzmCDiJKDykT2NifPAqM0+RMFcDCpf4OP7b
alZr7r2vjxVpfOuyhpR2Ssz0XukqyqhXbpjOXsWa7G3R8cjXR1qckk53bJq4T+NwDm/NJFKeSVpE
xLWuRpe8ZqJMRBMgUngRefRJGgYQiYNgpYVVXzkdmyNRcUyC+8jlrxrAwApL7JcjTeAV53dbjNqW
pkpEu0dz1YCtbzxagdV4O1IpnxTWq8ysnExJCFKbsBItC02mXhETH5XmhNMg4CJlWgq28UA+xlwQ
Px9Gn5rtFq7VtRAq3XCqre4wky+e/B/MsFSrdMfP+F3pJHq41DVsTPb7oK3gQJiZvwhZPl60Xott
nM4cu0XDkczfw1ehtZRhM2md0TmDBli0VNfx8C+YsmpoMz30lYrfeVaF+ooIY9Z7GdKbiyTqU99h
KbX7En7IZIuO2WTPpyJ692awtKJ8kIE9rjD2RN/sEaT7xFYayttR9onhE0Mus8UuEKE+dbReuj7b
Au1ARrzlFI6hqIwKMXrC6LG9O6bPa27OySVtYEDwrKKiSvg7OHsEt9DMTZQ2XbFtySde/VxEVRxr
h4KeWJAvpVOqMBPXGsQgeXsLa6FrhuG7GXKb1ieq0O9kg7666Th2WgBw6a6XNxl0J+VjS66UOTJE
dtip333ST81nc8vae/aTuMRBW+BKqNUQ/3zqrrlph9r9qn3wxodbYmrcEYhF0aJ/Z6WImLENAFJt
V+yj/vWxC6DiLg8QWoKnhvytcNEt1smtR226mPLACSuR0dlwDU33N0KJGojWsux9zK6Behb67YHe
YMy1IOpMxF+eQKBPXRSEfWn4551IRDN/PSiTV+0LLdqsa6/hfOM2IRAoqB08Cd6dLyVHATX5J14N
jG9PiPj81yM/k+A/xvCck530tfUhWFrGwbrZdZp3Hgga6rMiEMSdJv3XoTxy3Sp8Wvfc+WEw9ldc
l/9JmWEFCxYx4SFEMIbrQqj7rLCO43ifULfUClBmXmWEQ7ZJg6myox6jV1GkUD4e7m7toZ+j6zaz
qKsOH0yv5C/Sl9FHZlpAszeSCBpUB8S3LafMLRVKGxxdaaRXh0NyAhxGPRN1ynvhvKfbPvGNQ1Nt
4cuuPXEgbZmlre7bf/eKqJD7avxqyh1dpv2rqBCLQDXJOUISJpDsNyWEXlV8STOdAhosL4tkbV+9
g4mMMhWM6r9334PyEgzCoom3EQUIlWix8JqzykOmcluvWzifDRjVfwBKo3eoTUjP6tXCp3VQfnyt
4dqWnrlcXlwpSZYeQQZCpwJ3hiswoDu6Ot213v46bKjjJ80eHeTgHxnGdLlIpiKocug6mxuABKER
hl6oWH5l5euZpWQMe69X7sKiX8b+gtXAzOXyxhtMyHmZVKCSn2foRp0FdOuF6kfCImYr2LnOX2HZ
6bdQOzBmvpP09cJaWqqdX8R4XdwULNZAr8RLuFVofTsBCE08NiqAgr7eUOf4YoHksLmKa0V3kf3o
rPwayzFx8xkY8jukfVPN+kS85zb3vuiZjQw6We200mMFnmFZ0sbA20fyqC9ui+kXfWrsDcNChIRQ
l3ka3GTqetjNnKs1ZsXH1KStnoDIFIbPWBXt9E5IksOuFhVPKdWIuj1BOGN/ov4YnPbokZ7l7cWM
d9Aq2kHlT+p4NmF32N7pkr4byX0t6UWF/Mj/X+gLtlkHCCWTqcF9EyC/jKqfezX7ZqTx26AEGyJ3
iR+Xn6JLp9zDw+KxG0Ll5z2/0gidGrD+jmp2gnZed0W2bCQLSehDq3z4Ip92TxRa2K/CQiwNXGoT
imwHZU+F7qHRls1Vd6t0tZY5cI9ORJn2Vyap4jeJfQACBVr7m54pa6Sng7RC7NSqknbxdPsIkc9/
lhVrqM+cEFg+w36uS7AoQrxvASjp1wtStdCz0v3gExTe996+v4y8ZF6Wtwh8mNWXpoEdrjoSQpQ5
rmH+kyNZYpKlGz+VZXvzP14hhFunUdtAAJsnSpzu4o3o6bMpq4tpXyZZN57cWPLljnzMwG4DDD0L
uFxkvSOLtWsxOdDoeUevaMRgcO2TIq+Iffe0XtHlwZV7lmjSE8L3mg4q8myWHWXlKCrzKeK69RFw
Fa1rId3bH+32+LekV+TJFS1cw2gvapbQJG2dD6YdX+s2sew+IrANzRusZ0dfuAwq6qjQp5wQ4mhc
o3WQDRHBWRhI1X7eXvYq4qKA6p6ymAvotpMpuj50CYhFKSWjSBhX1aqcmJXC7DpMQDeIbNzAd0bf
6S1LuyIMonhIk3WG3R/NhELODDUU2Q0i9KK0rycHZ8iskBipjqhBzsSNdQlpvSa2Fb/0E/ZlcHge
5fYUsmQkm0MgtRQrnekirnO0X0rDzc48bm3tRz2xnIZXbAUniHV7ZrXVFqb/zxWwu90yrunP1xIn
lue64wqEkAx5NNwSg/MZNp53k32+eb9eAsv0y24ifSlq4BoYgnS6UWz1k21Pwth7+mqDTcJKNsex
QCIwad8IMHpMOLpNlDMYST26T853e5xKk0gbGdfqPrb0C6cIMy1998MXrv0dm6eVph6VugrmSIoa
pe7G97443MWFx42eDWKE4pNhO8ieh6IB4bXVsNQe1UGvYoHnbwmIg7PxEsPIqEU2N8z1scpYiXQQ
DoLq3up1TAOo+FWq+2yez/CcxEcjyQttvhsUmQAJrzR+I92jQHJxBHsPnU4AGjRacqFs6GDCNwGf
8JDp9aDmcWO7FvnC8m8xip52CYUiEDFQZgIH0S92yLYQy9bIMrobxFFf1c3rV8gKAHzOWJYwuBUp
q2lHEJXsVvhb7zW0lDAsgIWAnvJXx7GUBBrVwVlqzbKMD5Rom/ssUggF5Ddo5qZpOirK1sdMB6FP
bjk4fP+vitBcYCe+mJhlBJNWl6ryqX1pjCvzdhfFmdeK+WkdGx32wik5d2+sRR8+3L3ReZJ3kX91
amfrMHBLiUbhQVLTit+DRxSi5zTsVzFbnk9MqZUwrBfL0xzHvHNj+03QOEcPda6+dzyqEozi/zMm
oI0z5GHfR3yzUkI7qrSWDTCqldv1RF9pg8vssky0jEuSLv6RCtNDqKTLMC8S3yKshO4mKlxWMIUV
ZAerix8Y/PJuUsLybu/10fSfWxGjQQWWRLB/XXNAj0YCqcAdhVCQaeYVn7YuqUyVAIPRbJYugKrH
WTMUzmxYTdc6PlTwLXD27Wg7g7v59E1rKu2DvW8fV5QYkO3HSWLfVi/20GsMYVs76lQ7Zm2EJ1ZD
7R2hsaKM1CHPV/20fWft6RhdjknqQ2P1fQRtDhwfPDg3HuTNMW6pSsmxWtGr4+dkSIN7TAHfOrOa
iQHfJj2VBORGM0Mn7Y+gE1TdHZc1buiqngTKrGFQbVVs6TeC1T8hs/RaTT8r/mjdKdoRc21WmNYA
U20QRhCV+HSZD7WTvMu+KSK7+bcp5JUp96YClRx8ldzTJqMmMzrRJUNWQkJrAlLcdA7YFvhpgLar
sae0ayeLvjMKyYtLrH4QbY0BVugfw6tiN49WsnELYQfFdTEJ3ZB8SPAygYzh4NJz4JUcTaqPnVWp
IC7mGTS3ia4fLuyHoLdgcWQ7gvLYwGmpU5vKvxY14mpoZGzNK8/JQqJeJrB9ON3uSuXYmfNxhWb3
1A/CMi0qVHRiLJoVg+G4N+MlWpWjkeVJF2UP5oC4lMy+PwgutmSV7paf7td+pR6uy3a/XzQF+7/B
BT389J/DtJeV1ikpM0Rzr1xbXE6L2Gv09s9L2JVrcaJbRhhGnog3lj5UjxjADTBQs6+1P8BbN2uP
FzwlSEYHNGPNmk9SWqG395FyKGh+JSJRFFMlGhaK4kDuYtV0/DJVoyWDcDfndSxroTR84oObkCGC
jeoAth1lT1HiWsP5d6M94U2StjlK1rxUoBcYClDEt3LLG0Q7EDUaiglm9g808jS2DDwJ1hq31+WV
IgGY40vV5T9HdVST7slChtwP5YAMAoL+5ZkKb60M+6T1nE73SqoogaYvgdXpJBf8dkZCg6YWjgYf
XRyq8sDxxBip3R87to5gNE1dQpsMgzwREhih2L6XvODSyoBaD4vfdvvwCrtsi0FyGguP5kPK9Iy6
AY4eSR0UO+2AVo0JEeWAgGAlOSAvl/ruf5CFSvxbqf3XmNdf3rlB0/WXPzUFeaBB8lMtj0KJsi7D
8aLMz/LFINfNgjzcQuqHZZirx4DHOqFJIxx9f5MLsOc7iI5uj2oYrr9uYr7maTji+JgtlaOFFTSV
tIKJ78XtstaHJ0xvCHitJZH+ntQmqbl1CtdjmrirKCJe+S26Nm3ljYHOt8uZ7NjLkIVEAWL3dRWn
y8Tkn1KM1D6KPWAekoezGWjcGIyNhjbRJ3I5aRJAoDf1GJZOGq80uVMOPiRVLcEFQJdpzmGINPUX
XIPZ3mtcoT30xVM4eNcC9LaQlVRpDELHw7gOkWgSA1XzuiNdJeb7JdpVEcKyr2qQlBEQcjdGZw2o
6S+M+DrPSbjooed9D1uSNQjqA4lwhaQsI19pwa/+QowkwAALi4w52EWLOve4T9k8+p4LJP03RPH8
zim2yRAr09v2rSOBddd1np3xFMfUrtO2huW4/AIaj8AhIuWo27MDGWiLlZJefYC17HaraQ4AQAAp
uAq0mVWnPqqkbNx8MmW8F0TzeNiYL9udnhogKyzStzTy73mDuuPVWbMlXROyiau2pM9Y70rfBbC4
Nmul0xxAvQB4ZQsX0lMwRjQqpgomU8UUZpnXW//IqvJiJ/d/JjwAT1V/Di/VgtJDBeXfpaqVBUrc
BFOMgyla1ab8hT1o/l8Tn6LA39HBjZDRJg9WVDDvsTeIVLE5V2PREbV7VoJvlYZ2vwKjdm69rmr0
FDxriZHOUzeYmqrZWM1CWp/o16S0Eqd7Zj3nMfGneTBxlOFwEOIPgW8Fs1S+ZPMkRuUwVQKxjuwC
d7dwJPczb6bGbHVpLJ+ljS9GMMKfprat7i58ly9RFXItHggY1uebbHCrC+blexC5wOiwMOkjbGhZ
Et0b+mexxbKdr4SRGjH6Xcl/qqZapOQ6+I9d2CZTq9mcAmPWe9HCdASVLIisKQIG+fzxj5BpmfJa
/lxAC309LG28LiEIx0Q9lOm5f7FPJuuRPG72fKJjacWFEQWKAPb9bJmParQWYOriGNb83swhl3+r
xOZ3l3V9dKhbfwrVUKJEtKSVd3dvKN3vGSbfJ+li3NdhrFkhkoGxeakHU82HHnLSaHVShzBiOo2w
9j5p3vxiANR2UIUEDWq4eNbiUVtcey+HPBwfwqpfvLjCOrWVoUM2yIYIfm8R5YoqQAzNh/7J51fB
VupcHqChJzC7y5BWrXzphH/l7I950QcO5HCor0NNNkzbRCqzPmy4bkzBSmpJowI6UC5YVrWhkHjt
j8A8biW9hSpFWs1ZtiZUXdm0rYKsqt5cNgqBvu4Fpc9LVsOi27Ui1astib5GVY3Wfo6PzaPGxMRz
IHIgsXvbdo3svw71Vlg/ykBBs6F2NPYawuN/nqS7COgKpM4HdBkC7oSRzyFAaJx2ZIDs9l2FGiZF
AtipeOlqOCSzAeulmW4bozTyqAEdrxBicwNw7jtxgvWx29/quODiBZkDqQkOnyNXRa37g1T0mNl9
qmO7AJvLkVFUk6eq/9FiN9+A0JnHsrp6t17EiAjxKsg6ExZXxvVp8pUoevxX21SDBROxxRk6vvST
RTcu6YVtoUrrDEXy1hSnKdiaSla4inn2Qy27ArZLaENARZvpqxKrvbUm+UPWecefpAX1bdjt03z/
TKuA6GjaNWopWErhpU5g2b4W05uKQOGMVhwKBDQ9sgCMj0b+TXNUple7X99AgQIb57SNzVJ/hiOY
uoF2sgLay9zOClvoj/wwC0/uxMEAaStvpimB7RXxkHfmUC4YtjD6GWzZjkZGFmLAm+nMDqXtv2EV
Pd/AufN78uKiM5IK5RX2oXIcXISmQn/ckrdNQVdIpwZ91GRML+t4lSYOB4A4IIFF7J3ZjuDzEJzT
MqK8H0mJDsSJSkTu5qtzi30+/qdDKbn6oetDOlAGPPtjWfD2ugffqSCJGtBj8Gk0wka93sJe2ltp
8e3oJK1ibd6mMhmuTTdyhYFTR22dLNtrVtyTuaqPzCgv1UA00pgSLSQumMJAW7KFB/8lI2En5sal
tGn02JDxY0hKT2YbqrHjhHkuqjbumeXyy+G/0KadAQ==
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
