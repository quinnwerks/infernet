-makelib ies_lib/xil_defaultlib -sv \
  "/tools/Xilinx/Vivado/2018.3/data/ip/xpm/xpm_memory/hdl/xpm_memory.sv" \
-endlib
-makelib ies_lib/xpm \
  "/tools/Xilinx/Vivado/2018.3/data/ip/xpm/xpm_VCOMP.vhd" \
-endlib
-makelib ies_lib/xil_defaultlib \
  "../../../../tri_mode_ethernet_mac_0_ex.srcs/sources_1/ip/accelerator_controls/sim/accelerator_controls.v" \
-endlib
-makelib ies_lib/xil_defaultlib \
  glbl.v
-endlib

