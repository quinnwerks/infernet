# 
# Synthesis run script generated by Vivado
# 

set TIME_start [clock seconds] 
proc create_report { reportName command } {
  set status "."
  append status $reportName ".fail"
  if { [file exists $status] } {
    eval file delete [glob $status]
  }
  send_msg_id runtcl-4 info "Executing : $command"
  set retval [eval catch { $command } msg]
  if { $retval != 0 } {
    set fp [open $status w]
    close $fp
    send_msg_id runtcl-5 warning "$msg"
  }
}
create_project -in_memory -part xc7a100tcsg324-1

set_param project.singleFileAddWarning.threshold 0
set_param project.compositeFile.enableAutoGeneration 0
set_param synth.vivado.isSynthRun true
set_msg_config -source 4 -id {IP_Flow 19-2162} -severity warning -new_severity info
set_property webtalk.parent_dir /home/quinn/ece532-project/accelerator/tri_mode_ethernet_mac_0_ex/tri_mode_ethernet_mac_0_ex.cache/wt [current_project]
set_property parent.project_path /home/quinn/ece532-project/accelerator/tri_mode_ethernet_mac_0_ex/tri_mode_ethernet_mac_0_ex.xpr [current_project]
set_property XPM_LIBRARIES XPM_MEMORY [current_project]
set_property default_lib xil_defaultlib [current_project]
set_property target_language Verilog [current_project]
set_property board_part digilentinc.com:nexys4_ddr:part0:1.1 [current_project]
set_property ip_output_repo /home/quinn/ece532-project/accelerator/tri_mode_ethernet_mac_0_ex/tri_mode_ethernet_mac_0_ex.cache/ip [current_project]
set_property ip_cache_permissions {read write} [current_project]
read_verilog -library xil_defaultlib -sv {
  /home/quinn/ece532-project/misc/XOR_NN/XOR_NN.srcs/sources_1/new/FW_FP_Converter.sv
  /home/quinn/ece532-project/misc/XOR_NN/XOR_NN.srcs/sources_1/new/XOR_NN.sv
  /home/quinn/ece532-project/accelerator/rtl/byte_write_register.sv
  /home/quinn/ece532-project/accelerator/rtl/ip_layer.sv
  /home/quinn/ece532-project/accelerator/rtl/ip_packet_checksum.sv
  /home/quinn/ece532-project/accelerator/rtl/ip_packet_rx.sv
  /home/quinn/ece532-project/accelerator/rtl/ip_packet_tx.sv
  /home/quinn/ece532-project/util/rtl/util.sv
}
read_verilog -library xil_defaultlib {
  /home/quinn/ece532-project/accelerator/tri_mode_ethernet_mac_0_ex/imports/tri_mode_ethernet_mac_0_axi_lite_sm.v
  /home/quinn/ece532-project/accelerator/tri_mode_ethernet_mac_0_ex/imports/tri_mode_ethernet_mac_0_bram_tdp.v
  /home/quinn/ece532-project/accelerator/tri_mode_ethernet_mac_0_ex/imports/tri_mode_ethernet_mac_0_clk_wiz.v
  /home/quinn/ece532-project/accelerator/tri_mode_ethernet_mac_0_ex/imports/tri_mode_ethernet_mac_0_example_design_clocks.v
  /home/quinn/ece532-project/accelerator/tri_mode_ethernet_mac_0_ex/imports/tri_mode_ethernet_mac_0_example_design_resets.v
  /home/quinn/ece532-project/accelerator/tri_mode_ethernet_mac_0_ex/imports/tri_mode_ethernet_mac_0_fifo_block.v
  /home/quinn/ece532-project/accelerator/tri_mode_ethernet_mac_0_ex/imports/tri_mode_ethernet_mac_0_reset_sync.v
  /home/quinn/ece532-project/accelerator/tri_mode_ethernet_mac_0_ex/imports/tri_mode_ethernet_mac_0_rx_client_fifo.v
  /home/quinn/ece532-project/accelerator/tri_mode_ethernet_mac_0_ex/imports/tri_mode_ethernet_mac_0_support.v
  /home/quinn/ece532-project/accelerator/tri_mode_ethernet_mac_0_ex/imports/tri_mode_ethernet_mac_0_sync_block.v
  /home/quinn/ece532-project/accelerator/tri_mode_ethernet_mac_0_ex/imports/tri_mode_ethernet_mac_0_ten_100_1g_eth_fifo.v
  /home/quinn/ece532-project/accelerator/tri_mode_ethernet_mac_0_ex/imports/tri_mode_ethernet_mac_0_tx_client_fifo.v
  /home/quinn/ece532-project/accelerator/tri_mode_ethernet_mac_0_ex/imports/tri_mode_ethernet_mac_0_example_design.v
}
read_ip -quiet /home/quinn/ece532-project/accelerator/tri_mode_ethernet_mac_0_ex/tri_mode_ethernet_mac_0_ex.srcs/sources_1/ip/Mult_Add_COL/Mult_Add_COL.xci
set_property used_in_implementation false [get_files -all /home/quinn/ece532-project/accelerator/tri_mode_ethernet_mac_0_ex/tri_mode_ethernet_mac_0_ex.srcs/sources_1/ip/Mult_Add_COL/Mult_Add_COL_ooc.xdc]

