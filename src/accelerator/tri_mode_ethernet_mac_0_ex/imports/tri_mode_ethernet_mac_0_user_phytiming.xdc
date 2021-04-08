

## If the interface timing constraints cannot be met then these can be relaxed by adjusting the values in this
## xdc file which is set to be processed after all other xdc files
## this also allows for the IODELAY tap delay setting to be adjusted without needing to modify the xdc's
## provided with the core
## All commands in this file can be used directly in the tcl command window if the synthesized or implemented design is open.

# The MII interface requirement allows a 30ns setup and 10ns hold
#set_input_delay -clock $rx_clk_var -max 30            [get_ports {mii_rxd[*] mii_rx_er mii_rx_dv}]
#set_input_delay -clock $rx_clk_var -min 10 -add_delay [get_ports {mii_rxd[*] mii_rx_er mii_rx_dv}]



connect_debug_port u_ila_2/clk [get_nets [list ip_layer_inst/rx/n_0_5_BUFG]]








create_debug_core u_ila_0 ila
set_property ALL_PROBE_SAME_MU true [get_debug_cores u_ila_0]
set_property ALL_PROBE_SAME_MU_CNT 1 [get_debug_cores u_ila_0]
set_property C_ADV_TRIGGER false [get_debug_cores u_ila_0]
set_property C_DATA_DEPTH 1024 [get_debug_cores u_ila_0]
set_property C_EN_STRG_QUAL false [get_debug_cores u_ila_0]
set_property C_INPUT_PIPE_STAGES 0 [get_debug_cores u_ila_0]
set_property C_TRIGIN_EN false [get_debug_cores u_ila_0]
set_property C_TRIGOUT_EN false [get_debug_cores u_ila_0]
set_property port_width 1 [get_debug_ports u_ila_0/clk]
connect_debug_port u_ila_0/clk [get_nets [list clocking_wizard/inst/clk_out1]]
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe0]
set_property port_width 8 [get_debug_ports u_ila_0/probe0]
connect_debug_port u_ila_0/probe0 [get_nets [list {ip_layer_inst/rx/state[0]} {ip_layer_inst/rx/state[1]} {ip_layer_inst/rx/state[2]} {ip_layer_inst/rx/state[3]} {ip_layer_inst/rx/state[4]} {ip_layer_inst/rx/state[5]} {ip_layer_inst/rx/state[6]} {ip_layer_inst/rx/state[7]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe1]
set_property port_width 16 [get_debug_ports u_ila_0/probe1]
connect_debug_port u_ila_0/probe1 [get_nets [list {ip_layer_inst/rx/state_counter[0]} {ip_layer_inst/rx/state_counter[1]} {ip_layer_inst/rx/state_counter[2]} {ip_layer_inst/rx/state_counter[3]} {ip_layer_inst/rx/state_counter[4]} {ip_layer_inst/rx/state_counter[5]} {ip_layer_inst/rx/state_counter[6]} {ip_layer_inst/rx/state_counter[7]} {ip_layer_inst/rx/state_counter[8]} {ip_layer_inst/rx/state_counter[9]} {ip_layer_inst/rx/state_counter[10]} {ip_layer_inst/rx/state_counter[11]} {ip_layer_inst/rx/state_counter[12]} {ip_layer_inst/rx/state_counter[13]} {ip_layer_inst/rx/state_counter[14]} {ip_layer_inst/rx/state_counter[15]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe2]
set_property port_width 16 [get_debug_ports u_ila_0/probe2]
connect_debug_port u_ila_0/probe2 [get_nets [list {ip_layer_inst/rx/dst_udp_port[15]} {ip_layer_inst/rx/dst_udp_port[14]} {ip_layer_inst/rx/dst_udp_port[13]} {ip_layer_inst/rx/dst_udp_port[12]} {ip_layer_inst/rx/dst_udp_port[11]} {ip_layer_inst/rx/dst_udp_port[10]} {ip_layer_inst/rx/dst_udp_port[9]} {ip_layer_inst/rx/dst_udp_port[8]} {ip_layer_inst/rx/dst_udp_port[7]} {ip_layer_inst/rx/dst_udp_port[6]} {ip_layer_inst/rx/dst_udp_port[5]} {ip_layer_inst/rx/dst_udp_port[4]} {ip_layer_inst/rx/dst_udp_port[3]} {ip_layer_inst/rx/dst_udp_port[2]} {ip_layer_inst/rx/dst_udp_port[1]} {ip_layer_inst/rx/dst_udp_port[0]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe3]
set_property port_width 8 [get_debug_ports u_ila_0/probe3]
connect_debug_port u_ila_0/probe3 [get_nets [list {ip_layer_inst/rx/nextstate[0]} {ip_layer_inst/rx/nextstate[1]} {ip_layer_inst/rx/nextstate[2]} {ip_layer_inst/rx/nextstate[3]} {ip_layer_inst/rx/nextstate[4]} {ip_layer_inst/rx/nextstate[5]} {ip_layer_inst/rx/nextstate[6]} {ip_layer_inst/rx/nextstate[7]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe4]
set_property port_width 64 [get_debug_ports u_ila_0/probe4]
connect_debug_port u_ila_0/probe4 [get_nets [list {ip_layer_inst/rx/eth_header_data[111]} {ip_layer_inst/rx/eth_header_data[110]} {ip_layer_inst/rx/eth_header_data[109]} {ip_layer_inst/rx/eth_header_data[108]} {ip_layer_inst/rx/eth_header_data[107]} {ip_layer_inst/rx/eth_header_data[106]} {ip_layer_inst/rx/eth_header_data[105]} {ip_layer_inst/rx/eth_header_data[104]} {ip_layer_inst/rx/eth_header_data[103]} {ip_layer_inst/rx/eth_header_data[102]} {ip_layer_inst/rx/eth_header_data[101]} {ip_layer_inst/rx/eth_header_data[100]} {ip_layer_inst/rx/eth_header_data[99]} {ip_layer_inst/rx/eth_header_data[98]} {ip_layer_inst/rx/eth_header_data[97]} {ip_layer_inst/rx/eth_header_data[96]} {ip_layer_inst/rx/eth_header_data[47]} {ip_layer_inst/rx/eth_header_data[46]} {ip_layer_inst/rx/eth_header_data[45]} {ip_layer_inst/rx/eth_header_data[44]} {ip_layer_inst/rx/eth_header_data[43]} {ip_layer_inst/rx/eth_header_data[42]} {ip_layer_inst/rx/eth_header_data[41]} {ip_layer_inst/rx/eth_header_data[40]} {ip_layer_inst/rx/eth_header_data[39]} {ip_layer_inst/rx/eth_header_data[38]} {ip_layer_inst/rx/eth_header_data[37]} {ip_layer_inst/rx/eth_header_data[36]} {ip_layer_inst/rx/eth_header_data[35]} {ip_layer_inst/rx/eth_header_data[34]} {ip_layer_inst/rx/eth_header_data[33]} {ip_layer_inst/rx/eth_header_data[32]} {ip_layer_inst/rx/eth_header_data[31]} {ip_layer_inst/rx/eth_header_data[30]} {ip_layer_inst/rx/eth_header_data[29]} {ip_layer_inst/rx/eth_header_data[28]} {ip_layer_inst/rx/eth_header_data[27]} {ip_layer_inst/rx/eth_header_data[26]} {ip_layer_inst/rx/eth_header_data[25]} {ip_layer_inst/rx/eth_header_data[24]} {ip_layer_inst/rx/eth_header_data[23]} {ip_layer_inst/rx/eth_header_data[22]} {ip_layer_inst/rx/eth_header_data[21]} {ip_layer_inst/rx/eth_header_data[20]} {ip_layer_inst/rx/eth_header_data[19]} {ip_layer_inst/rx/eth_header_data[18]} {ip_layer_inst/rx/eth_header_data[17]} {ip_layer_inst/rx/eth_header_data[16]} {ip_layer_inst/rx/eth_header_data[15]} {ip_layer_inst/rx/eth_header_data[14]} {ip_layer_inst/rx/eth_header_data[13]} {ip_layer_inst/rx/eth_header_data[12]} {ip_layer_inst/rx/eth_header_data[11]} {ip_layer_inst/rx/eth_header_data[10]} {ip_layer_inst/rx/eth_header_data[9]} {ip_layer_inst/rx/eth_header_data[8]} {ip_layer_inst/rx/eth_header_data[7]} {ip_layer_inst/rx/eth_header_data[6]} {ip_layer_inst/rx/eth_header_data[5]} {ip_layer_inst/rx/eth_header_data[4]} {ip_layer_inst/rx/eth_header_data[3]} {ip_layer_inst/rx/eth_header_data[2]} {ip_layer_inst/rx/eth_header_data[1]} {ip_layer_inst/rx/eth_header_data[0]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe5]
set_property port_width 128 [get_debug_ports u_ila_0/probe5]
connect_debug_port u_ila_0/probe5 [get_nets [list {ip_layer_inst/rx/ip_header_data[159]} {ip_layer_inst/rx/ip_header_data[158]} {ip_layer_inst/rx/ip_header_data[157]} {ip_layer_inst/rx/ip_header_data[156]} {ip_layer_inst/rx/ip_header_data[155]} {ip_layer_inst/rx/ip_header_data[154]} {ip_layer_inst/rx/ip_header_data[153]} {ip_layer_inst/rx/ip_header_data[152]} {ip_layer_inst/rx/ip_header_data[151]} {ip_layer_inst/rx/ip_header_data[150]} {ip_layer_inst/rx/ip_header_data[149]} {ip_layer_inst/rx/ip_header_data[148]} {ip_layer_inst/rx/ip_header_data[147]} {ip_layer_inst/rx/ip_header_data[146]} {ip_layer_inst/rx/ip_header_data[145]} {ip_layer_inst/rx/ip_header_data[144]} {ip_layer_inst/rx/ip_header_data[143]} {ip_layer_inst/rx/ip_header_data[142]} {ip_layer_inst/rx/ip_header_data[141]} {ip_layer_inst/rx/ip_header_data[140]} {ip_layer_inst/rx/ip_header_data[139]} {ip_layer_inst/rx/ip_header_data[138]} {ip_layer_inst/rx/ip_header_data[137]} {ip_layer_inst/rx/ip_header_data[136]} {ip_layer_inst/rx/ip_header_data[135]} {ip_layer_inst/rx/ip_header_data[134]} {ip_layer_inst/rx/ip_header_data[133]} {ip_layer_inst/rx/ip_header_data[132]} {ip_layer_inst/rx/ip_header_data[131]} {ip_layer_inst/rx/ip_header_data[130]} {ip_layer_inst/rx/ip_header_data[129]} {ip_layer_inst/rx/ip_header_data[128]} {ip_layer_inst/rx/ip_header_data[95]} {ip_layer_inst/rx/ip_header_data[94]} {ip_layer_inst/rx/ip_header_data[93]} {ip_layer_inst/rx/ip_header_data[92]} {ip_layer_inst/rx/ip_header_data[91]} {ip_layer_inst/rx/ip_header_data[90]} {ip_layer_inst/rx/ip_header_data[89]} {ip_layer_inst/rx/ip_header_data[88]} {ip_layer_inst/rx/ip_header_data[87]} {ip_layer_inst/rx/ip_header_data[86]} {ip_layer_inst/rx/ip_header_data[85]} {ip_layer_inst/rx/ip_header_data[84]} {ip_layer_inst/rx/ip_header_data[83]} {ip_layer_inst/rx/ip_header_data[82]} {ip_layer_inst/rx/ip_header_data[81]} {ip_layer_inst/rx/ip_header_data[80]} {ip_layer_inst/rx/ip_header_data[79]} {ip_layer_inst/rx/ip_header_data[78]} {ip_layer_inst/rx/ip_header_data[77]} {ip_layer_inst/rx/ip_header_data[76]} {ip_layer_inst/rx/ip_header_data[75]} {ip_layer_inst/rx/ip_header_data[74]} {ip_layer_inst/rx/ip_header_data[73]} {ip_layer_inst/rx/ip_header_data[72]} {ip_layer_inst/rx/ip_header_data[71]} {ip_layer_inst/rx/ip_header_data[70]} {ip_layer_inst/rx/ip_header_data[69]} {ip_layer_inst/rx/ip_header_data[68]} {ip_layer_inst/rx/ip_header_data[67]} {ip_layer_inst/rx/ip_header_data[66]} {ip_layer_inst/rx/ip_header_data[65]} {ip_layer_inst/rx/ip_header_data[64]} {ip_layer_inst/rx/ip_header_data[63]} {ip_layer_inst/rx/ip_header_data[62]} {ip_layer_inst/rx/ip_header_data[61]} {ip_layer_inst/rx/ip_header_data[60]} {ip_layer_inst/rx/ip_header_data[59]} {ip_layer_inst/rx/ip_header_data[58]} {ip_layer_inst/rx/ip_header_data[57]} {ip_layer_inst/rx/ip_header_data[56]} {ip_layer_inst/rx/ip_header_data[55]} {ip_layer_inst/rx/ip_header_data[54]} {ip_layer_inst/rx/ip_header_data[53]} {ip_layer_inst/rx/ip_header_data[52]} {ip_layer_inst/rx/ip_header_data[51]} {ip_layer_inst/rx/ip_header_data[50]} {ip_layer_inst/rx/ip_header_data[49]} {ip_layer_inst/rx/ip_header_data[48]} {ip_layer_inst/rx/ip_header_data[47]} {ip_layer_inst/rx/ip_header_data[46]} {ip_layer_inst/rx/ip_header_data[45]} {ip_layer_inst/rx/ip_header_data[44]} {ip_layer_inst/rx/ip_header_data[43]} {ip_layer_inst/rx/ip_header_data[42]} {ip_layer_inst/rx/ip_header_data[41]} {ip_layer_inst/rx/ip_header_data[40]} {ip_layer_inst/rx/ip_header_data[39]} {ip_layer_inst/rx/ip_header_data[38]} {ip_layer_inst/rx/ip_header_data[37]} {ip_layer_inst/rx/ip_header_data[36]} {ip_layer_inst/rx/ip_header_data[35]} {ip_layer_inst/rx/ip_header_data[34]} {ip_layer_inst/rx/ip_header_data[33]} {ip_layer_inst/rx/ip_header_data[32]} {ip_layer_inst/rx/ip_header_data[31]} {ip_layer_inst/rx/ip_header_data[30]} {ip_layer_inst/rx/ip_header_data[29]} {ip_layer_inst/rx/ip_header_data[28]} {ip_layer_inst/rx/ip_header_data[27]} {ip_layer_inst/rx/ip_header_data[26]} {ip_layer_inst/rx/ip_header_data[25]} {ip_layer_inst/rx/ip_header_data[24]} {ip_layer_inst/rx/ip_header_data[23]} {ip_layer_inst/rx/ip_header_data[22]} {ip_layer_inst/rx/ip_header_data[21]} {ip_layer_inst/rx/ip_header_data[20]} {ip_layer_inst/rx/ip_header_data[19]} {ip_layer_inst/rx/ip_header_data[18]} {ip_layer_inst/rx/ip_header_data[17]} {ip_layer_inst/rx/ip_header_data[16]} {ip_layer_inst/rx/ip_header_data[15]} {ip_layer_inst/rx/ip_header_data[14]} {ip_layer_inst/rx/ip_header_data[13]} {ip_layer_inst/rx/ip_header_data[12]} {ip_layer_inst/rx/ip_header_data[11]} {ip_layer_inst/rx/ip_header_data[10]} {ip_layer_inst/rx/ip_header_data[9]} {ip_layer_inst/rx/ip_header_data[8]} {ip_layer_inst/rx/ip_header_data[7]} {ip_layer_inst/rx/ip_header_data[6]} {ip_layer_inst/rx/ip_header_data[5]} {ip_layer_inst/rx/ip_header_data[4]} {ip_layer_inst/rx/ip_header_data[3]} {ip_layer_inst/rx/ip_header_data[2]} {ip_layer_inst/rx/ip_header_data[1]} {ip_layer_inst/rx/ip_header_data[0]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe6]
set_property port_width 8 [get_debug_ports u_ila_0/probe6]
connect_debug_port u_ila_0/probe6 [get_nets [list {ip_to_nn_buffer/state[0]} {ip_to_nn_buffer/state[1]} {ip_to_nn_buffer/state[2]} {ip_to_nn_buffer/state[3]} {ip_to_nn_buffer/state[4]} {ip_to_nn_buffer/state[5]} {ip_to_nn_buffer/state[6]} {ip_to_nn_buffer/state[7]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe7]
set_property port_width 32 [get_debug_ports u_ila_0/probe7]
connect_debug_port u_ila_0/probe7 [get_nets [list {ip_layer_inst/rx/dst_ip_address[31]} {ip_layer_inst/rx/dst_ip_address[30]} {ip_layer_inst/rx/dst_ip_address[29]} {ip_layer_inst/rx/dst_ip_address[28]} {ip_layer_inst/rx/dst_ip_address[27]} {ip_layer_inst/rx/dst_ip_address[26]} {ip_layer_inst/rx/dst_ip_address[25]} {ip_layer_inst/rx/dst_ip_address[24]} {ip_layer_inst/rx/dst_ip_address[23]} {ip_layer_inst/rx/dst_ip_address[22]} {ip_layer_inst/rx/dst_ip_address[21]} {ip_layer_inst/rx/dst_ip_address[20]} {ip_layer_inst/rx/dst_ip_address[19]} {ip_layer_inst/rx/dst_ip_address[18]} {ip_layer_inst/rx/dst_ip_address[17]} {ip_layer_inst/rx/dst_ip_address[16]} {ip_layer_inst/rx/dst_ip_address[15]} {ip_layer_inst/rx/dst_ip_address[14]} {ip_layer_inst/rx/dst_ip_address[13]} {ip_layer_inst/rx/dst_ip_address[12]} {ip_layer_inst/rx/dst_ip_address[11]} {ip_layer_inst/rx/dst_ip_address[10]} {ip_layer_inst/rx/dst_ip_address[9]} {ip_layer_inst/rx/dst_ip_address[8]} {ip_layer_inst/rx/dst_ip_address[7]} {ip_layer_inst/rx/dst_ip_address[6]} {ip_layer_inst/rx/dst_ip_address[5]} {ip_layer_inst/rx/dst_ip_address[4]} {ip_layer_inst/rx/dst_ip_address[3]} {ip_layer_inst/rx/dst_ip_address[2]} {ip_layer_inst/rx/dst_ip_address[1]} {ip_layer_inst/rx/dst_ip_address[0]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe8]
set_property port_width 8 [get_debug_ports u_ila_0/probe8]
connect_debug_port u_ila_0/probe8 [get_nets [list {ip_to_nn_buffer/nextstate[0]} {ip_to_nn_buffer/nextstate[1]} {ip_to_nn_buffer/nextstate[2]} {ip_to_nn_buffer/nextstate[3]} {ip_to_nn_buffer/nextstate[4]} {ip_to_nn_buffer/nextstate[5]} {ip_to_nn_buffer/nextstate[6]} {ip_to_nn_buffer/nextstate[7]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe9]
set_property port_width 48 [get_debug_ports u_ila_0/probe9]
connect_debug_port u_ila_0/probe9 [get_nets [list {ip_layer_inst/rx/dst_mac_address[47]} {ip_layer_inst/rx/dst_mac_address[46]} {ip_layer_inst/rx/dst_mac_address[45]} {ip_layer_inst/rx/dst_mac_address[44]} {ip_layer_inst/rx/dst_mac_address[43]} {ip_layer_inst/rx/dst_mac_address[42]} {ip_layer_inst/rx/dst_mac_address[41]} {ip_layer_inst/rx/dst_mac_address[40]} {ip_layer_inst/rx/dst_mac_address[39]} {ip_layer_inst/rx/dst_mac_address[38]} {ip_layer_inst/rx/dst_mac_address[37]} {ip_layer_inst/rx/dst_mac_address[36]} {ip_layer_inst/rx/dst_mac_address[35]} {ip_layer_inst/rx/dst_mac_address[34]} {ip_layer_inst/rx/dst_mac_address[33]} {ip_layer_inst/rx/dst_mac_address[32]} {ip_layer_inst/rx/dst_mac_address[31]} {ip_layer_inst/rx/dst_mac_address[30]} {ip_layer_inst/rx/dst_mac_address[29]} {ip_layer_inst/rx/dst_mac_address[28]} {ip_layer_inst/rx/dst_mac_address[27]} {ip_layer_inst/rx/dst_mac_address[26]} {ip_layer_inst/rx/dst_mac_address[25]} {ip_layer_inst/rx/dst_mac_address[24]} {ip_layer_inst/rx/dst_mac_address[23]} {ip_layer_inst/rx/dst_mac_address[22]} {ip_layer_inst/rx/dst_mac_address[21]} {ip_layer_inst/rx/dst_mac_address[20]} {ip_layer_inst/rx/dst_mac_address[19]} {ip_layer_inst/rx/dst_mac_address[18]} {ip_layer_inst/rx/dst_mac_address[17]} {ip_layer_inst/rx/dst_mac_address[16]} {ip_layer_inst/rx/dst_mac_address[15]} {ip_layer_inst/rx/dst_mac_address[14]} {ip_layer_inst/rx/dst_mac_address[13]} {ip_layer_inst/rx/dst_mac_address[12]} {ip_layer_inst/rx/dst_mac_address[11]} {ip_layer_inst/rx/dst_mac_address[10]} {ip_layer_inst/rx/dst_mac_address[9]} {ip_layer_inst/rx/dst_mac_address[8]} {ip_layer_inst/rx/dst_mac_address[7]} {ip_layer_inst/rx/dst_mac_address[6]} {ip_layer_inst/rx/dst_mac_address[5]} {ip_layer_inst/rx/dst_mac_address[4]} {ip_layer_inst/rx/dst_mac_address[3]} {ip_layer_inst/rx/dst_mac_address[2]} {ip_layer_inst/rx/dst_mac_address[1]} {ip_layer_inst/rx/dst_mac_address[0]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe10]
set_property port_width 64 [get_debug_ports u_ila_0/probe10]
connect_debug_port u_ila_0/probe10 [get_nets [list {ip_layer_inst/rx/udp_header_data[63]} {ip_layer_inst/rx/udp_header_data[62]} {ip_layer_inst/rx/udp_header_data[61]} {ip_layer_inst/rx/udp_header_data[60]} {ip_layer_inst/rx/udp_header_data[59]} {ip_layer_inst/rx/udp_header_data[58]} {ip_layer_inst/rx/udp_header_data[57]} {ip_layer_inst/rx/udp_header_data[56]} {ip_layer_inst/rx/udp_header_data[55]} {ip_layer_inst/rx/udp_header_data[54]} {ip_layer_inst/rx/udp_header_data[53]} {ip_layer_inst/rx/udp_header_data[52]} {ip_layer_inst/rx/udp_header_data[51]} {ip_layer_inst/rx/udp_header_data[50]} {ip_layer_inst/rx/udp_header_data[49]} {ip_layer_inst/rx/udp_header_data[48]} {ip_layer_inst/rx/udp_header_data[47]} {ip_layer_inst/rx/udp_header_data[46]} {ip_layer_inst/rx/udp_header_data[45]} {ip_layer_inst/rx/udp_header_data[44]} {ip_layer_inst/rx/udp_header_data[43]} {ip_layer_inst/rx/udp_header_data[42]} {ip_layer_inst/rx/udp_header_data[41]} {ip_layer_inst/rx/udp_header_data[40]} {ip_layer_inst/rx/udp_header_data[39]} {ip_layer_inst/rx/udp_header_data[38]} {ip_layer_inst/rx/udp_header_data[37]} {ip_layer_inst/rx/udp_header_data[36]} {ip_layer_inst/rx/udp_header_data[35]} {ip_layer_inst/rx/udp_header_data[34]} {ip_layer_inst/rx/udp_header_data[33]} {ip_layer_inst/rx/udp_header_data[32]} {ip_layer_inst/rx/udp_header_data[31]} {ip_layer_inst/rx/udp_header_data[30]} {ip_layer_inst/rx/udp_header_data[29]} {ip_layer_inst/rx/udp_header_data[28]} {ip_layer_inst/rx/udp_header_data[27]} {ip_layer_inst/rx/udp_header_data[26]} {ip_layer_inst/rx/udp_header_data[25]} {ip_layer_inst/rx/udp_header_data[24]} {ip_layer_inst/rx/udp_header_data[23]} {ip_layer_inst/rx/udp_header_data[22]} {ip_layer_inst/rx/udp_header_data[21]} {ip_layer_inst/rx/udp_header_data[20]} {ip_layer_inst/rx/udp_header_data[19]} {ip_layer_inst/rx/udp_header_data[18]} {ip_layer_inst/rx/udp_header_data[17]} {ip_layer_inst/rx/udp_header_data[16]} {ip_layer_inst/rx/udp_header_data[15]} {ip_layer_inst/rx/udp_header_data[14]} {ip_layer_inst/rx/udp_header_data[13]} {ip_layer_inst/rx/udp_header_data[12]} {ip_layer_inst/rx/udp_header_data[11]} {ip_layer_inst/rx/udp_header_data[10]} {ip_layer_inst/rx/udp_header_data[9]} {ip_layer_inst/rx/udp_header_data[8]} {ip_layer_inst/rx/udp_header_data[7]} {ip_layer_inst/rx/udp_header_data[6]} {ip_layer_inst/rx/udp_header_data[5]} {ip_layer_inst/rx/udp_header_data[4]} {ip_layer_inst/rx/udp_header_data[3]} {ip_layer_inst/rx/udp_header_data[2]} {ip_layer_inst/rx/udp_header_data[1]} {ip_layer_inst/rx/udp_header_data[0]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe11]
set_property port_width 8 [get_debug_ports u_ila_0/probe11]
connect_debug_port u_ila_0/probe11 [get_nets [list {ip_layer_inst/tx/nextstate[0]} {ip_layer_inst/tx/nextstate[1]} {ip_layer_inst/tx/nextstate[2]} {ip_layer_inst/tx/nextstate[3]} {ip_layer_inst/tx/nextstate[4]} {ip_layer_inst/tx/nextstate[5]} {ip_layer_inst/tx/nextstate[6]} {ip_layer_inst/tx/nextstate[7]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe12]
set_property port_width 8 [get_debug_ports u_ila_0/probe12]
connect_debug_port u_ila_0/probe12 [get_nets [list {ip_layer_inst/tx/state[0]} {ip_layer_inst/tx/state[1]} {ip_layer_inst/tx/state[2]} {ip_layer_inst/tx/state[3]} {ip_layer_inst/tx/state[4]} {ip_layer_inst/tx/state[5]} {ip_layer_inst/tx/state[6]} {ip_layer_inst/tx/state[7]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe13]
set_property port_width 32 [get_debug_ports u_ila_0/probe13]
connect_debug_port u_ila_0/probe13 [get_nets [list {ip_address_from_rx[31]} {ip_address_from_rx[30]} {ip_address_from_rx[29]} {ip_address_from_rx[28]} {ip_address_from_rx[27]} {ip_address_from_rx[26]} {ip_address_from_rx[25]} {ip_address_from_rx[24]} {ip_address_from_rx[23]} {ip_address_from_rx[22]} {ip_address_from_rx[21]} {ip_address_from_rx[20]} {ip_address_from_rx[19]} {ip_address_from_rx[18]} {ip_address_from_rx[17]} {ip_address_from_rx[16]} {ip_address_from_rx[15]} {ip_address_from_rx[14]} {ip_address_from_rx[13]} {ip_address_from_rx[12]} {ip_address_from_rx[11]} {ip_address_from_rx[10]} {ip_address_from_rx[9]} {ip_address_from_rx[8]} {ip_address_from_rx[7]} {ip_address_from_rx[6]} {ip_address_from_rx[5]} {ip_address_from_rx[4]} {ip_address_from_rx[3]} {ip_address_from_rx[2]} {ip_address_from_rx[1]} {ip_address_from_rx[0]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe14]
set_property port_width 48 [get_debug_ports u_ila_0/probe14]
connect_debug_port u_ila_0/probe14 [get_nets [list {mac_address_from_rx[47]} {mac_address_from_rx[46]} {mac_address_from_rx[45]} {mac_address_from_rx[44]} {mac_address_from_rx[43]} {mac_address_from_rx[42]} {mac_address_from_rx[41]} {mac_address_from_rx[40]} {mac_address_from_rx[39]} {mac_address_from_rx[38]} {mac_address_from_rx[37]} {mac_address_from_rx[36]} {mac_address_from_rx[35]} {mac_address_from_rx[34]} {mac_address_from_rx[33]} {mac_address_from_rx[32]} {mac_address_from_rx[31]} {mac_address_from_rx[30]} {mac_address_from_rx[29]} {mac_address_from_rx[28]} {mac_address_from_rx[27]} {mac_address_from_rx[26]} {mac_address_from_rx[25]} {mac_address_from_rx[24]} {mac_address_from_rx[23]} {mac_address_from_rx[22]} {mac_address_from_rx[21]} {mac_address_from_rx[20]} {mac_address_from_rx[19]} {mac_address_from_rx[18]} {mac_address_from_rx[17]} {mac_address_from_rx[16]} {mac_address_from_rx[15]} {mac_address_from_rx[14]} {mac_address_from_rx[13]} {mac_address_from_rx[12]} {mac_address_from_rx[11]} {mac_address_from_rx[10]} {mac_address_from_rx[9]} {mac_address_from_rx[8]} {mac_address_from_rx[7]} {mac_address_from_rx[6]} {mac_address_from_rx[5]} {mac_address_from_rx[4]} {mac_address_from_rx[3]} {mac_address_from_rx[2]} {mac_address_from_rx[1]} {mac_address_from_rx[0]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe15]
set_property port_width 10 [get_debug_ports u_ila_0/probe15]
connect_debug_port u_ila_0/probe15 [get_nets [list {recipient_message_to_tx[9]} {recipient_message_to_tx[8]} {recipient_message_to_tx[7]} {recipient_message_to_tx[6]} {recipient_message_to_tx[5]} {recipient_message_to_tx[4]} {recipient_message_to_tx[3]} {recipient_message_to_tx[2]} {recipient_message_to_tx[1]} {recipient_message_to_tx[0]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe16]
set_property port_width 8 [get_debug_ports u_ila_0/probe16]
connect_debug_port u_ila_0/probe16 [get_nets [list {rx_axis_fifo_tdata[0]} {rx_axis_fifo_tdata[1]} {rx_axis_fifo_tdata[2]} {rx_axis_fifo_tdata[3]} {rx_axis_fifo_tdata[4]} {rx_axis_fifo_tdata[5]} {rx_axis_fifo_tdata[6]} {rx_axis_fifo_tdata[7]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe17]
set_property port_width 8 [get_debug_ports u_ila_0/probe17]
connect_debug_port u_ila_0/probe17 [get_nets [list {tx_axis_fifo_tdata[0]} {tx_axis_fifo_tdata[1]} {tx_axis_fifo_tdata[2]} {tx_axis_fifo_tdata[3]} {tx_axis_fifo_tdata[4]} {tx_axis_fifo_tdata[5]} {tx_axis_fifo_tdata[6]} {tx_axis_fifo_tdata[7]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe18]
set_property port_width 16 [get_debug_ports u_ila_0/probe18]
connect_debug_port u_ila_0/probe18 [get_nets [list {udp_port_from_rx[15]} {udp_port_from_rx[14]} {udp_port_from_rx[13]} {udp_port_from_rx[12]} {udp_port_from_rx[11]} {udp_port_from_rx[10]} {udp_port_from_rx[9]} {udp_port_from_rx[8]} {udp_port_from_rx[7]} {udp_port_from_rx[6]} {udp_port_from_rx[5]} {udp_port_from_rx[4]} {udp_port_from_rx[3]} {udp_port_from_rx[2]} {udp_port_from_rx[1]} {udp_port_from_rx[0]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe19]
set_property port_width 1 [get_debug_ports u_ila_0/probe19]
connect_debug_port u_ila_0/probe19 [get_nets [list ip_layer_inst/rx/data_frame_enable]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe20]
set_property port_width 1 [get_debug_ports u_ila_0/probe20]
connect_debug_port u_ila_0/probe20 [get_nets [list ip_layer_inst/rx/eth_header_enable]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe21]
set_property port_width 1 [get_debug_ports u_ila_0/probe21]
connect_debug_port u_ila_0/probe21 [get_nets [list frame_ready_from_rx]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe22]
set_property port_width 1 [get_debug_ports u_ila_0/probe22]
connect_debug_port u_ila_0/probe22 [get_nets [list ip_layer_inst/rx/ip_header_enable]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe23]
set_property port_width 1 [get_debug_ports u_ila_0/probe23]
connect_debug_port u_ila_0/probe23 [get_nets [list ready_for_send_to_tx]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe24]
set_property port_width 1 [get_debug_ports u_ila_0/probe24]
connect_debug_port u_ila_0/probe24 [get_nets [list rx_axis_fifo_tlast]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe25]
set_property port_width 1 [get_debug_ports u_ila_0/probe25]
connect_debug_port u_ila_0/probe25 [get_nets [list rx_axis_fifo_tvalid]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe26]
set_property port_width 1 [get_debug_ports u_ila_0/probe26]
connect_debug_port u_ila_0/probe26 [get_nets [list start_ip_txn_to_tx]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe27]
set_property port_width 1 [get_debug_ports u_ila_0/probe27]
connect_debug_port u_ila_0/probe27 [get_nets [list ip_layer_inst/rx/state_counter_enable]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe28]
set_property port_width 1 [get_debug_ports u_ila_0/probe28]
connect_debug_port u_ila_0/probe28 [get_nets [list ip_layer_inst/rx/state_counter_reset]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe29]
set_property port_width 1 [get_debug_ports u_ila_0/probe29]
connect_debug_port u_ila_0/probe29 [get_nets [list tx_axis_fifo_tlast]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe30]
set_property port_width 1 [get_debug_ports u_ila_0/probe30]
connect_debug_port u_ila_0/probe30 [get_nets [list tx_axis_fifo_tready]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe31]
set_property port_width 1 [get_debug_ports u_ila_0/probe31]
connect_debug_port u_ila_0/probe31 [get_nets [list tx_axis_fifo_tvalid]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe32]
set_property port_width 1 [get_debug_ports u_ila_0/probe32]
connect_debug_port u_ila_0/probe32 [get_nets [list ip_layer_inst/rx/udp_header_enable]]
create_debug_core u_ila_1 ila
set_property ALL_PROBE_SAME_MU true [get_debug_cores u_ila_1]
set_property ALL_PROBE_SAME_MU_CNT 1 [get_debug_cores u_ila_1]
set_property C_ADV_TRIGGER false [get_debug_cores u_ila_1]
set_property C_DATA_DEPTH 1024 [get_debug_cores u_ila_1]
set_property C_EN_STRG_QUAL false [get_debug_cores u_ila_1]
set_property C_INPUT_PIPE_STAGES 0 [get_debug_cores u_ila_1]
set_property C_TRIGIN_EN false [get_debug_cores u_ila_1]
set_property C_TRIGOUT_EN false [get_debug_cores u_ila_1]
set_property port_width 1 [get_debug_ports u_ila_1/clk]
connect_debug_port u_ila_1/clk [get_nets [list clocking_wizard/inst/clk_out2]]
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_1/probe0]
set_property port_width 4 [get_debug_ports u_ila_1/probe0]
connect_debug_port u_ila_1/probe0 [get_nets [list {mii_rxd[0]} {mii_rxd[1]} {mii_rxd[2]} {mii_rxd[3]}]]
create_debug_port u_ila_1 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_1/probe1]
set_property port_width 2 [get_debug_ports u_ila_1/probe1]
connect_debug_port u_ila_1/probe1 [get_nets [list {phy2rmii_rxd_IBUF[0]} {phy2rmii_rxd_IBUF[1]}]]
create_debug_core u_ila_2 ila
set_property ALL_PROBE_SAME_MU true [get_debug_cores u_ila_2]
set_property ALL_PROBE_SAME_MU_CNT 1 [get_debug_cores u_ila_2]
set_property C_ADV_TRIGGER false [get_debug_cores u_ila_2]
set_property C_DATA_DEPTH 1024 [get_debug_cores u_ila_2]
set_property C_EN_STRG_QUAL false [get_debug_cores u_ila_2]
set_property C_INPUT_PIPE_STAGES 0 [get_debug_cores u_ila_2]
set_property C_TRIGIN_EN false [get_debug_cores u_ila_2]
set_property C_TRIGOUT_EN false [get_debug_cores u_ila_2]
set_property port_width 1 [get_debug_ports u_ila_2/clk]
connect_debug_port u_ila_2/clk [get_nets [list trimac_fifo_block/trimac_sup_block/tri_mode_ethernet_mac_i/inst/mii_interface/mii_tx_clk_0]]
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_2/probe0]
set_property port_width 4 [get_debug_ports u_ila_2/probe0]
connect_debug_port u_ila_2/probe0 [get_nets [list {mii_txd[0]} {mii_txd[1]} {mii_txd[2]} {mii_txd[3]}]]
create_debug_port u_ila_2 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_2/probe1]
set_property port_width 1 [get_debug_ports u_ila_2/probe1]
connect_debug_port u_ila_2/probe1 [get_nets [list mii_tx_en]]
create_debug_port u_ila_2 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_2/probe2]
set_property port_width 1 [get_debug_ports u_ila_2/probe2]
connect_debug_port u_ila_2/probe2 [get_nets [list mii_tx_er]]
set_property C_CLK_INPUT_FREQ_HZ 300000000 [get_debug_cores dbg_hub]
set_property C_ENABLE_CLK_DIVIDER false [get_debug_cores dbg_hub]
set_property C_USER_SCAN_CHAIN 1 [get_debug_cores dbg_hub]
connect_debug_port dbg_hub/clk [get_nets sys_clk_IBUF]