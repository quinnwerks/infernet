#!/bin/bash -f
# ****************************************************************************
# Vivado (TM) v2018.3.1 (64-bit)
#
# Filename    : simulate.sh
# Simulator   : Xilinx Vivado Simulator
# Description : Script for simulating the design by launching the simulator
#
# Generated by Vivado on Sat Feb 27 14:03:07 EST 2021
# SW Build 2489853 on Tue Mar 26 04:18:30 MDT 2019
#
# Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
#
# usage: simulate.sh
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
ExecStep xsim demo_tb_integration_behav -key {Behavioral:sim_1:Functional:demo_tb_integration} -tclbatch demo_tb_integration.tcl -view /home/quinn/ece532-project/accelerator/tri_mode_ethernet_mac_0_ex/demo_tb_behav.wcfg -log simulate.log
