-- Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2018.3.1 (lin64) Build 2489853 Tue Mar 26 04:18:30 MDT 2019
-- Date        : Mon Mar 22 14:27:26 2021
-- Host        : andrew-debian running 64-bit Debian GNU/Linux 10 (buster)
-- Command     : write_vhdl -force -mode funcsim
--               /home/andrew/infernet/accelerator/MNIST_Solver/MNIST_Solver.srcs/sources_1/ip/Conv_2_Weight_Buf/Conv_2_Weight_Buf_sim_netlist.vhdl
-- Design      : Conv_2_Weight_Buf
-- Purpose     : This VHDL netlist is a functional simulation representation of the design and should not be modified or
--               synthesized. This netlist cannot be used for SDF annotated simulation.
-- Device      : xc7a100tcsg324-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity Conv_2_Weight_Buf_dist_mem_gen_v8_0_12 is
  port (
    a : in STD_LOGIC_VECTOR ( 4 downto 0 );
    d : in STD_LOGIC_VECTOR ( 17 downto 0 );
    dpra : in STD_LOGIC_VECTOR ( 4 downto 0 );
    clk : in STD_LOGIC;
    we : in STD_LOGIC;
    i_ce : in STD_LOGIC;
    qspo_ce : in STD_LOGIC;
    qdpo_ce : in STD_LOGIC;
    qdpo_clk : in STD_LOGIC;
    qspo_rst : in STD_LOGIC;
    qdpo_rst : in STD_LOGIC;
    qspo_srst : in STD_LOGIC;
    qdpo_srst : in STD_LOGIC;
    spo : out STD_LOGIC_VECTOR ( 17 downto 0 );
    dpo : out STD_LOGIC_VECTOR ( 17 downto 0 );
    qspo : out STD_LOGIC_VECTOR ( 17 downto 0 );
    qdpo : out STD_LOGIC_VECTOR ( 17 downto 0 )
  );
  attribute C_ADDR_WIDTH : integer;
  attribute C_ADDR_WIDTH of Conv_2_Weight_Buf_dist_mem_gen_v8_0_12 : entity is 5;
  attribute C_DEFAULT_DATA : string;
  attribute C_DEFAULT_DATA of Conv_2_Weight_Buf_dist_mem_gen_v8_0_12 : entity is "0";
  attribute C_DEPTH : integer;
  attribute C_DEPTH of Conv_2_Weight_Buf_dist_mem_gen_v8_0_12 : entity is 32;
  attribute C_ELABORATION_DIR : string;
  attribute C_ELABORATION_DIR of Conv_2_Weight_Buf_dist_mem_gen_v8_0_12 : entity is "./";
  attribute C_FAMILY : string;
  attribute C_FAMILY of Conv_2_Weight_Buf_dist_mem_gen_v8_0_12 : entity is "artix7";
  attribute C_HAS_CLK : integer;
  attribute C_HAS_CLK of Conv_2_Weight_Buf_dist_mem_gen_v8_0_12 : entity is 1;
  attribute C_HAS_D : integer;
  attribute C_HAS_D of Conv_2_Weight_Buf_dist_mem_gen_v8_0_12 : entity is 0;
  attribute C_HAS_DPO : integer;
  attribute C_HAS_DPO of Conv_2_Weight_Buf_dist_mem_gen_v8_0_12 : entity is 0;
  attribute C_HAS_DPRA : integer;
  attribute C_HAS_DPRA of Conv_2_Weight_Buf_dist_mem_gen_v8_0_12 : entity is 0;
  attribute C_HAS_I_CE : integer;
  attribute C_HAS_I_CE of Conv_2_Weight_Buf_dist_mem_gen_v8_0_12 : entity is 0;
  attribute C_HAS_QDPO : integer;
  attribute C_HAS_QDPO of Conv_2_Weight_Buf_dist_mem_gen_v8_0_12 : entity is 0;
  attribute C_HAS_QDPO_CE : integer;
  attribute C_HAS_QDPO_CE of Conv_2_Weight_Buf_dist_mem_gen_v8_0_12 : entity is 0;
  attribute C_HAS_QDPO_CLK : integer;
  attribute C_HAS_QDPO_CLK of Conv_2_Weight_Buf_dist_mem_gen_v8_0_12 : entity is 0;
  attribute C_HAS_QDPO_RST : integer;
  attribute C_HAS_QDPO_RST of Conv_2_Weight_Buf_dist_mem_gen_v8_0_12 : entity is 0;
  attribute C_HAS_QDPO_SRST : integer;
  attribute C_HAS_QDPO_SRST of Conv_2_Weight_Buf_dist_mem_gen_v8_0_12 : entity is 0;
  attribute C_HAS_QSPO : integer;
  attribute C_HAS_QSPO of Conv_2_Weight_Buf_dist_mem_gen_v8_0_12 : entity is 1;
  attribute C_HAS_QSPO_CE : integer;
  attribute C_HAS_QSPO_CE of Conv_2_Weight_Buf_dist_mem_gen_v8_0_12 : entity is 0;
  attribute C_HAS_QSPO_RST : integer;
  attribute C_HAS_QSPO_RST of Conv_2_Weight_Buf_dist_mem_gen_v8_0_12 : entity is 0;
  attribute C_HAS_QSPO_SRST : integer;
  attribute C_HAS_QSPO_SRST of Conv_2_Weight_Buf_dist_mem_gen_v8_0_12 : entity is 0;
  attribute C_HAS_SPO : integer;
  attribute C_HAS_SPO of Conv_2_Weight_Buf_dist_mem_gen_v8_0_12 : entity is 0;
  attribute C_HAS_WE : integer;
  attribute C_HAS_WE of Conv_2_Weight_Buf_dist_mem_gen_v8_0_12 : entity is 0;
  attribute C_MEM_INIT_FILE : string;
  attribute C_MEM_INIT_FILE of Conv_2_Weight_Buf_dist_mem_gen_v8_0_12 : entity is "no_coe_file_loaded";
  attribute C_MEM_TYPE : integer;
  attribute C_MEM_TYPE of Conv_2_Weight_Buf_dist_mem_gen_v8_0_12 : entity is 0;
  attribute C_PARSER_TYPE : integer;
  attribute C_PARSER_TYPE of Conv_2_Weight_Buf_dist_mem_gen_v8_0_12 : entity is 1;
  attribute C_PIPELINE_STAGES : integer;
  attribute C_PIPELINE_STAGES of Conv_2_Weight_Buf_dist_mem_gen_v8_0_12 : entity is 0;
  attribute C_QCE_JOINED : integer;
  attribute C_QCE_JOINED of Conv_2_Weight_Buf_dist_mem_gen_v8_0_12 : entity is 0;
  attribute C_QUALIFY_WE : integer;
  attribute C_QUALIFY_WE of Conv_2_Weight_Buf_dist_mem_gen_v8_0_12 : entity is 0;
  attribute C_READ_MIF : integer;
  attribute C_READ_MIF of Conv_2_Weight_Buf_dist_mem_gen_v8_0_12 : entity is 0;
  attribute C_REG_A_D_INPUTS : integer;
  attribute C_REG_A_D_INPUTS of Conv_2_Weight_Buf_dist_mem_gen_v8_0_12 : entity is 0;
  attribute C_REG_DPRA_INPUT : integer;
  attribute C_REG_DPRA_INPUT of Conv_2_Weight_Buf_dist_mem_gen_v8_0_12 : entity is 0;
  attribute C_SYNC_ENABLE : integer;
  attribute C_SYNC_ENABLE of Conv_2_Weight_Buf_dist_mem_gen_v8_0_12 : entity is 1;
  attribute C_WIDTH : integer;
  attribute C_WIDTH of Conv_2_Weight_Buf_dist_mem_gen_v8_0_12 : entity is 18;
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of Conv_2_Weight_Buf_dist_mem_gen_v8_0_12 : entity is "dist_mem_gen_v8_0_12";
end Conv_2_Weight_Buf_dist_mem_gen_v8_0_12;

