#!/bin/bash -f
# ****************************************************************************
# Vivado (TM) v2018.3.1 (64-bit)
#
# Filename    : elaborate.sh
# Simulator   : Xilinx Vivado Simulator
# Description : Script for elaborating the compiled design
#
# Generated by Vivado on Mon Mar 15 17:12:09 EDT 2021
# SW Build 2489853 on Tue Mar 26 04:18:30 MDT 2019
#
# Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
#
# usage: elaborate.sh
#
# ****************************************************************************
ExecStep()
{
"$@"
RETVAL=$?
if [ $RETVAL -ne 0 ]
then
exit $RETVAL
fi
}
ExecStep xelab -wto f121a475fec14a31b9530a7d3d2796fb --incr --debug typical --relax --mt 8 -L xbip_utils_v3_0_9 -L xbip_pipe_v3_0_5 -L xbip_bram18k_v3_0_5 -L mult_gen_v12_0_14 -L xbip_dsp48_wrapper_v3_0_4 -L xbip_dsp48_addsub_v3_0_5 -L xbip_dsp48_multadd_v3_0_5 -L xbip_multadd_v3_0_13 -L xil_defaultlib -L blk_mem_gen_v8_4_2 -L unisims_ver -L unimacro_ver -L secureip -L xpm --snapshot Conv_1_Channel_TB_behav xil_defaultlib.Conv_1_Channel_TB xil_defaultlib.glbl -log elaborate.log
