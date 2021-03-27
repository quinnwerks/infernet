module buff_ip_to_nn_tb();
localparam IP_ADDR_WIDTH = 32;
localparam MAC_ADDR_WIDTH = 48;
localparam UDP_PORT_WIDTH = 16;

localparam USER_DATA_BYTES = 784;  

logic [0:USER_DATA_BYTES*8-1]     data_frame;
logic [0:IP_ADDR_WIDTH-1]        src_ip_address_ip;
logic [0:MAC_ADDR_WIDTH-1]       src_mac_address_ip;
logic [0:UDP_PORT_WIDTH-1]       src_udp_port_ip;
logic                            frame_ready;
   
logic [0:IP_ADDR_WIDTH-1]        src_ip_address_nn;
logic [0:MAC_ADDR_WIDTH-1]       src_mac_address_nn;
logic [0:UDP_PORT_WIDTH-1]       src_udp_port_nn;
logic [4:0]                      w_row, w_col;
logic [17:0]                     w_data;
logic                            w_en;
logic                            w_done;

logic aclk;
initial aclk = 'd1;
always #5 aclk = ~aclk;

logic areset;

initial begin
    areset = 'd0;
    #100;
    areset = 'd1;
    #100;
    
    test_case(48'hde_ad_be_ef_b0_0b, 32'h01_02_03_04, 16'd666);
    #20;
    test_case(48'hbe_d1_be_cc_11_22, 32'h05_06_07_08, 16'd999);

end

task test_case (
    input logic[0:MAC_ADDR_WIDTH] mac_addr,
    input logic[0:IP_ADDR_WIDTH]  ip_addr,
    input logic[0:UDP_PORT_WIDTH] udp_port   
);
    int unsigned data_frame_golden[$];
    logic [17:0] expected_w_data;  

    // Deal with addressing
    src_mac_address_ip = mac_addr;
    src_ip_address_ip = ip_addr;
    src_udp_port_ip = udp_port;
  
    // Transform expected data frame into buff
    data_frame_golden = {};
    prepare_dataframe(data_frame_golden);
    for (int i = 0; i < USER_DATA_BYTES; i++) begin
        data_frame[i*8+:8] = data_frame_golden[i][7:0];
    end
    
    
    frame_ready = 1'b1;
    #10;
    frame_ready = 1'b0;
    #10;
    for (int i = 0; i < USER_DATA_BYTES; i++) begin
        assert(w_en == 1'b1) else $stop("w_en should be high");
        assert(w_row == i / 28) else $stop("w_row is incorrect");
        assert(w_col == i % 28) else $stop("w_col is incorrect");
        
        expected_w_data = {8'b0, data_frame_golden[i][7:0], 2'b0};
        assert(w_data == expected_w_data) else $error("w_data is incorrect");
        #10;
    end
    assert(w_en == 1'b0) else $stop("w_en should be low");
    assert(w_done == 1'b1) else $stop("w_done should be high");
    assert(w_row == 1'b0) else $stop("w_row is incorrect");
    assert(w_col == 1'b0) else $stop("w_col is incorrect");
    
    assert(src_mac_address_ip == src_mac_address_nn);
    assert(src_ip_address_ip == src_ip_address_nn);
    assert(src_udp_port_ip == src_udp_port_nn);

endtask

task prepare_dataframe (
    output int unsigned data_frame[$]
);
    int unsigned fill; 
    data_frame = {};
    for (int i = 0; i < USER_DATA_BYTES; i++) begin
        fill =  i % 27;
        data_frame = {data_frame, fill};
    end
    
endtask

buff_ip_to_nn #(
    .USER_DATA_BYTES(USER_DATA_BYTES)
) dut (
   .ACLK(aclk),
   .ARESET(areset),
   
   .DATA_FRAME_IP(data_frame),
   .SRC_IP_ADDRESS_IP(),
   .SRC_MAC_ADDRESS_IP(),
   .SRC_UDP_PORT_IP(),
   .FRAME_READY(frame_ready),

   .SRC_IP_ADDRESS_NN(src_ip_address_nn),
   .SRC_MAC_ADDRESS_NN(src_mac_address_nn),
   .SRC_UDP_PORT_NN(src_udp_port_nn),
   .W_DATA(w_data),
   .W_EN(w_en),
   .W_ROW(w_row),
   .W_COL(w_col),
   .W_DONE(w_done)   
);

endmodule