architecture STRUCTURE of Conv_2_Weight_Buf_dist_mem_gen_v8_0_12 is
  signal \<const0>\ : STD_LOGIC;
begin
  dpo(17) <= \<const0>\;
  dpo(16) <= \<const0>\;
  dpo(15) <= \<const0>\;
  dpo(14) <= \<const0>\;
  dpo(13) <= \<const0>\;
  dpo(12) <= \<const0>\;
  dpo(11) <= \<const0>\;
  dpo(10) <= \<const0>\;
  dpo(9) <= \<const0>\;
  dpo(8) <= \<const0>\;
  dpo(7) <= \<const0>\;
  dpo(6) <= \<const0>\;
  dpo(5) <= \<const0>\;
  dpo(4) <= \<const0>\;
  dpo(3) <= \<const0>\;
  dpo(2) <= \<const0>\;
  dpo(1) <= \<const0>\;
  dpo(0) <= \<const0>\;
  qdpo(17) <= \<const0>\;
  qdpo(16) <= \<const0>\;
  qdpo(15) <= \<const0>\;
  qdpo(14) <= \<const0>\;
  qdpo(13) <= \<const0>\;
  qdpo(12) <= \<const0>\;
  qdpo(11) <= \<const0>\;
  qdpo(10) <= \<const0>\;
  qdpo(9) <= \<const0>\;
  qdpo(8) <= \<const0>\;
  qdpo(7) <= \<const0>\;
  qdpo(6) <= \<const0>\;
  qdpo(5) <= \<const0>\;
  qdpo(4) <= \<const0>\;
  qdpo(3) <= \<const0>\;
  qdpo(2) <= \<const0>\;
  qdpo(1) <= \<const0>\;
  qdpo(0) <= \<const0>\;
  qspo(17) <= \<const0>\;
  qspo(16) <= \<const0>\;
  qspo(15) <= \<const0>\;
  qspo(14) <= \<const0>\;
  qspo(13) <= \<const0>\;
  qspo(12) <= \<const0>\;
  qspo(11) <= \<const0>\;
  qspo(10) <= \<const0>\;
  qspo(9) <= \<const0>\;
  qspo(8) <= \<const0>\;
  qspo(7) <= \<const0>\;
  qspo(6) <= \<const0>\;
  qspo(5) <= \<const0>\;
  qspo(4) <= \<const0>\;
  qspo(3) <= \<const0>\;
  qspo(2) <= \<const0>\;
  qspo(1) <= \<const0>\;
  qspo(0) <= \<const0>\;
  spo(17) <= \<const0>\;
  spo(16) <= \<const0>\;
  spo(15) <= \<const0>\;
  spo(14) <= \<const0>\;
  spo(13) <= \<const0>\;
  spo(12) <= \<const0>\;
  spo(11) <= \<const0>\;
  spo(10) <= \<const0>\;
  spo(9) <= \<const0>\;
  spo(8) <= \<const0>\;
  spo(7) <= \<const0>\;
  spo(6) <= \<const0>\;
  spo(5) <= \<const0>\;
  spo(4) <= \<const0>\;
  spo(3) <= \<const0>\;
  spo(2) <= \<const0>\;
  spo(1) <= \<const0>\;
  spo(0) <= \<const0>\;
