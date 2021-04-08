vlib questa_lib/work
vlib questa_lib/msim

vlib questa_lib/msim/xil_defaultlib
vlib questa_lib/msim/xpm

vmap xil_defaultlib questa_lib/msim/xil_defaultlib
vmap xpm questa_lib/msim/xpm

vlog -work xil_defaultlib -64 -sv "+incdir+../../../../tri_mode_ethernet_mac_0_ex.srcs/sources_1/ip/accelerator_controls/hdl/verilog" "+incdir+../../../../tri_mode_ethernet_mac_0_ex.srcs/sources_1/ip/accelerator_controls/hdl" \
"/tools/Xilinx/Vivado/2018.3/data/ip/xpm/xpm_memory/hdl/xpm_memory.sv" \

vcom -work xpm -64 -93 \
"/tools/Xilinx/Vivado/2018.3/data/ip/xpm/xpm_VCOMP.vhd" \

vlog -work xil_defaultlib -64 "+incdir+../../../../tri_mode_ethernet_mac_0_ex.srcs/sources_1/ip/accelerator_controls/hdl/verilog" "+incdir+../../../../tri_mode_ethernet_mac_0_ex.srcs/sources_1/ip/accelerator_controls/hdl" \
"../../../../tri_mode_ethernet_mac_0_ex.srcs/sources_1/ip/accelerator_controls/sim/accelerator_controls.v" \


vlog -work xil_defaultlib \
"glbl.v"

