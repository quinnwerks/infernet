-- Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2018.3.1 (lin64) Build 2489853 Tue Mar 26 04:18:30 MDT 2019
-- Date        : Wed Feb 24 18:34:51 2021
-- Host        : hw-dev running 64-bit Ubuntu 18.04.5 LTS
-- Command     : write_vhdl -force -mode funcsim
--               /home/quinn/ece532-project/accelerator/tri_mode_ethernet_mac_0_ex/tri_mode_ethernet_mac_0_ex.srcs/sources_1/ip/Mult_Add_NC/Mult_Add_NC_sim_netlist.vhdl
-- Design      : Mult_Add_NC
-- Purpose     : This VHDL netlist is a functional simulation representation of the design and should not be modified or
--               synthesized. This netlist cannot be used for SDF annotated simulation.
-- Device      : xc7a100tcsg324-1
-- --------------------------------------------------------------------------------
`protect begin_protected
`protect version = 1
`protect encrypt_agent = "XILINX"
`protect encrypt_agent_info = "Xilinx Encryption Tool 2015"
`protect key_keyowner="Cadence Design Systems.", key_keyname="cds_rsa_key", key_method="rsa"
`protect encoding = (enctype="BASE64", line_length=76, bytes=64)
`protect key_block
M/Oow86CcGLU8y/nWrF+QnUUgGmOGhivibZwU19v9A9QQcWGR/ruVGoApslydnMhKEErlVgGcJtj
PFAFsuRI1g==

`protect key_keyowner="Synopsys", key_keyname="SNPS-VCS-RSA-2", key_method="rsa"
`protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`protect key_block
gPwZVd+K3zBYoBK981RLe0HzuTJROxJdVi47OjK1ObafIeio7JPL2HDw8iM3jWvEVit/lq4eu4p1
iiGmlJw3mWHpV7YEuNFcKTHnwRGwVbgB2Q8wzQKuHQ14/Igt0EUEjLPaOvGneiSYwok9TUDBkJWK
tnk/sQdr1OMcak3Db/w=

`protect key_keyowner="Aldec", key_keyname="ALDEC15_001", key_method="rsa"
`protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`protect key_block
tD3/WMDfbd2X7J4jGjESfmScmBW/kd8PV7AgDpa25xZUNPVfPeU2Dj8FVzAeL5dJs/xxGQZYATeH
gLjlTTzZij8EBcP1/9FXd1A8g0DCIp5y2G36Svbl4n7XhJTpW82ma4sroDFqj2Yc6X8FSqsWZYsG
SD20ghDQLZhCDVW6CXDOXwdULGlO9PvNDWj/8UdzLPujzF3D2oh6L4iYh96pQZwDmnNWn6/oJDx5
kb0SHOMIjfeZpaEzWuFoul8rKED6uDZ360I2btuBRbHsCrfTv7GphR8zQvdUCwzrjBpECtZH541Q
UQK7FY7x88zKsp8dgMI5dtOTI5J3uXH1xzUGeg==

`protect key_keyowner="ATRENTA", key_keyname="ATR-SG-2015-RSA-3", key_method="rsa"
`protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`protect key_block
lT7xNXC+00dtX4O8K2gOPPdio9R28aDG8ox5wq4iD4mkU7rrKev8Rj4uq60NrgRHOTqCXrsI55pc
lP9o2ZeFE1Sl7AnJovrXZebYoT4hjFBSPC1aEPmYWYIYes601/3ThU5dcmMRQQgs3/tdgWig6RMJ
qnPCtjflGrTxj5NdcjP9K00iORJEg1Y75CqoqPRQkv0RL18UkP5WW9mxSomDTIncFrLGwIOXKfdu
1SyrcM6Ts98RMip3atGqPHsMPjJMIzVQj9kNALFicpf8ahHlrcdCna81FWR5rAO0VA98g5zLa/3b
pbnoWd31J4nSjUNw63c2MSsLNtbH4khrue7hFQ==

