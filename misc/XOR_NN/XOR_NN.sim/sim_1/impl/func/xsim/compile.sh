#!/bin/bash -f
# ****************************************************************************
# Vivado (TM) v2018.3.1 (64-bit)
#
# Filename    : compile.sh
# Simulator   : Xilinx Vivado Simulator
# Description : Script for compiling the simulation design source files
#
# Generated by Vivado on Wed Feb 24 18:30:58 EST 2021
# SW Build 2489853 on Tue Mar 26 04:18:30 MDT 2019
#
# Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
#
# usage: compile.sh
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
echo "xvlog --incr --relax -prj XOR_NN_TB_vlog.prj"
ExecStep xvlog --incr --relax -prj XOR_NN_TB_vlog.prj 2>&1 | tee compile.log