read_ip -quiet /home/quinn/ece532-project/accelerator/tri_mode_ethernet_mac_0_ex/tri_mode_ethernet_mac_0_ex.srcs/sources_1/ip/Mult_Add_NC/Mult_Add_NC.xci
set_property used_in_implementation false [get_files -all /home/quinn/ece532-project/accelerator/tri_mode_ethernet_mac_0_ex/tri_mode_ethernet_mac_0_ex.srcs/sources_1/ip/Mult_Add_NC/Mult_Add_NC_ooc.xdc]

read_ip -quiet /home/quinn/ece532-project/accelerator/tri_mode_ethernet_mac_0_ex/tri_mode_ethernet_mac_0_ex.srcs/sources_1/ip/tri_mode_ethernet_mac_0/tri_mode_ethernet_mac_0.xci
set_property used_in_implementation false [get_files -all /home/quinn/ece532-project/accelerator/tri_mode_ethernet_mac_0_ex/tri_mode_ethernet_mac_0_ex.srcs/sources_1/ip/tri_mode_ethernet_mac_0/synth/tri_mode_ethernet_mac_0_board.xdc]
set_property used_in_implementation false [get_files -all /home/quinn/ece532-project/accelerator/tri_mode_ethernet_mac_0_ex/tri_mode_ethernet_mac_0_ex.srcs/sources_1/ip/tri_mode_ethernet_mac_0/synth/tri_mode_ethernet_mac_0.xdc]
set_property used_in_implementation false [get_files -all /home/quinn/ece532-project/accelerator/tri_mode_ethernet_mac_0_ex/tri_mode_ethernet_mac_0_ex.srcs/sources_1/ip/tri_mode_ethernet_mac_0/synth/tri_mode_ethernet_mac_0_ooc.xdc]
set_property used_in_implementation false [get_files -all /home/quinn/ece532-project/accelerator/tri_mode_ethernet_mac_0_ex/tri_mode_ethernet_mac_0_ex.srcs/sources_1/ip/tri_mode_ethernet_mac_0/synth/tri_mode_ethernet_mac_0_clocks.xdc]

# Mark all dcp files as not used in implementation to prevent them from being
# stitched into the results of this synthesis run. Any black boxes in the
# design are intentionally left as such for best results. Dcp files will be
# stitched into the design at a later time, either when this synthesis run is
# opened, or when it is stitched into a dependent implementation run.
foreach dcp [get_files -quiet -all -filter file_type=="Design\ Checkpoint"] {
  set_property used_in_implementation false $dcp
}
read_xdc /home/quinn/ece532-project/accelerator/tri_mode_ethernet_mac_0_ex/imports/tri_mode_ethernet_mac_0_example_design.xdc
set_property used_in_implementation false [get_files /home/quinn/ece532-project/accelerator/tri_mode_ethernet_mac_0_ex/imports/tri_mode_ethernet_mac_0_example_design.xdc]

read_xdc /home/quinn/ece532-project/accelerator/tri_mode_ethernet_mac_0_ex/imports/tri_mode_ethernet_mac_0_user_phytiming.xdc
set_property used_in_implementation false [get_files /home/quinn/ece532-project/accelerator/tri_mode_ethernet_mac_0_ex/imports/tri_mode_ethernet_mac_0_user_phytiming.xdc]
set_property processing_order LATE [get_files /home/quinn/ece532-project/accelerator/tri_mode_ethernet_mac_0_ex/imports/tri_mode_ethernet_mac_0_user_phytiming.xdc]

read_xdc dont_touch.xdc
set_property used_in_implementation false [get_files dont_touch.xdc]
set_param ips.enableIPCacheLiteLoad 1
close [open __synthesis_is_running__ w]

synth_design -top tri_mode_ethernet_mac_0_example_design -part xc7a100tcsg324-1


# disable binary constraint mode for synth run checkpoints
set_param constraints.enableBinaryConstraints false
write_checkpoint -force -noxdef tri_mode_ethernet_mac_0_example_design.dcp
create_report "synth_1_synth_report_utilization_0" "report_utilization -file tri_mode_ethernet_mac_0_example_design_utilization_synth.rpt -pb tri_mode_ethernet_mac_0_example_design_utilization_synth.pb"
file delete __synthesis_is_running__
close [open __synthesis_is_complete__ w]
