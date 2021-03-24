-- Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2018.3.1 (lin64) Build 2489853 Tue Mar 26 04:18:30 MDT 2019
-- Date        : Mon Feb 22 19:54:17 2021
-- Host        : andrew-debian running 64-bit Debian GNU/Linux 10 (buster)
-- Command     : write_vhdl -force -mode funcsim -rename_top Mult_Add_Global_Average -prefix
--               Mult_Add_Global_Average_ Mult_Add_Pipelined_NC_sim_netlist.vhdl
-- Design      : Mult_Add_Pipelined_NC
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
XnxcAUdtWI7Om0evgUnmN0zRubbSSDPe0l+21CCPi5zj6ZqwwEvczG4DnAVspK3SX2/m3NqGRtwN
3XNpSFQB58N/mJ7vnCLqDdsa0xGjxAWNjsJayt7bErxxbAT6l0Fmt9IvdPnL7NZLP2RcbKqMZxii
DyLWdV+W6Ryvp54O1Tz4/3gLhVKMBqA1mBAb8fNfPCKtvy9J/JNSj+L9hVf/Is+u/IuHAxZjZ+jP
5vZ9S0/0chHG/KLQS6c6seRjubNPbgDybBbIoMYWgDNv0KgaYyV1ZC3FiP72fg7Amft78HKVlsQM
juq1yFygJKqRWNG2vUcz7UK7dVPT0P7D2CE2ow==

`protect key_keyowner="Synplicity", key_keyname="SYNP15_1", key_method="rsa"
`protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`protect key_block
Fe9JGUfmA+HNP/UMLlh1XlTSRP+JlX8LYfPOjS3Z02qIbvpt6pLh/hIoYRxOZiDp443Zb/dDYkPf
Q+VBRkR4KiNg9v4dfinnMERfhojAXFgAo39cXweoYQtlpaVjOVMTRx3ZeE8BcS1lb5oY40MhB3O9
r2lJddPFzn7LxbCl5yNx77cKavCL7GFO951YpO4ri2zSMDHCpEc2uZg0M7uolttRG+24O+bpPw5T
bSZi9yVGjdb2XgnsqDhu5sU/qF1sCER2fxJLVw9CvqxTeK8RUjUv/rheNVCmEf4haVS81yfyAEuL
5fMdgRE4OrjQZMG0rOLgxXREc0p7Gv2yqpU19A==

`protect data_method = "AES128-CBC"
`protect encoding = (enctype = "BASE64", line_length = 76, bytes = 14784)
`protect data_block
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
`protect end_protected
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity Mult_Add_Global_Average_xbip_multadd_v3_0_13 is
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
  attribute C_AB_LATENCY of Mult_Add_Global_Average_xbip_multadd_v3_0_13 : entity is -1;
  attribute C_A_TYPE : integer;
  attribute C_A_TYPE of Mult_Add_Global_Average_xbip_multadd_v3_0_13 : entity is 0;
  attribute C_A_WIDTH : integer;
  attribute C_A_WIDTH of Mult_Add_Global_Average_xbip_multadd_v3_0_13 : entity is 25;
  attribute C_B_TYPE : integer;
  attribute C_B_TYPE of Mult_Add_Global_Average_xbip_multadd_v3_0_13 : entity is 0;
  attribute C_B_WIDTH : integer;
  attribute C_B_WIDTH of Mult_Add_Global_Average_xbip_multadd_v3_0_13 : entity is 18;
  attribute C_CE_OVERRIDES_SCLR : integer;
  attribute C_CE_OVERRIDES_SCLR of Mult_Add_Global_Average_xbip_multadd_v3_0_13 : entity is 0;
  attribute C_C_LATENCY : integer;
  attribute C_C_LATENCY of Mult_Add_Global_Average_xbip_multadd_v3_0_13 : entity is -1;
  attribute C_C_TYPE : integer;
  attribute C_C_TYPE of Mult_Add_Global_Average_xbip_multadd_v3_0_13 : entity is 0;
  attribute C_C_WIDTH : integer;
  attribute C_C_WIDTH of Mult_Add_Global_Average_xbip_multadd_v3_0_13 : entity is 48;
  attribute C_OUT_HIGH : integer;
  attribute C_OUT_HIGH of Mult_Add_Global_Average_xbip_multadd_v3_0_13 : entity is 47;
  attribute C_OUT_LOW : integer;
  attribute C_OUT_LOW of Mult_Add_Global_Average_xbip_multadd_v3_0_13 : entity is 0;
  attribute C_TEST_CORE : integer;
  attribute C_TEST_CORE of Mult_Add_Global_Average_xbip_multadd_v3_0_13 : entity is 0;
  attribute C_USE_PCIN : integer;
  attribute C_USE_PCIN of Mult_Add_Global_Average_xbip_multadd_v3_0_13 : entity is 0;
  attribute C_VERBOSITY : integer;
  attribute C_VERBOSITY of Mult_Add_Global_Average_xbip_multadd_v3_0_13 : entity is 0;
  attribute C_XDEVICEFAMILY : string;
  attribute C_XDEVICEFAMILY of Mult_Add_Global_Average_xbip_multadd_v3_0_13 : entity is "artix7";
  attribute downgradeipidentifiedwarnings : string;
  attribute downgradeipidentifiedwarnings of Mult_Add_Global_Average_xbip_multadd_v3_0_13 : entity is "yes";
end Mult_Add_Global_Average_xbip_multadd_v3_0_13;

architecture STRUCTURE of Mult_Add_Global_Average_xbip_multadd_v3_0_13 is
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
i_synth: entity work.Mult_Add_Global_Average_xbip_multadd_v3_0_13_viv
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
entity Mult_Add_Global_Average is
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
  attribute NotValidForBitStream of Mult_Add_Global_Average : entity is true;
  attribute CHECK_LICENSE_TYPE : string;
  attribute CHECK_LICENSE_TYPE of Mult_Add_Global_Average : entity is "Mult_Add_Pipelined_NC,xbip_multadd_v3_0_13,{}";
  attribute downgradeipidentifiedwarnings : string;
  attribute downgradeipidentifiedwarnings of Mult_Add_Global_Average : entity is "yes";
  attribute x_core_info : string;
  attribute x_core_info of Mult_Add_Global_Average : entity is "xbip_multadd_v3_0_13,Vivado 2018.3.1";
end Mult_Add_Global_Average;

architecture STRUCTURE of Mult_Add_Global_Average is
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
U0: entity work.Mult_Add_Global_Average_xbip_multadd_v3_0_13
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
