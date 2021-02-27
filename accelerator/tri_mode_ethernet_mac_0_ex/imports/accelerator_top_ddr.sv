module accelerator_top_ddr #(
 parameter OUR_MAC_ADDRESS=48'h06_05_04_03_02_DA, // LITTLE ENDIAN
 parameter USER_DATA_BYTES=784, // SIZE OF MIN PAYLOAD
 parameter OUR_IP_ADDRESS=32'h14_13_12_11 // LITTLE ENDIAN
)(
    // SYS CLK
    input sys_clk,
    input reset,
    
    // ETH RMII
    input phy2rmii_crs_dv,
    input phy2rmii_rx_er,
    input [1:0] phy2rmii_rxd,
    output rmii2phy_tx_en,
    output rmii2phy_txd[1:0],
    
    // ETH MDIO
    inout         mdio,
    output        mdc,
    
    // ETH REF CLK
    output eth_ref_clk
);
// Inputs to design
// asynchronous reset
logic         glbl_rst;

// 200MHz clock input from board
logic         clk_in_p;
logic         clk_in_n;
// 125 MHz clock from MMCM
logic        gtx_clk_bufg_out;
logic        phy_resetn;

// MII Interface
logic [3:0]  mii_txd;
logic        mii_tx_en;
logic        mii_tx_er;
logic  [3:0]  mii_rxd;
logic         mii_rx_dv;
logic         mii_rx_er;
logic         mii_rx_clk;
logic         mii_tx_clk;

// Serialised statistics vectors
logic        tx_statistics_s;
logic        rx_statistics_s;

// Serialised Pause interface controls
logic         pause_req_s;

// Main example design controls
logic  [1:0]  mac_speed;
logic         update_speed;
//input         serial_command, // tied to pause_req_s
logic         config_board;
logic        serial_response;
logic         gen_tx_data;
logic         chk_tx_data;
logic         reset_error;
logic        frame_error;
logic        frame_errorn;
logic        activity_flash;
logic        activity_flashn;


// Constant signals. According to the sim tieing these off to zero is O.K.
assign config_board = 1'b0;
assign chk_tx_data = 1'b0;
assign gen_tx_data = 1'b0;
assign pause_req_s = 1'b0;


// VIO
// Things we need to do with the VIOs
// 1. Active high reset
// 2. Configure speed
// 3. Update Speed
accelerator_controls(
    .probe_out0(glbl_rst),
    .probe_out1(mac_speed),
    .probe_out2(update_speed)
);


// TODO: CLOCKING WIZARD
// 1. Generate 200 MHz dual clocks for design
// 2. Generate ref_clk for MII <-> RMII

// TODO: MII <-> RMII



// Instantiate design
  tri_mode_ethernet_mac_0_example_design #(
    .OUR_MAC_ADDRESS(OUR_MAC_ADDRESS),
    .OUR_IP_ADDRESS(OUR_IP_ADDRESS),
    .USER_DATA_BYTES(USER_DATA_BYTES)
  ) accelerator (
      // asynchronous reset
      .glbl_rst                   (glbl_rst),

      // 200MHz clock input from board
      .clk_in_p                   (clk_in_p),
      .clk_in_n                   (clk_in_n),
      // 125 MHz clock output from MMCM
      .gtx_clk_bufg_out           (gtx_clk_bufg_out),
      // This is an output !
      .phy_resetn                 (phy_resetn),


      // MII Interface
      //---------------
      .mii_txd                    (mii_txd),
      .mii_tx_en                  (mii_tx_en),
      .mii_tx_er                  (mii_tx_er),
      .mii_rxd                    (mii_rxd),
      .mii_rx_dv                  (mii_rx_dv),
      .mii_rx_er                  (mii_rx_er),
      .mii_rx_clk                 (mii_rx_clk),
      .mii_tx_clk                 (mii_tx_clk),

      // MDIO Interface
      //---------------
      .mdio                       (mdio),
      .mdc                        (mdc),

      // Serialised statistics vectors
      //------------------------------
      .tx_statistics_s            (tx_statistics_s),
      .rx_statistics_s            (rx_statistics_s),

      // Serialised Pause interface controls
      //------------------------------------
      .pause_req_s                (pause_req_s),

      // Main example design controls
      //-----------------------------
      .mac_speed                  (mac_speed),
      .update_speed               (update_speed),
      .config_board               (config_board),
      .serial_response            (serial_response),
      .gen_tx_data                (gen_tx_data),
      .chk_tx_data                (chk_tx_data),
      .reset_error                (reset_error),
      .frame_error                (frame_error),
      .frame_errorn               (frame_errorn),
      .activity_flash             (activity_flash),
      .activity_flashn            (activity_flashn)
    );

endmodule