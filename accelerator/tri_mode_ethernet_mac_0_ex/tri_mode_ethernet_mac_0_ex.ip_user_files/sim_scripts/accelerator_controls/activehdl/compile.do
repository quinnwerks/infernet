vlib work
vlib activehdl

vlib activehdl/xil_defaultlib
vlib activehdl/xpm

vmap xil_defaultlib activehdl/xil_defaultlib
vmap xpm activehdl/xpm

vlog -work xil_defaultlib  -sv2k12 "+incdir+../../../../tri_mode_ethernet_mac_0_ex.srcs/sources_1/ip/accelerator_controls/hdl/verilog" "+incdir+../../../../tri_mode_ethernet_mac_0_ex.srcs/sources_1/ip/accelerator_controls/hdl" \
"/tools/Xilinx/Vivado/2018.3/data/ip/xpm/xpm_memory/hdl/xpm_memory.sv" \

vcom -work xpm -93 \
"/tools/Xilinx/Vivado/2018.3/data/ip/xpm/xpm_VCOMP.vhd" \

vlog -work xil_defaultlib  -v2k5 "+incdir+../../../../tri_mode_ethernet_mac_0_ex.srcs/sources_1/ip/accelerator_controls/hdl/verilog" "+incdir+../../../../tri_mode_ethernet_mac_0_ex.srcs/sources_1/ip/accelerator_controls/hdl" \
"../../../../tri_mode_ethernet_mac_0_ex.srcs/sources_1/ip/accelerator_controls/sim/accelerator_controls.v" \


vlog -work xil_defaultlib \
"glbl.v"

