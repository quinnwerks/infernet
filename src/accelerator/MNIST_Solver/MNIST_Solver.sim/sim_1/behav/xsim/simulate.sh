#!/bin/bash -f
# ****************************************************************************
# Vivado (TM) v2018.3.1 (64-bit)
#
# Filename    : simulate.sh
# Simulator   : Xilinx Vivado Simulator
# Description : Script for simulating the design by launching the simulator
#
# Generated by Vivado on Sat Mar 27 15:55:18 EDT 2021
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
ExecStep xsim MNIST_Solver_TB_behav -key {Behavioral:sim_1:Functional:MNIST_Solver_TB} -tclbatch MNIST_Solver_TB.tcl -log simulate.log