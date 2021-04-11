`timescale 1ns / 1ps

module ip_nn_integ_tb();

logic aclk;
initial aclk = 'd1;
always #5 aclk = ~aclk;

logic areset;

localparam IP_ADDR_WIDTH = 32;
localparam MAC_ADDR_WIDTH = 48;
localparam UDP_PORT_WIDTH = 16;

localparam AXI_S_DATA_WIDTH = 8;
localparam COUNTER_WIDTH = 16;
localparam ETH_HDR_SIZE_BYTES = 14;
localparam IP_HDR_SIZE_BYTES = 20;
localparam UDP_HDR_SIZE_BYTES = 8;

localparam USER_DATA_BYTES = 784; 
localparam DATA_FRAME_WIDTH = USER_DATA_BYTES*8; 

logic [0:IP_ADDR_WIDTH-1]  accelerator_ip_address;
logic [0:MAC_ADDR_WIDTH-1] accelerator_mac_address;
logic [0:UDP_PORT_WIDTH-1] accelerator_udp_port;

logic [AXI_S_DATA_WIDTH-1:0]     mac_data_out;
logic                            mac_data_ready;
logic                            mac_data_valid;
logic                            mac_data_last;
logic                            mac_data_tuser;

//logic [0:DATA_FRAME_WIDTH-1]     data_frame;
logic [7:0] rx_data;
logic [9:0] rx_addr;
logic       rx_en;
logic [0:IP_ADDR_WIDTH-1]        src_ip_address;
logic [0:MAC_ADDR_WIDTH-1]       src_mac_address;
logic [0:UDP_PORT_WIDTH-1]       src_udp_port;

logic [0:IP_ADDR_WIDTH-1]        src_ip_address_nn;
logic [0:MAC_ADDR_WIDTH-1]       src_mac_address_nn;
logic [0:UDP_PORT_WIDTH-1]       src_udp_port_nn;

logic [0:IP_ADDR_WIDTH-1]        src_ip_address_nn_out;
logic [0:MAC_ADDR_WIDTH-1]       src_mac_address_nn_out;
logic [0:UDP_PORT_WIDTH-1]       src_udp_port_nn_out;

logic [9:0] nn_out;

logic [9:0]                      w_addr;
logic signed [17:0]                     w_data [0:0];
logic                            w_en;
logic                            w_done;
logic                            nn_done;

logic                            frame_ready;
logic                            packet_for_accelerator;

logic[0:ETH_HDR_SIZE_BYTES*8-1] eth_header;
logic[0:IP_HDR_SIZE_BYTES*8-1]  ip_header; 
logic[0:UDP_HDR_SIZE_BYTES*8-1]  udp_header; 


initial begin
    accelerator_ip_address = 32'h01_01_02_02;
    accelerator_mac_address = 48'h010203040506;
    accelerator_udp_port    = 16'h66_99;
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
    // src, dst, length, checksum
    udp_header = 'h1122_6699_0319_0000;
    // Case 1: Happy path
    $display("Case 1:");
    test_rx(eth_header, ip_header, udp_header, USER_DATA_BYTES,    'h01, 1, 0, 0, 0, 0);
    // Case 2: Test packet slighly too small + recovery
    $display("Case 2:");
    test_rx(eth_header, ip_header, udp_header, USER_DATA_BYTES-20, 'h02, 0, 0, 0, 0, 0);
    test_rx(eth_header, ip_header, udp_header, USER_DATA_BYTES,    'h02, 1, 0, 0, 0, 0);  
    // Case 3: Test packet way too small + recovery
    $display("Case 3:");
    test_rx(eth_header, ip_header, udp_header, USER_DATA_BYTES-1,  'h03, 0, 0, 0, 0, 0);
    test_rx(eth_header, ip_header, udp_header, USER_DATA_BYTES,    'h03, 1, 0, 0, 0, 0);
    // Case 4: Test packet slightly too big + recovery
    $display("Case 4:");
    test_rx(eth_header, ip_header, udp_header, USER_DATA_BYTES+1,  'h04, 0, 0, 0, 0, 0);
    test_rx(eth_header, ip_header, udp_header, USER_DATA_BYTES,    'h04, 1, 0, 0, 0, 0); 
    // Case 5: Test packet way too big + recovery
    $display("Case 5:");
    test_rx(eth_header, ip_header, udp_header, USER_DATA_BYTES+20, 'h05, 0, 0, 0, 0, 0);
    test_rx(eth_header, ip_header, udp_header, USER_DATA_BYTES,    'h05, 1, 0, 0, 0, 0);
    // Case 6: Corrupted packet (t_user goes high at end of stream) + recovery
    $display("Case 6:");
    test_rx(eth_header, ip_header, udp_header, USER_DATA_BYTES,    'h06, 0, 1, 0, 0, 0);
    test_rx(eth_header, ip_header, udp_header, USER_DATA_BYTES,    'h06, 1, 0, 0, 0, 0);
    // Case 7: Bad ip address
    $display("Case 7:");
    ip_header[16*8:20*8-1] = 'heeeeeeee;
    test_rx(eth_header, ip_header, udp_header, USER_DATA_BYTES,    'h07, 0, 0, 0, 0, 0);
    ip_header[16*8:20*8-1] = 'h01_01_02_02;
    test_rx(eth_header, ip_header, udp_header, USER_DATA_BYTES,    'h07, 1, 0, 0, 0, 0);
    // Case 8: Early frame termination in eth header + recovery
    $display("Case 8:");
    test_rx(eth_header, ip_header, udp_header, USER_DATA_BYTES,    'h08, 0, 0, 1, 0, 0);
    test_rx(eth_header, ip_header, udp_header, USER_DATA_BYTES,    'h08, 1, 0, 0, 0, 0);
    // Case 9: Early frame termination in ip header + recovery
    $display("Case 9:");
    test_rx(eth_header, ip_header, udp_header, USER_DATA_BYTES,    'h09, 0, 0, 0, 1, 0);
    test_rx(eth_header, ip_header, udp_header, USER_DATA_BYTES,    'h09, 1, 0, 0, 0, 0);
    // Case 10: Early frame termination in udp header + recovery
    $display("Case 10:");
    test_rx(eth_header, ip_header, udp_header, USER_DATA_BYTES,    'h09, 0, 0, 0, 0, 1);
    test_rx(eth_header, ip_header, udp_header, USER_DATA_BYTES,    'h09, 1, 0, 0, 0, 0);
    
    //#10000;
    $finish();
    
end

task test_rx (
    input logic[0:ETH_HDR_SIZE_BYTES*8-1] eth_header,
    input logic[0:IP_HDR_SIZE_BYTES*8-1]  ip_header,
    input logic[0:UDP_HDR_SIZE_BYTES*8-1] udp_header,
    input int                             user_data_size_bytes, 
    input logic[7:0]                      byte_fill,
    input int                             happy_path,
    input int                             bad_fcs,
    input int                             end_frame_early_eth,
    input int                             end_frame_early_ip,
    input int                             end_frame_early_udp
); 
    int unsigned expected_eth_reg[$];
    int unsigned expected_ip_reg[$];
    int unsigned expected_udp_reg[$];
    int unsigned expected_data_reg[$];
    
    int unsigned axi_stream[$];
    
    axi_stream = {};
    expected_eth_reg = {};
    expected_data_reg = {};
    expected_ip_reg = {};
    expected_udp_reg = {};

    for (int i = 0; i < ETH_HDR_SIZE_BYTES; i++) begin
        expected_eth_reg = {expected_eth_reg, eth_header[i*8+:8]};
    end
    for (int j = 0; j < IP_HDR_SIZE_BYTES; j++) begin
        expected_ip_reg = {expected_ip_reg, ip_header[j*8+:8]};
    end
    for (int k = 0; k < UDP_HDR_SIZE_BYTES; k++) begin
        expected_udp_reg = {expected_udp_reg, udp_header[k*8+:8]};
    end

    get_dummy_dataframe(expected_data_reg, user_data_size_bytes, byte_fill);
    
    get_data_stream(axi_stream, expected_eth_reg, expected_ip_reg, expected_udp_reg, expected_data_reg);
    if (end_frame_early_eth) begin
        axi_stream = {};
        get_dummy_dataframe(axi_stream, 13, 'hff);
    end
    if (end_frame_early_ip) begin
        axi_stream = {};
        get_dummy_dataframe(axi_stream, 14 + 19, 'hff);
    end
    if (end_frame_early_udp) begin
        axi_stream = {};
        get_dummy_dataframe(axi_stream, 14 + 20 + 7, 'hff);
    end

    $display("stream sizes: eth:%d data:%d ip:%d udp:%d, axi:%d", 
        expected_eth_reg.size, 
        expected_data_reg.size, 
        expected_ip_reg.size,
        expected_udp_reg.size, 
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
        assert(frame_ready == 'd1) else $stop("Frame should have signaled ready");
        assert(eth_header[6*8:12*8-1] == src_mac_address) else $stop("Bad src mac! %h, %h", eth_header[6*8:12*8-1], src_mac_address);
        $display("expected:%08x result:%08x", ip_header[12*8:16*8-1], src_ip_address);
        assert(ip_header[12*8:16*8-1] == src_ip_address) else $stop("Bad src ip! %h %h", ip_header[12*8:16*8-1], src_ip_address);
        assert(udp_header[0:2*8-1] == src_udp_port) else $stop("Bad src port! %h %h", udp_header[0:2*8-1], src_udp_port);

        /*
        for (int i = 0; i < user_data_size_bytes; i++) begin
            assert(data_frame[i*8+:8] == expected_data_reg[i]) else $stop("Bad user data!");
        end
        */
    end
    else begin
         assert(frame_ready == 'd0) else $stop("Frame should not have signaled ready");
    end

    if (happy_path) begin
        @(posedge w_done);
        $display("Glue logic done processing frame sending to NN");
        @(posedge nn_done);
        $display("Neural Net is done processing a frame!");
        $display("NN output %b", nn_out);
    end
    #100;
endtask


task get_data_stream (
    output int unsigned data_frame[$],
    input  int unsigned expected_eth_frame[$],
    input  int unsigned expected_ip_frame[$],
    input  int unsigned expected_udp_frame[$],
    input  int unsigned expected_data_frame[$]

);
    data_frame = {};
    append_list_to_queue(data_frame, data_frame, expected_eth_frame);
    append_list_to_queue(data_frame, data_frame, expected_ip_frame);
    append_list_to_queue(data_frame, data_frame, expected_udp_frame);
    append_list_to_queue(data_frame, data_frame, expected_data_frame);
endtask

task get_dummy_dataframe (
    output int unsigned data_frame[$],
    input int size,
    input logic [7:0] byte_fill
);
    int unsigned k;
    data_frame = {};
    /*
    for (int i = 0; i < size; i++) begin
        k = byte_fill;
        if (i % 2 == 0) begin
            data_frame = {data_frame, byte_fill};
        end
        else begin
            data_frame = {data_frame, i % 256  };
        end
    end
    */
     data_frame = {8'b00000000,8'b00000000,8'b00000000,8'b00000000,8'b00000000,8'b00000000,8'b00000000,8'b00000000,8'b00000000,8'b00000000,8'b00000000,8'b00000000,8'b00000000,8'b00000000,8'b00000000,8'b00000000,8'b00000000,8'b00000000,8'b00000000,8'b00000000,8'b00000000,8'b00000000,8'b00000000,8'b00000000,8'b00000000,8'b00000000,8'b00000000,8'b00000000,
                    8'b00000000,8'b00000000,8'b00000000,8'b00000000,8'b00000000,8'b00000000,8'b00000000,8'b00000000,8'b00000000,8'b00000000,8'b00000000,8'b00000000,8'b00000000,8'b00000000,8'b00000000,8'b00000000,8'b00000000,8'b00000000,8'b00000000,8'b00000000,8'b00000000,8'b00000000,8'b00000000,8'b00000000,8'b00000000,8'b00000000,8'b00000000,8'b00000000,
                    8'b00000000,8'b00000000,8'b00000000,8'b00000000,8'b00000000,8'b00000000,8'b00000000,8'b00000000,8'b00000000,8'b00000000,8'b00000000,8'b00000000,8'b00000000,8'b00000000,8'b00000000,8'b00000000,8'b00000000,8'b00000000,8'b00000000,8'b00000000,8'b00000000,8'b00000000,8'b00000000,8'b00000000,8'b00000000,8'b00000000,8'b00000000,8'b00000000,
                    8'b00000000,8'b00000000,8'b00000000,8'b00000000,8'b00000000,8'b00000000,8'b00000000,8'b00000000,8'b00000000,8'b00000000,8'b00000000,8'b00000000,8'b00000000,8'b00000000,8'b00000000,8'b00000000,8'b00000000,8'b00000000,8'b00000000,8'b00000000,8'b00000000,8'b00000000,8'b00000000,8'b00000000,8'b00000000,8'b00000000,8'b00000000,8'b00000000,
                    8'b00000000,8'b00000000,8'b00000000,8'b00000000,8'b00000000,8'b00000000,8'b00000000,8'b00000000,8'b00000000,8'b00000000,8'b00000000,8'b00000000,8'b00000000,8'b00000000,8'b00000000,8'b00000000,8'b00000000,8'b00000000,8'b00000000,8'b00000000,8'b00000000,8'b00000000,8'b00000000,8'b00000000,8'b00000000,8'b00000000,8'b00000000,8'b00000000,
                    8'b00000000,8'b00000000,8'b00000000,8'b00000000,8'b00000000,8'b00000000,8'b00000000,8'b00000000,8'b00000000,8'b00000000,8'b00000000,8'b00000000,8'b00000100,8'b00101011,8'b00101011,8'b01101001,8'b10010100,8'b11110110,8'b11111110,8'b10010011,8'b00000000,8'b00000000,8'b00000000,8'b00000000,8'b00000000,8'b00000000,8'b00000000,8'b00000000,
                    8'b00000000,8'b00000000,8'b00000000,8'b00000000,8'b00000000,8'b00000000,8'b00000000,8'b00000000,8'b00000000,8'b00000000,8'b00000000,8'b00011101,8'b10111011,8'b11111101,8'b11111101,8'b11111110,8'b11111101,8'b11111101,8'b11111101,8'b11100011,8'b00000000,8'b00000000,8'b00000000,8'b00000000,8'b00000000,8'b00000000,8'b00000000,8'b00000000,
                    8'b00000000,8'b00000000,8'b00000000,8'b00000000,8'b00000000,8'b00000000,8'b00000000,8'b00000000,8'b00000000,8'b00000000,8'b01011101,8'b11110000,8'b11111101,8'b11111101,8'b11111101,8'b11111110,8'b11111101,8'b11111101,8'b11111101,8'b11111101,8'b01011001,8'b00000000,8'b00000000,8'b00000000,8'b00000000,8'b00000000,8'b00000000,8'b00000000,
                    8'b00000000,8'b00000000,8'b00000000,8'b00000000,8'b00000000,8'b00000000,8'b00000000,8'b00000000,8'b00000000,8'b00000000,8'b10101110,8'b11111101,8'b11111101,8'b11111101,8'b11111101,8'b11111110,8'b11111101,8'b11111101,8'b11111101,8'b10110110,8'b00000000,8'b00000000,8'b00000000,8'b00000000,8'b00000000,8'b00000000,8'b00000000,8'b00000000,
                    8'b00000000,8'b00000000,8'b00000000,8'b00000000,8'b00000000,8'b00000000,8'b00000000,8'b00000000,8'b00000000,8'b01011001,8'b11111110,8'b11111101,8'b11110101,8'b10010011,8'b01100111,8'b01111010,8'b11111101,8'b11111101,8'b10011011,8'b00011000,8'b00000000,8'b00000000,8'b00000000,8'b00000000,8'b00000000,8'b00000000,8'b00000000,8'b00000000,
                    8'b00000000,8'b00000000,8'b00000000,8'b00000000,8'b00000000,8'b00000000,8'b00000000,8'b00000000,8'b00000000,8'b01011001,8'b00000000,8'b11111110,8'b01000001,8'b00000000,8'b00010010,8'b11010010,8'b11111110,8'b11010110,8'b00000000,8'b00000000,8'b00000000,8'b00000000,8'b00000000,8'b00000000,8'b00000000,8'b00000000,8'b00000000,8'b00000000,
                    8'b00000000,8'b00000000,8'b00000000,8'b00000000,8'b00000000,8'b00000000,8'b00000000,8'b00000000,8'b00000000,8'b00000000,8'b10101110,8'b11111101,8'b00111000,8'b00000000,8'b01101010,8'b11111110,8'b11111101,8'b00101111,8'b00000000,8'b00000000,8'b00000000,8'b00000000,8'b00000000,8'b00000000,8'b00000000,8'b00000000,8'b00000000,8'b00000000,
                    8'b00000000,8'b00000000,8'b00000000,8'b00000000,8'b00000000,8'b00000000,8'b00000000,8'b00000000,8'b00000000,8'b00000000,8'b10001011,8'b11111101,8'b11101010,8'b00111001,8'b10100010,8'b11111110,8'b01111010,8'b00000010,8'b00000000,8'b00000000,8'b00000000,8'b00000000,8'b00000000,8'b00000000,8'b00000000,8'b00000000,8'b00000000,8'b00000000,
                    8'b00000000,8'b00000000,8'b00000000,8'b00000000,8'b00000000,8'b00000000,8'b00000000,8'b00000000,8'b00000000,8'b00000000,8'b00100000,8'b11101110,8'b11111101,8'b11111101,8'b11111101,8'b11100010,8'b00010101,8'b00000000,8'b00000000,8'b00000000,8'b00000000,8'b00000000,8'b00000000,8'b00000000,8'b00000000,8'b00000000,8'b00000000,8'b00000000,
                    8'b00000000,8'b00000000,8'b00000000,8'b00000000,8'b00000000,8'b00000000,8'b00000000,8'b00000000,8'b00000000,8'b00000000,8'b00000000,8'b01100110,8'b11111101,8'b11111101,8'b11111101,8'b10100111,8'b00000000,8'b00000000,8'b00000000,8'b00000000,8'b00000000,8'b00000000,8'b00000000,8'b00000000,8'b00000000,8'b00000000,8'b00000000,8'b00000000,
                    8'b00000000,8'b00000000,8'b00000000,8'b00000000,8'b00000000,8'b00000000,8'b00000000,8'b00000000,8'b00000000,8'b00000000,8'b00000000,8'b00000000,8'b11101010,8'b11111110,8'b11111110,8'b10101000,8'b00000000,8'b00000000,8'b00000000,8'b00000000,8'b00000000,8'b00000000,8'b00000000,8'b00000000,8'b00000000,8'b00000000,8'b00000000,8'b00000000,
                    8'b00000000,8'b00000000,8'b00000000,8'b00000000,8'b00000000,8'b00000000,8'b00000000,8'b00000000,8'b00000000,8'b00000000,8'b00000000,8'b00011101,8'b11110000,8'b11111101,8'b11111101,8'b11110100,8'b00110000,8'b00000000,8'b00000000,8'b00000000,8'b00000000,8'b00000000,8'b00000000,8'b00000000,8'b00000000,8'b00000000,8'b00000000,8'b00000000,
                    8'b00000000,8'b00000000,8'b00000000,8'b00000000,8'b00000000,8'b00000000,8'b00000000,8'b00000000,8'b00000000,8'b00000000,8'b00000000,8'b10001001,8'b11111101,8'b11101111,8'b11110001,8'b11111110,8'b10100110,8'b00000010,8'b00000000,8'b00000000,8'b00000000,8'b00000000,8'b00000000,8'b00000000,8'b00000000,8'b00000000,8'b00000000,8'b00000000,
                    8'b00000000,8'b00000000,8'b00000000,8'b00000000,8'b00000000,8'b00000000,8'b00000000,8'b00000000,8'b00000000,8'b00000000,8'b00011101,8'b11101001,8'b11111101,8'b01010100,8'b01010000,8'b11100100,8'b11111101,8'b00010101,8'b00000000,8'b00000000,8'b00000000,8'b00000000,8'b00000000,8'b00000000,8'b00000000,8'b00000000,8'b00000000,8'b00000000,
                    8'b00000000,8'b00000000,8'b00000000,8'b00000000,8'b00000000,8'b00000000,8'b00000000,8'b00000000,8'b00000000,8'b00000000,8'b00101011,8'b11111101,8'b11101100,8'b00001110,8'b00000000,8'b10010100,8'b11111101,8'b00010101,8'b00000000,8'b00000000,8'b00000000,8'b00000000,8'b00000000,8'b00000000,8'b00000000,8'b00000000,8'b00000000,8'b00000000,
                    8'b00000000,8'b00000000,8'b00000000,8'b00000000,8'b00000000,8'b00000000,8'b00000000,8'b00000000,8'b00000000,8'b00000000,8'b01010111,8'b11111110,8'b11101101,8'b00001110,8'b00000000,8'b10010100,8'b11111110,8'b00010101,8'b00000000,8'b00000000,8'b00000000,8'b00000000,8'b00000000,8'b00000000,8'b00000000,8'b00000000,8'b00000000,8'b00000000,
                    8'b00000000,8'b00000000,8'b00000000,8'b00000000,8'b00000000,8'b00000000,8'b00000000,8'b00000000,8'b00000000,8'b00000000,8'b00101011,8'b11111101,8'b11111101,8'b10001100,8'b10000000,8'b11100100,8'b11111101,8'b01100100,8'b00000000,8'b00000000,8'b00000000,8'b00000000,8'b00000000,8'b00000000,8'b00000000,8'b00000000,8'b00000000,8'b00000000,
                    8'b00000000,8'b00000000,8'b00000000,8'b00000000,8'b00000000,8'b00000000,8'b00000000,8'b00000000,8'b00000000,8'b00000000,8'b00010110,8'b11010100,8'b11111101,8'b11111101,8'b11111101,8'b11111110,8'b11111101,8'b01110110,8'b00000000,8'b00000000,8'b00000000,8'b00000000,8'b00000000,8'b00000000,8'b00000000,8'b00000000,8'b00000000,8'b00000000,
                    8'b00000000,8'b00000000,8'b00000000,8'b00000000,8'b00000000,8'b00000000,8'b00000000,8'b00000000,8'b00000000,8'b00000000,8'b00000000,8'b01010101,8'b11111101,8'b11111101,8'b11111101,8'b11111110,8'b11111101,8'b00010101,8'b00000000,8'b00000000,8'b00000000,8'b00000000,8'b00000000,8'b00000000,8'b00000000,8'b00000000,8'b00000000,8'b00000000,
                    8'b00000000,8'b00000000,8'b00000000,8'b00000000,8'b00000000,8'b00000000,8'b00000000,8'b00000000,8'b00000000,8'b00000000,8'b00000000,8'b00001110,8'b10010011,8'b11111101,8'b11111101,8'b11111110,8'b10001001,8'b00000100,8'b00000000,8'b00000000,8'b00000000,8'b00000000,8'b00000000,8'b00000000,8'b00000000,8'b00000000,8'b00000000,8'b00000000,
                    8'b00000000,8'b00000000,8'b00000000,8'b00000000,8'b00000000,8'b00000000,8'b00000000,8'b00000000,8'b00000000,8'b00000000,8'b00000000,8'b00000000,8'b00000000,8'b00000000,8'b00000000,8'b00000000,8'b00000000,8'b00000000,8'b00000000,8'b00000000,8'b00000000,8'b00000000,8'b00000000,8'b00000000,8'b00000000,8'b00000000,8'b00000000,8'b00000000,
                    8'b00000000,8'b00000000,8'b00000000,8'b00000000,8'b00000000,8'b00000000,8'b00000000,8'b00000000,8'b00000000,8'b00000000,8'b00000000,8'b00000000,8'b00000000,8'b00000000,8'b00000000,8'b00000000,8'b00000000,8'b00000000,8'b00000000,8'b00000000,8'b00000000,8'b00000000,8'b00000000,8'b00000000,8'b00000000,8'b00000000,8'b00000000,8'b00000000,
                    8'b00000000,8'b00000000,8'b00000000,8'b00000000,8'b00000000,8'b00000000,8'b00000000,8'b00000000,8'b00000000,8'b00000000,8'b00000000,8'b00000000,8'b00000000,8'b00000000,8'b00000000,8'b00000000,8'b00000000,8'b00000000,8'b00000000,8'b00000000,8'b00000000,8'b00000000,8'b00000000,8'b00000000,8'b00000000,8'b00000000,8'b00000000,8'b00000000
    };
    assert(data_frame.size() == 784);
    if (size != USER_DATA_BYTES) begin
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
    end
    assert(data_frame.size() == size);
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
)dut1 (
    .ACLK(aclk),
    .ARESET(areset),
    .ACCELERATOR_IP_ADDRESS(accelerator_ip_address),
    .ACCELERATOR_MAC_ADDRESS(accelerator_mac_address),
    .ACCELERATOR_UDP_PORT(accelerator_udp_port),
    .MAC_DATA_OUT(mac_data_out),
    .MAC_DATA_READY(mac_data_ready),
    .MAC_DATA_VALID(mac_data_valid),
    .MAC_DATA_LAST(mac_data_last),
    .MAC_DATA_TUSER(mac_data_tuser),
    //.DATA_FRAME(data_frame),
    
    .RX_DATA(rx_data),
    .RX_ADDR(rx_addr),
    .RX_EN(rx_en),
    .SRC_IP_ADDRESS(src_ip_address),
    .SRC_MAC_ADDRESS(src_mac_address),
    .SRC_UDP_PORT(src_udp_port),
    .FRAME_READY(frame_ready),
    .PACKET_FOR_ACCELERATOR(packet_for_accelerator)
);

buff_ip_to_nn #(
    .USER_DATA_BYTES(USER_DATA_BYTES)
) dut2 (
    .ACLK(aclk),
    .ARESET(areset),
    
    //.DATA_FRAME_IP(data_frame),
    .RX_DATA(rx_data),
    .RX_ADDR(rx_addr),
    .RX_EN(rx_en),
    .SRC_IP_ADDRESS_IP(src_ip_address),
    .SRC_MAC_ADDRESS_IP(src_mac_address),
    .SRC_UDP_PORT_IP(src_udp_port),
    .FRAME_READY(frame_ready),
   
    .SRC_IP_ADDRESS_NN(src_ip_address_nn),
    .SRC_MAC_ADDRESS_NN(src_mac_address_nn),
    .SRC_UDP_PORT_NN(src_udp_port_nn),
    .W_DATA(w_data),
    .W_EN(w_en),
    .W_ADDR(w_addr),
    .W_DONE(w_done)   
 );
 
 MNIST_Solver dut3(
    // Control signals
    .clock(aclk),
    .reset_n(areset),
    .start(w_done),
    .done(nn_done),
    
    // Input data, i.e. write to the first ibuf
    .w_addr(w_addr),
    .w_data(w_data),
    .w_en(w_en),
    
    // IP stuff
    .SRC_IP_ADDRESS(src_ip_address_nn),
    .SRC_MAC_ADDRESS(src_mac_address_nn),
    .SRC_UDP_PORT(src_udp_port_nn),
    
    .IP_ADDRESS_OUT(src_ip_address_nn_out),
    .MAC_ADDRESS_OUT(src_mac_address_nn_out),
    .UDP_PORT_OUT(src_udp_port_nn_out),
    
    // Output data
    .out(nn_out)
);

endmodule