`protect key_keyowner="Xilinx", key_keyname="xilinxt_2017_05", key_method="rsa"
`protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`protect key_block
UrWa5SriHNwF1UsW+i86RuZTMf2kO4x9g1IC1D3UmLxu5CQmrTh2Wb4E7WadlPyZQluUpDxCpUdr
8YJWzzMpR2qv4c7nKCVaz8mG+ombCwY/hxXbbUu/FNqx53WiFGNsiqPb5r6lf9oakRtIOjI9djYN
ry61RYHj9r5/XhkBfJ5nqUuPfkPDPWz2C3ZbP5/0m3MLq4MbrlDFn5gj/L/m2SDDqOo1B6651BC8
3VfUCa2w1aoIZ0usUT0oay9ukTj7GQlWqGn2xj5uXLzBeFA0nXhwA5LgM3ROXZfI87cyPhHxsuCd
CQifJAFLP+A8rt1L69aP0k9wcVEyDxB5ihVngQ==

`protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VELOCE-RSA", key_method="rsa"
`protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`protect key_block
PCVAERp0IpS3D3Hmw0kS/0c+GFu9RFQX+eyldAxhEb8TlEeDLJvtxKYmV0/LZVWuTyi55aQITgRQ
o4VIBk03Zod6uFIigfALBqe8s/NgYOjfJ9dmG/kYqw9zJdvK+TBUfylIIYmfkKPgqE7ltIlyEOuG
6ZsQcr7b5QvbZ9b426A=

`protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VERIF-SIM-RSA-2", key_method="rsa"
`protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`protect key_block
sxj1hP+VFwzO+zN2msB5kOis0Q8vvFmqdMtN1jl3q48rX6ozxveJ5rbO9EVgTBrOjpqLC1VKPMdt
KEHxKAJ7RXtjpMe2duyy3QuPmMVn79b1vzwncMdE+DApN9Qr6BH+mNh4iUwE4G/kCP1N97BlZpXL
aeCG3dcTRJ+66KSaRiscfb0/r7aZeQOMue/vb3nSn+B8M9r2tsz+RErYYPODV+ER8J6USK7XUYkz
rfEOS9T0aPQYCBP373RSj3A5PZPrj/LhoiaTWlfRi350pDlM4zFVk9KYj+ZHUOweqKRSTbZDxREa
HTFCq9D+cj2EF0sNoRvIiKE0vctj3He5lp5Syw==

`protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-PREC-RSA", key_method="rsa"
`protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`protect key_block
gEVQxHf4gnRQ8sIcMXTrpB+oa7R76eYcoarwlIsOVKAv+2kZMvCGBO/3N75UjXdDAYGb2URAFtKk
hLPoxA/CyMof0ezLzQjo91zAZkP6o23yhPh0SHYoHy79dtgqEZXrGSVaHfhAzLA4KCT24RqYw8hE
H41rqfjafF8JLv1pWV42o6/1g2zkLw6CLLM84UbcSaNhqswhletyr+zxIhtySwI+L8OdzDqNrP3e
cq+rjxtiISDDf8fVseQm0UD30J1/35IATniSRa7mdLSbeHjFhXQCX752mZPhVlkLtsPeadTe7jTD
Z9vETDUCmGnSJ5U2fzLVmwBBmTyaHLriZDb3QQ==

