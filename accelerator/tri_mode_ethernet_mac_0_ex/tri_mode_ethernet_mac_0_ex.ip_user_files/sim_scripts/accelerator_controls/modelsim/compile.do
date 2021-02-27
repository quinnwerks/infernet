vlib modelsim_lib/work
vlib modelsim_lib/msim

vlib modelsim_lib/msim/xil_defaultlib
vlib modelsim_lib/msim/xpm

vmap xil_defaultlib modelsim_lib/msim/xil_defaultlib
vmap xpm modelsim_lib/msim/xpm

vlog -work xil_defaultlib -64 -incr -sv "+incdir+../../../../tri_mode_ethernet_mac_0_ex.srcs/sources_1/ip/accelerator_controls/hdl/verilog" "+incdir+../../../../tri_mode_ethernet_mac_0_ex.srcs/sources_1/ip/accelerator_controls/hdl" \
"/tools/Xilinx/Vivado/2018.3/data/ip/xpm/xpm_memory/hdl/xpm_memory.sv" \

vcom -work xpm -64 -93 \
"/tools/Xilinx/Vivado/2018.3/data/ip/xpm/xpm_VCOMP.vhd" \

vlog -work xil_defaultlib -64 -incr "+incdir+../../../../tri_mode_ethernet_mac_0_ex.srcs/sources_1/ip/accelerator_controls/hdl/verilog" "+incdir+../../../../tri_mode_ethernet_mac_0_ex.srcs/sources_1/ip/accelerator_controls/hdl" \
"../../../../tri_mode_ethernet_mac_0_ex.srcs/sources_1/ip/accelerator_controls/sim/accelerator_controls.v" \


vlog -work xil_defaultlib \
"glbl.v"

