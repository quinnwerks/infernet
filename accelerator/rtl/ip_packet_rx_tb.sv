module ip_packet_rx_tb();

logic aclk;
initial aclk = 'd1;
always #5 aclk = ~aclk;

logic areset;

localparam IP_ADDR_WIDTH = 32;
localparam MAC_ADDR_WIDTH = 48;
localparam AXI_S_DATA_WIDTH = 8;
localparam COUNTER_WIDTH = 16;
localparam ETH_HDR_SIZE_BYTES = 14;
localparam IP_HDR_SIZE_BYTES = 24;
localparam USER_DATA_BYTES = 785; 
localparam DATA_FRAME_WIDTH = USER_DATA_BYTES*8; 

logic [IP_ADDR_WIDTH-1:0]  accelerator_ip_address;
logic [MAC_ADDR_WIDTH-1:0] accelerator_mac_address;

logic [AXI_S_DATA_WIDTH-1:0]     mac_data_out;
logic                            mac_data_ready;
logic                            mac_data_valid;
logic                            mac_data_last;
logic                            mac_data_tuser;

logic [DATA_FRAME_WIDTH-1:0]     data_frame;
logic [IP_ADDR_WIDTH-1:0]        src_ip_address;
logic [MAC_ADDR_WIDTH-1:0]       src_mac_address;
logic                            frame_ready;


initial begin

    
end

task test_rx(); 

endtask


ip_packet_rx dut (
    .ACLK(aclk),
    .ARESET(areset),
    .ACCELERATOR_IP_ADDRESS(accelerator_ip_address),
    .ACCELERATOR_MAC_ADDRESS(accelerator_mac_address),
    .MAC_DATA_OUT(mac_data_out),
    .MAC_DATA_READY(mac_data_ready),
    .MAC_DATA_VALID(mac_data_valid),
    .MAC_DATA_LAST(mac_data_last),
    .MAC_DATA_TUSER(mac_data_tuser),
    .DATA_FRAME(data_frame),
    .SRC_IP_ADDRESS(src_ip_address),
    .SRC_MAC_ADDRESS(src_mac_address),
    .FRAME_READY(frame_ready)
);

endmodule