`protect key_keyowner="Synplicity", key_keyname="SYNP15_1", key_method="rsa"
`protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`protect key_block
c3umaSyHA44Qygqrl2+jz8+7zTnJEQpy0WkaO7RlxklgnSzBnCx+/UKqj0rOtOQqpCpTqXjI65Iw
og8X49szYHV8ynn/b5PjtfC1IBQfL399KvefNQajh8MHbBvYRnePgtw9+uKN5FXXJJjEu9L8L83c
si9M7oiz3k/zTdLcVIo4xI97V6tYAsklaN7gngBCzNyZ8Yjtc+DRnUhxqbZRVNaBg73zfsS6m/Yq
9hYH0KZH9sCNjLsbyxBBfSWm6Ix79WCDga6gI5W3g7J6nNngCdm+bg2vS61e5rPuDxtFXaWWG7Vv
0gnEV8xpE6UlFcfRNmv858I9EUAEZTgv8JTIkQ==

`protect data_method = "AES128-CBC"
`protect encoding = (enctype = "BASE64", line_length = 76, bytes = 14368)
`protect data_block
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
1Dlcvw==
`protect end_protected
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity Mult_Add_NC_xbip_multadd_v3_0_13 is
  port (
    CLK : in STD_LOGIC;
    CE : in STD_LOGIC;
    SCLR : in STD_LOGIC;
    A : in STD_LOGIC_VECTOR ( 24 downto 0 );
    B : in STD_LOGIC_VECTOR ( 17 downto 0 );
    C : in STD_LOGIC_VECTOR ( 47 downto 0 );
    PCIN : in STD_LOGIC_VECTOR ( 47 downto 0 );
    SUBTRACT : in STD_LOGIC;
    P : out STD_LOGIC_VECTOR ( 47 downto 0 );
    PCOUT : out STD_LOGIC_VECTOR ( 47 downto 0 )
  );
  attribute C_AB_LATENCY : integer;
  attribute C_AB_LATENCY of Mult_Add_NC_xbip_multadd_v3_0_13 : entity is -1;
  attribute C_A_TYPE : integer;
  attribute C_A_TYPE of Mult_Add_NC_xbip_multadd_v3_0_13 : entity is 0;
  attribute C_A_WIDTH : integer;
  attribute C_A_WIDTH of Mult_Add_NC_xbip_multadd_v3_0_13 : entity is 25;
  attribute C_B_TYPE : integer;
  attribute C_B_TYPE of Mult_Add_NC_xbip_multadd_v3_0_13 : entity is 0;
  attribute C_B_WIDTH : integer;
  attribute C_B_WIDTH of Mult_Add_NC_xbip_multadd_v3_0_13 : entity is 18;
  attribute C_CE_OVERRIDES_SCLR : integer;
  attribute C_CE_OVERRIDES_SCLR of Mult_Add_NC_xbip_multadd_v3_0_13 : entity is 0;
  attribute C_C_LATENCY : integer;
  attribute C_C_LATENCY of Mult_Add_NC_xbip_multadd_v3_0_13 : entity is -1;
  attribute C_C_TYPE : integer;
  attribute C_C_TYPE of Mult_Add_NC_xbip_multadd_v3_0_13 : entity is 0;
  attribute C_C_WIDTH : integer;
  attribute C_C_WIDTH of Mult_Add_NC_xbip_multadd_v3_0_13 : entity is 48;
  attribute C_OUT_HIGH : integer;
  attribute C_OUT_HIGH of Mult_Add_NC_xbip_multadd_v3_0_13 : entity is 47;
  attribute C_OUT_LOW : integer;
  attribute C_OUT_LOW of Mult_Add_NC_xbip_multadd_v3_0_13 : entity is 0;
  attribute C_TEST_CORE : integer;
  attribute C_TEST_CORE of Mult_Add_NC_xbip_multadd_v3_0_13 : entity is 0;
  attribute C_USE_PCIN : integer;
  attribute C_USE_PCIN of Mult_Add_NC_xbip_multadd_v3_0_13 : entity is 0;
  attribute C_VERBOSITY : integer;
  attribute C_VERBOSITY of Mult_Add_NC_xbip_multadd_v3_0_13 : entity is 0;
  attribute C_XDEVICEFAMILY : string;
  attribute C_XDEVICEFAMILY of Mult_Add_NC_xbip_multadd_v3_0_13 : entity is "artix7";
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of Mult_Add_NC_xbip_multadd_v3_0_13 : entity is "xbip_multadd_v3_0_13";
  attribute downgradeipidentifiedwarnings : string;
  attribute downgradeipidentifiedwarnings of Mult_Add_NC_xbip_multadd_v3_0_13 : entity is "yes";
end Mult_Add_NC_xbip_multadd_v3_0_13;

architecture STRUCTURE of Mult_Add_NC_xbip_multadd_v3_0_13 is
  attribute C_AB_LATENCY of i_synth : label is -1;
  attribute C_A_TYPE of i_synth : label is 0;
  attribute C_A_WIDTH of i_synth : label is 25;
  attribute C_B_TYPE of i_synth : label is 0;
  attribute C_B_WIDTH of i_synth : label is 18;
  attribute C_CE_OVERRIDES_SCLR of i_synth : label is 0;
  attribute C_C_LATENCY of i_synth : label is -1;
  attribute C_C_TYPE of i_synth : label is 0;
  attribute C_C_WIDTH of i_synth : label is 48;
  attribute C_OUT_HIGH of i_synth : label is 47;
  attribute C_OUT_LOW of i_synth : label is 0;
  attribute C_TEST_CORE of i_synth : label is 0;
  attribute C_USE_PCIN of i_synth : label is 0;
  attribute C_VERBOSITY of i_synth : label is 0;
  attribute C_XDEVICEFAMILY of i_synth : label is "artix7";
  attribute downgradeipidentifiedwarnings of i_synth : label is "yes";
begin
i_synth: entity work.Mult_Add_NC_xbip_multadd_v3_0_13_viv
     port map (
      A(24 downto 0) => A(24 downto 0),
      B(17 downto 0) => B(17 downto 0),
      C(47 downto 0) => C(47 downto 0),
      CE => CE,
      CLK => CLK,
      P(47 downto 0) => P(47 downto 0),
      PCIN(47 downto 0) => B"000000000000000000000000000000000000000000000000",
      PCOUT(47 downto 0) => PCOUT(47 downto 0),
      SCLR => SCLR,
      SUBTRACT => SUBTRACT
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity Mult_Add_NC is
  port (
    CLK : in STD_LOGIC;
    CE : in STD_LOGIC;
    SCLR : in STD_LOGIC;
    A : in STD_LOGIC_VECTOR ( 24 downto 0 );
    B : in STD_LOGIC_VECTOR ( 17 downto 0 );
    C : in STD_LOGIC_VECTOR ( 47 downto 0 );
    SUBTRACT : in STD_LOGIC;
    P : out STD_LOGIC_VECTOR ( 47 downto 0 );
    PCOUT : out STD_LOGIC_VECTOR ( 47 downto 0 )
  );
  attribute NotValidForBitStream : boolean;
  attribute NotValidForBitStream of Mult_Add_NC : entity is true;
  attribute CHECK_LICENSE_TYPE : string;
  attribute CHECK_LICENSE_TYPE of Mult_Add_NC : entity is "Mult_Add_NC,xbip_multadd_v3_0_13,{}";
  attribute downgradeipidentifiedwarnings : string;
  attribute downgradeipidentifiedwarnings of Mult_Add_NC : entity is "yes";
  attribute x_core_info : string;
  attribute x_core_info of Mult_Add_NC : entity is "xbip_multadd_v3_0_13,Vivado 2018.3.1";
end Mult_Add_NC;

architecture STRUCTURE of Mult_Add_NC is
  attribute C_AB_LATENCY : integer;
  attribute C_AB_LATENCY of U0 : label is -1;
  attribute C_A_TYPE : integer;
  attribute C_A_TYPE of U0 : label is 0;
  attribute C_A_WIDTH : integer;
  attribute C_A_WIDTH of U0 : label is 25;
  attribute C_B_TYPE : integer;
  attribute C_B_TYPE of U0 : label is 0;
  attribute C_B_WIDTH : integer;
  attribute C_B_WIDTH of U0 : label is 18;
  attribute C_CE_OVERRIDES_SCLR : integer;
  attribute C_CE_OVERRIDES_SCLR of U0 : label is 0;
  attribute C_C_LATENCY : integer;
  attribute C_C_LATENCY of U0 : label is -1;
  attribute C_C_TYPE : integer;
  attribute C_C_TYPE of U0 : label is 0;
  attribute C_C_WIDTH : integer;
  attribute C_C_WIDTH of U0 : label is 48;
  attribute C_OUT_HIGH : integer;
  attribute C_OUT_HIGH of U0 : label is 47;
  attribute C_OUT_LOW : integer;
  attribute C_OUT_LOW of U0 : label is 0;
  attribute C_TEST_CORE : integer;
  attribute C_TEST_CORE of U0 : label is 0;
  attribute C_USE_PCIN : integer;
  attribute C_USE_PCIN of U0 : label is 0;
  attribute C_VERBOSITY : integer;
  attribute C_VERBOSITY of U0 : label is 0;
  attribute C_XDEVICEFAMILY : string;
  attribute C_XDEVICEFAMILY of U0 : label is "artix7";
  attribute downgradeipidentifiedwarnings of U0 : label is "yes";
  attribute x_interface_info : string;
  attribute x_interface_info of CE : signal is "xilinx.com:signal:clockenable:1.0 ce_intf CE";
  attribute x_interface_parameter : string;
  attribute x_interface_parameter of CE : signal is "XIL_INTERFACENAME ce_intf, POLARITY ACTIVE_LOW";
  attribute x_interface_info of CLK : signal is "xilinx.com:signal:clock:1.0 clk_intf CLK";
  attribute x_interface_parameter of CLK : signal is "XIL_INTERFACENAME clk_intf, ASSOCIATED_BUSIF pcout_intf:p_intf:subtract_intf:pcin_intf:c_intf:b_intf:a_intf, ASSOCIATED_RESET SCLR, ASSOCIATED_CLKEN CE, FREQ_HZ 100000000, PHASE 0.000, INSERT_VIP 0";
  attribute x_interface_info of SCLR : signal is "xilinx.com:signal:reset:1.0 sclr_intf RST";
  attribute x_interface_parameter of SCLR : signal is "XIL_INTERFACENAME sclr_intf, POLARITY ACTIVE_HIGH, INSERT_VIP 0";
  attribute x_interface_info of SUBTRACT : signal is "xilinx.com:signal:data:1.0 subtract_intf DATA";
  attribute x_interface_parameter of SUBTRACT : signal is "XIL_INTERFACENAME subtract_intf, LAYERED_METADATA undef";
  attribute x_interface_info of A : signal is "xilinx.com:signal:data:1.0 a_intf DATA";
  attribute x_interface_parameter of A : signal is "XIL_INTERFACENAME a_intf, LAYERED_METADATA undef";
  attribute x_interface_info of B : signal is "xilinx.com:signal:data:1.0 b_intf DATA";
  attribute x_interface_parameter of B : signal is "XIL_INTERFACENAME b_intf, LAYERED_METADATA undef";
  attribute x_interface_info of C : signal is "xilinx.com:signal:data:1.0 c_intf DATA";
  attribute x_interface_parameter of C : signal is "XIL_INTERFACENAME c_intf, LAYERED_METADATA undef";
  attribute x_interface_info of P : signal is "xilinx.com:signal:data:1.0 p_intf DATA";
  attribute x_interface_parameter of P : signal is "XIL_INTERFACENAME p_intf, LAYERED_METADATA undef";
  attribute x_interface_info of PCOUT : signal is "xilinx.com:signal:data:1.0 pcout_intf DATA";
  attribute x_interface_parameter of PCOUT : signal is "XIL_INTERFACENAME pcout_intf, LAYERED_METADATA undef";
begin
U0: entity work.Mult_Add_NC_xbip_multadd_v3_0_13
     port map (
      A(24 downto 0) => A(24 downto 0),
      B(17 downto 0) => B(17 downto 0),
      C(47 downto 0) => C(47 downto 0),
      CE => CE,
      CLK => CLK,
      P(47 downto 0) => P(47 downto 0),
      PCIN(47 downto 0) => B"000000000000000000000000000000000000000000000000",
      PCOUT(47 downto 0) => PCOUT(47 downto 0),
      SCLR => SCLR,
      SUBTRACT => SUBTRACT
    );
end STRUCTURE;
