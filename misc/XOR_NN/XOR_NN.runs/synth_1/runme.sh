#!/bin/sh

# 
# Vivado(TM)
# runme.sh: a Vivado-generated Runs Script for UNIX
# Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
# 

if [ -z "$PATH" ]; then
  PATH=/home/andrew/Xilinx/install-dir/SDK/2018.3/bin:/home/andrew/Xilinx/install-dir/Vivado/2018.3/ids_lite/ISE/bin/lin64:/home/andrew/Xilinx/install-dir/Vivado/2018.3/bin
else
  PATH=/home/andrew/Xilinx/install-dir/SDK/2018.3/bin:/home/andrew/Xilinx/install-dir/Vivado/2018.3/ids_lite/ISE/bin/lin64:/home/andrew/Xilinx/install-dir/Vivado/2018.3/bin:$PATH
fi
export PATH

if [ -z "$LD_LIBRARY_PATH" ]; then
  LD_LIBRARY_PATH=/home/andrew/Xilinx/install-dir/Vivado/2018.3/ids_lite/ISE/lib/lin64
else
  LD_LIBRARY_PATH=/home/andrew/Xilinx/install-dir/Vivado/2018.3/ids_lite/ISE/lib/lin64:$LD_LIBRARY_PATH
fi
export LD_LIBRARY_PATH

HD_PWD='/home/andrew/infernet/misc/XOR_NN/XOR_NN.runs/synth_1'
cd "$HD_PWD"

HD_LOG=runme.log
/bin/touch $HD_LOG

ISEStep="./ISEWrap.sh"
EAStep()
{
     $ISEStep $HD_LOG "$@" >> $HD_LOG 2>&1
     if [ $? -ne 0 ]
     then
         exit
     fi
}

EAStep vivado -log Top.vds -m64 -product Vivado -mode batch -messageDb vivado.pb -notrace -source Top.tcl
