`timescale 1ns / 1ps

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
localparam IP_HDR_SIZE_BYTES = 20;
localparam USER_DATA_BYTES = 785; 
localparam DATA_FRAME_WIDTH = USER_DATA_BYTES*8; 

logic [0:IP_ADDR_WIDTH-1]  accelerator_ip_address;
logic [0:MAC_ADDR_WIDTH-1] accelerator_mac_address;

logic [AXI_S_DATA_WIDTH-1:0]     mac_data_out;
logic                            mac_data_ready;
logic                            mac_data_valid;
logic                            mac_data_last;
logic                            mac_data_tuser;

logic [0:DATA_FRAME_WIDTH-1]     data_frame;
logic [0:IP_ADDR_WIDTH-1]        src_ip_address;
logic [0:MAC_ADDR_WIDTH-1]       src_mac_address;
logic                            frame_ready;
logic                            packet_for_accelerator;

logic[0:ETH_HDR_SIZE_BYTES*8-1] eth_header;
logic[0:IP_HDR_SIZE_BYTES*8-1]  ip_header; 

initial begin
    accelerator_ip_address = 32'h01_01_02_02;
    accelerator_mac_address = 48'h010203040506;
    areset = 0;
    mac_data_valid = 0;
    mac_data_last = 0;
    mac_data_tuser = 0;
    #10;
    areset = 1;
    #10;
    // dst, src, protocol/length
    eth_header = 'h010203040506_112233445566_0800;
    // version/ihl, tos, total length, id, flags/fragment, ttl/protocol, checksum, src, dst
    ip_header = 'h4500_ffff_0000_0000_8000_aaaa_01010201_01010202;
    // Case 1: Happy path
    $display("Case 1:");
    test_rx(eth_header, ip_header, USER_DATA_BYTES,    'h01,   1, 0, 0, 0);
    // Case 2: Test packet slighly too small + recovery
    $display("Case 2:");
    test_rx(eth_header, ip_header, USER_DATA_BYTES-20, 'h02, 0, 0, 0, 0);
    test_rx(eth_header, ip_header, USER_DATA_BYTES,    'h02, 1, 0, 0, 0);  
    // Case 3: Test packet way too small + recovery
    $display("Case 3:");
    test_rx(eth_header, ip_header, USER_DATA_BYTES-1,  'h03, 0, 0, 0, 0);
    test_rx(eth_header, ip_header, USER_DATA_BYTES,    'h03, 1, 0, 0, 0);
    // Case 4: Test packet slightly too big + recovery
    $display("Case 4:");
    test_rx(eth_header, ip_header, USER_DATA_BYTES+1,  'h04, 0, 0, 0, 0);
    test_rx(eth_header, ip_header, USER_DATA_BYTES,    'h04, 1, 0, 0, 0); 
    // Case 5: Test packet way too big + recovery
    $display("Case 5:");
    test_rx(eth_header, ip_header, USER_DATA_BYTES+20, 'h05, 0, 0, 0, 0);
    test_rx(eth_header, ip_header, USER_DATA_BYTES,    'h05, 1, 0, 0, 0);
    // Case 6: Corrupted packet (t_user goes high at end of stream) + recovery
    $display("Case 6:");
    test_rx(eth_header, ip_header, USER_DATA_BYTES,    'h06, 0, 1, 0, 0);
    test_rx(eth_header, ip_header, USER_DATA_BYTES,    'h06, 1, 0, 0, 0);
    // Case 7: Bad ip address
    $display("Case 7:");
    ip_header[16*8:20*8-1] = 'heeeeeeee;
    test_rx(eth_header, ip_header, USER_DATA_BYTES,    'h07, 0, 0, 0, 0);
    ip_header[16*8:20*8-1] = 'h01_01_02_02;
    test_rx(eth_header, ip_header, USER_DATA_BYTES,    'h07, 1, 0, 0, 0);
    // Case 8: Early frame termination in eth header + recovery
    $display("Case 8:");
    test_rx(eth_header, ip_header, USER_DATA_BYTES,    'h08, 0, 0, 1, 0);
    test_rx(eth_header, ip_header, USER_DATA_BYTES,    'h08, 1, 0, 0, 0);
    // Case 9: Early frame termination in ip header + recovery
    $display("Case 9:");
    test_rx(eth_header, ip_header, USER_DATA_BYTES,    'h09, 0, 0, 0, 1);
    test_rx(eth_header, ip_header, USER_DATA_BYTES,    'h09, 1, 0, 0, 0);

    //#10000;
    $finish();
    
end

task test_rx (
    input logic[0:ETH_HDR_SIZE_BYTES*8-1] eth_header,
    input logic[0:IP_HDR_SIZE_BYTES*8-1]  ip_header,
    input int                             user_data_size_bytes, 
    input logic[7:0]                      byte_fill,
    input int                             happy_path,
    input int                             bad_fcs,
    input int                             end_frame_early_eth,
    input int                             end_frame_early_ip
); 
    int unsigned expected_eth_reg[$];
    int unsigned expected_ip_reg[$];
    int unsigned expected_data_reg[$];
    
    int unsigned axi_stream[$];
    
    axi_stream = {};
    expected_eth_reg = {};
    expected_data_reg = {};
    expected_ip_reg = {};

    for (int i = 0; i < ETH_HDR_SIZE_BYTES; i++) begin
        expected_eth_reg = {expected_eth_reg, eth_header[i*8+:8]};
    end
    for (int j = 0; j < IP_HDR_SIZE_BYTES; j++) begin
        expected_ip_reg = {expected_ip_reg, ip_header[j*8+:8]};
    end

    get_dummy_dataframe(expected_data_reg, user_data_size_bytes, byte_fill);
    
    get_data_stream(axi_stream, expected_eth_reg, expected_ip_reg, expected_data_reg);
    if (end_frame_early_eth) begin
        axi_stream = {};
        get_dummy_dataframe(axi_stream, 13, 'hff);
    end
    if (end_frame_early_ip) begin
        axi_stream = {};
        get_dummy_dataframe(axi_stream, 14 + 23, 'hff);
    end

    $display("stream sizes: eth:%d data:%d ip:%d axi:%d", 
        expected_eth_reg.size, 
        expected_data_reg.size, 
        expected_ip_reg.size, 
        axi_stream.size);
  
    mac_data_valid = 'd1;
    for (int i = 0; i < axi_stream.size; i++) begin
        mac_data_out = axi_stream[i];
        if (i >= axi_stream.size - 1) begin
            mac_data_last = 'd1;
            if (bad_fcs) begin
                mac_data_tuser = 'd1;
            end
        end
        #10;
    end
    // Wait 1 cycle to enter PASS_TO_ACCELERATOR
    #10;
    mac_data_valid = 'd0;
    mac_data_last = 'd0;
    mac_data_tuser = 'd0;
    // Confirm all values are correct if you're on a happy path.
    if (happy_path == 'd1) begin
        assert(frame_ready == 'd1) else $error("Frame should have signaled ready");
        assert(eth_header[6*8:12*8-1] == src_mac_address) else $error("Bad src mac! %h, %h", eth_header[6*8:12*8-1], src_mac_address);
        $display("expected:%08x result:%08x", ip_header[12*8:16*8-1], src_ip_address);
        assert(ip_header[12*8:16*8-1] == src_ip_address) else $error("Bad src ip! %h %h", ip_header[12*8:16*8-1], src_ip_address);
        for (int i = 0; i < user_data_size_bytes; i++) begin
            assert(data_frame[i*8+:8] == expected_data_reg[i]) else $error("Bad user data!");
        end
    end
    else begin
         assert(frame_ready == 'd0) else $error("Frame should not have signaled ready");
    end

    #100;
endtask


task get_data_stream (
    output int unsigned data_frame[$],
    input  int unsigned expected_eth_frame[$],
    input  int unsigned expected_ip_frame[$],
    input  int unsigned expected_data_frame[$]

);
    data_frame = {};
    append_list_to_queue(data_frame, data_frame, expected_eth_frame);
    append_list_to_queue(data_frame, data_frame, expected_ip_frame);
    append_list_to_queue(data_frame, data_frame, expected_data_frame);
endtask

task get_dummy_dataframe (
    output int unsigned data_frame[$],
    input int size,
    input logic [7:0] byte_fill
);
    int unsigned k;
    data_frame = {};
    for (int i = 0; i < size; i++) begin
        k = byte_fill;
        if (i % 2 == 0) begin
            data_frame = {data_frame, byte_fill};
        end
        else begin
            data_frame = {data_frame, i % 256  };
        end
    end
endtask

task append_list_to_queue(
    output int unsigned out_queue[$],
    input  int unsigned in_queue[$],
    input  int unsigned list[$]
);
    out_queue = in_queue;
    for (int i = 0; i < list.size; i++) begin
        out_queue = {out_queue, list[i]};
    end

endtask



ip_packet_rx #(
    .USER_DATA_BYTES(USER_DATA_BYTES)
)dut (
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
    .FRAME_READY(frame_ready),
    .PACKET_FOR_ACCELERATOR(packet_for_accelerator)
);

endmodule