GND: unisim.vcomponents.GND
     port map (
      G => \<const0>\
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity Conv_2_Weight_Buf is
  port (
    a : in STD_LOGIC_VECTOR ( 4 downto 0 );
    clk : in STD_LOGIC;
    qspo : out STD_LOGIC_VECTOR ( 17 downto 0 )
  );
  attribute NotValidForBitStream : boolean;
  attribute NotValidForBitStream of Conv_2_Weight_Buf : entity is true;
  attribute CHECK_LICENSE_TYPE : string;
  attribute CHECK_LICENSE_TYPE of Conv_2_Weight_Buf : entity is "Conv_2_Weight_Buf,dist_mem_gen_v8_0_12,{}";
  attribute downgradeipidentifiedwarnings : string;
  attribute downgradeipidentifiedwarnings of Conv_2_Weight_Buf : entity is "yes";
  attribute x_core_info : string;
  attribute x_core_info of Conv_2_Weight_Buf : entity is "dist_mem_gen_v8_0_12,Vivado 2018.3.1";
end Conv_2_Weight_Buf;

architecture STRUCTURE of Conv_2_Weight_Buf is
  signal NLW_U0_dpo_UNCONNECTED : STD_LOGIC_VECTOR ( 17 downto 0 );
  signal NLW_U0_qdpo_UNCONNECTED : STD_LOGIC_VECTOR ( 17 downto 0 );
  signal NLW_U0_spo_UNCONNECTED : STD_LOGIC_VECTOR ( 17 downto 0 );
  attribute C_FAMILY : string;
  attribute C_FAMILY of U0 : label is "artix7";
  attribute C_HAS_D : integer;
  attribute C_HAS_D of U0 : label is 0;
  attribute C_HAS_DPO : integer;
  attribute C_HAS_DPO of U0 : label is 0;
  attribute C_HAS_DPRA : integer;
  attribute C_HAS_DPRA of U0 : label is 0;
  attribute C_HAS_I_CE : integer;
  attribute C_HAS_I_CE of U0 : label is 0;
  attribute C_HAS_QDPO : integer;
  attribute C_HAS_QDPO of U0 : label is 0;
  attribute C_HAS_QDPO_CE : integer;
  attribute C_HAS_QDPO_CE of U0 : label is 0;
  attribute C_HAS_QDPO_CLK : integer;
  attribute C_HAS_QDPO_CLK of U0 : label is 0;
  attribute C_HAS_QDPO_RST : integer;
  attribute C_HAS_QDPO_RST of U0 : label is 0;
  attribute C_HAS_QDPO_SRST : integer;
  attribute C_HAS_QDPO_SRST of U0 : label is 0;
  attribute C_HAS_WE : integer;
  attribute C_HAS_WE of U0 : label is 0;
  attribute C_MEM_TYPE : integer;
  attribute C_MEM_TYPE of U0 : label is 0;
  attribute C_PIPELINE_STAGES : integer;
  attribute C_PIPELINE_STAGES of U0 : label is 0;
  attribute C_QCE_JOINED : integer;
  attribute C_QCE_JOINED of U0 : label is 0;
  attribute C_QUALIFY_WE : integer;
  attribute C_QUALIFY_WE of U0 : label is 0;
  attribute C_REG_DPRA_INPUT : integer;
  attribute C_REG_DPRA_INPUT of U0 : label is 0;
  attribute c_addr_width : integer;
  attribute c_addr_width of U0 : label is 5;
  attribute c_default_data : string;
  attribute c_default_data of U0 : label is "0";
  attribute c_depth : integer;
  attribute c_depth of U0 : label is 32;
  attribute c_elaboration_dir : string;
  attribute c_elaboration_dir of U0 : label is "./";
  attribute c_has_clk : integer;
  attribute c_has_clk of U0 : label is 1;
  attribute c_has_qspo : integer;
  attribute c_has_qspo of U0 : label is 1;
  attribute c_has_qspo_ce : integer;
  attribute c_has_qspo_ce of U0 : label is 0;
  attribute c_has_qspo_rst : integer;
  attribute c_has_qspo_rst of U0 : label is 0;
  attribute c_has_qspo_srst : integer;
  attribute c_has_qspo_srst of U0 : label is 0;
  attribute c_has_spo : integer;
  attribute c_has_spo of U0 : label is 0;
  attribute c_mem_init_file : string;
  attribute c_mem_init_file of U0 : label is "no_coe_file_loaded";
  attribute c_parser_type : integer;
  attribute c_parser_type of U0 : label is 1;
  attribute c_read_mif : integer;
  attribute c_read_mif of U0 : label is 0;
  attribute c_reg_a_d_inputs : integer;
  attribute c_reg_a_d_inputs of U0 : label is 0;
  attribute c_sync_enable : integer;
  attribute c_sync_enable of U0 : label is 1;
  attribute c_width : integer;
  attribute c_width of U0 : label is 18;
begin
U0: entity work.Conv_2_Weight_Buf_dist_mem_gen_v8_0_12
     port map (
      a(4 downto 0) => a(4 downto 0),
      clk => clk,
      d(17 downto 0) => B"000000000000000000",
      dpo(17 downto 0) => NLW_U0_dpo_UNCONNECTED(17 downto 0),
      dpra(4 downto 0) => B"00000",
      i_ce => '1',
      qdpo(17 downto 0) => NLW_U0_qdpo_UNCONNECTED(17 downto 0),
      qdpo_ce => '1',
      qdpo_clk => '0',
      qdpo_rst => '0',
      qdpo_srst => '0',
      qspo(17 downto 0) => qspo(17 downto 0),
      qspo_ce => '1',
      qspo_rst => '0',
      qspo_srst => '0',
      spo(17 downto 0) => NLW_U0_spo_UNCONNECTED(17 downto 0),
      we => '0'
    );
end STRUCTURE;
