//------------------------------------------------------------------------------
// The module declaration for the example_design level wrapper.
//------------------------------------------------------------------------------

(* DowngradeIPIdentifiedWarnings = "yes" *)
module tri_mode_ethernet_mac_0_example_design_ddr
#  (
      parameter OUR_MAC_ADDRESS=48'h00_0a_35_00_00_06,
      //01_00_00_35_0a_00,
      parameter USER_DATA_BYTES=784, // SIZE OF MIN PACKET
      parameter OUR_IP_ADDRESS=32'h01_01_06_02,
      parameter OUR_UDP_PORT = 16'd0666,
      //02_01_01_01,
      parameter DUMMY_MAC_ADDRESS = 48'hAA_AA_AA_AA_AA_AA
)(
      // asynchronous reset
      //input         glbl_rst,

      // 100 MHz clk from system
      input         sys_clk,

      // 200MHz clock input from board
      //input         clk_in_p,
      //input         clk_in_n,
      // 125 MHz clock from MMCM
      //output        gtx_clk_bufg_out,

      //output        phy_resetn,


      // MII Interface
      //---------------
      input phy2rmii_crs_dv,
      input phy2rmii_rx_er,
      (* mark_debug = "true" *) input [1:0] phy2rmii_rxd,
      output rmii2phy_tx_en,
      output [1:0] rmii2phy_txd,
      
      // RMII Stuff
      //output rmii2phy_resetn,
      output rmii2phy_refclk,
      //output rmii2phy_int,
      
      /*
      output [3:0]  mii_txd,
      output        mii_tx_en,
      output        mii_tx_er,
      input  [3:0]  mii_rxd,
      input         mii_rx_dv,
      input         mii_rx_er,
      input         mii_rx_clk,
      input         mii_tx_clk,*/
      

      
      // MDIO Interface
      //---------------
      inout         mdio,
      output        mdc


      // Serialised statistics vectors
      //------------------------------
      //output        tx_statistics_s,
      //output        rx_statistics_s,

      // Serialised Pause interface controls
      //------------------------------------
      //input         pause_req_s,

      // Main example design controls
      //-----------------------------
      //input  [1:0]  mac_speed,
      //input         update_speed,
      //input         serial_command, // tied to pause_req_s
      //input         config_board,
      //output        serial_response,
      //input         gen_tx_data,
      //input         chk_tx_data,
      //input         reset_error,
      //output        frame_error,
      //output        frame_errorn,
      //output        activity_flash,
      //output        activity_flashn
    );
   // Do some stuff to convert it for the nexys DDR
   // Tie useless inputs to zero
   logic gtx_clk_bufg_out;
   logic phy_resetn;
   logic pause_req_s;
   
   logic tx_statistics_s;
   logic rx_statistics_s;
   
   logic serial_command;
   logic config_board;
   logic serial_response;
   logic gen_tx_data;
   logic chk_tx_data;
   logic reset_error;
   
   logic frame_error;
   logic frame_errorn;
   logic activity_flash;
   logic activity_flashn;
   
   assign pause_req_s = '0;
   
   assign serial_command = '0;
   assign config_board = '0;
   assign gen_tx_data = '0;
   assign chk_tx_data = '0;
   assign reset_error = '0;
   
   //logic         clk_in_p;
   //logic         clk_in_n;
   logic clk_mii_rmii_ref;
   logic clk_mii_rmii_ref45;
   assign rmii2phy_refclk = clk_mii_rmii_ref45;
   
   
   logic glbl_rst, glbl_rst_vio;
   logic [1:0] mac_speed, mac_speed_vio;
   logic update_speed, update_speed_vio;


   // MII Interface
   
   (* mark_debug = "true" *) logic [3:0]  mii_txd;
   (* mark_debug = "true" *) logic        mii_tx_en;
   (* mark_debug = "true" *) logic        mii_tx_er;
   (* mark_debug = "true" *) logic  [3:0]  mii_rxd;
   logic         mii_rx_dv;
   logic         mii_rx_er;
   logic         mii_rx_clk;
   logic         mii_tx_clk;
   
   mii_to_rmii_0 mii_to_rmii (
       .rst_n(phy_resetn),
       .ref_clk(clk_mii_rmii_ref),
       // MII
       .rmii2mac_col(),
       .rmii2mac_crs(),
       .rmii2mac_rx_clk(mii_rx_clk),
       .rmii2mac_rx_dv(mii_rx_dv),
       .rmii2mac_rx_er(mii_rx_er),
       .rmii2mac_rxd(mii_rxd),
       .rmii2mac_tx_clk(mii_tx_clk),
       .mac2rmii_tx_en(mii_tx_en),
       .mac2rmii_tx_er(mii_tx_er),
       .mac2rmii_txd(mii_txd),
       // RMII
       .phy2rmii_crs_dv(phy2rmii_crs_dv),
       .phy2rmii_rx_er(phy2rmii_rx_er),
       .phy2rmii_rxd(phy2rmii_rxd),
       .rmii2phy_tx_en(rmii2phy_tx_en),
       .rmii2phy_txd(rmii2phy_txd)
   );
   //----------------------------------------------------------------------------
   // internal signals used in this top level wrapper.
   //----------------------------------------------------------------------------

   // example design clocks
   wire                 gtx_clk_bufg;
   
   wire                 s_axi_aclk;
   wire                 rx_mac_aclk;
   wire                 tx_mac_aclk;
   // resets (and reset generation)
   wire                 s_axi_resetn;
   wire                 chk_resetn;
   
   wire                 gtx_resetn;
   
   wire                 rx_reset;
   wire                 tx_reset;

   wire                 dcm_locked;
   wire                 glbl_rst_intn;


   // USER side RX AXI-S interface
   wire                 rx_fifo_clock;
   wire                 rx_fifo_resetn;
   
   (* mark_debug = "true" *) wire  [7:0]          rx_axis_fifo_tdata;
   
    (* mark_debug = "true" *) wire                 rx_axis_fifo_tvalid;
    (* mark_debug = "true" *) wire                 rx_axis_fifo_tlast;
   wire                 rx_axis_fifo_tready;

   // USER side TX AXI-S interface
   wire                 tx_fifo_clock;
   wire                 tx_fifo_resetn;
   
   (* mark_debug = "true" *) wire  [7:0]          tx_axis_fifo_tdata;
   
   (* mark_debug = "true" *) wire                 tx_axis_fifo_tvalid;
   (* mark_debug = "true" *) wire                 tx_axis_fifo_tlast;
   (* mark_debug = "true" *) wire                 tx_axis_fifo_tready;

   // RX Statistics serialisation signals
   wire                 rx_statistics_valid;
   reg                  rx_statistics_valid_reg;
   wire  [27:0]         rx_statistics_vector;
   reg   [27:0]         rx_stats;
   reg   [29:0]         rx_stats_shift;
   reg                  rx_stats_toggle = 0;
   wire                 rx_stats_toggle_sync;
   reg                  rx_stats_toggle_sync_reg = 0;

   // TX Statistics serialisation signals
   wire                 tx_statistics_valid;
   reg                  tx_statistics_valid_reg;
   wire  [31:0]         tx_statistics_vector;
   reg   [31:0]         tx_stats;
   reg   [33:0]         tx_stats_shift;
   reg                  tx_stats_toggle = 0;
   wire                 tx_stats_toggle_sync;
   reg                  tx_stats_toggle_sync_reg = 0;

   // Pause interface DESerialisation
   reg   [18:0]         pause_shift;
   reg                  pause_req;
   reg   [15:0]         pause_val;

   // AXI-Lite interface
   wire  [11:0]         s_axi_awaddr;
   wire                 s_axi_awvalid;
   wire                 s_axi_awready;
   wire  [31:0]         s_axi_wdata;
   wire                 s_axi_wvalid;
   wire                 s_axi_wready;
   wire  [1:0]          s_axi_bresp;
   wire                 s_axi_bvalid;
   wire                 s_axi_bready;
   wire  [11:0]         s_axi_araddr;
   wire                 s_axi_arvalid;
   wire                 s_axi_arready;
   wire  [31:0]         s_axi_rdata;
   wire  [1:0]          s_axi_rresp;
   wire                 s_axi_rvalid;
   wire                 s_axi_rready;


   wire                 int_frame_error;
   wire                 int_activity_flash;

   // set board defaults - only updated when reprogrammed
   reg                  enable_address_swap = 1;
            
   reg                  enable_phy_loopback = 0;

   // signal tie offs
   wire  [7:0]          tx_ifg_delay = 0;    // not used in this example
   
   
   //wire [0:USER_DATA_BYTES*8-1] data_frame_from_rx;
   wire [7:0] rx_data_from_ip;
   wire [9:0] rx_addr_from_ip;
   wire       rx_en_from_ip;
   
   (* mark_debug = "true" *) wire                         frame_ready_from_rx;
   (* mark_debug = "true" *) wire [0:47]                  mac_address_from_rx;
   (* mark_debug = "true" *) wire [0:31]                  ip_address_from_rx;
   (* mark_debug = "true" *) wire [0:15]                  udp_port_from_rx;
   
   

   wire                         packet_for_accelerator_from_rx;
   
   wire [0:31]  ip_address_to_tx;
   wire [0:47]  mac_address_to_tx;
   wire [0:15]  udp_port_to_tx;
   (* mark_debug = "true" *) wire  [0:9]    recipient_message_to_tx; // Either a response to LB or an inference result
   (* mark_debug = "true" *) wire           start_ip_txn_to_tx;
   (* mark_debug = "true" *) wire           ready_for_send_to_tx;
   
   // mac address src/dst


   wire [0:31] our_ip_address;
   wire [0:47] our_mac_address;
   wire [0:15] our_udp_port;
   wire [0:47] dummy_mac_address;
   
   assign our_mac_address = OUR_MAC_ADDRESS;
   assign our_ip_address = OUR_IP_ADDRESS;
   assign our_udp_port = OUR_UDP_PORT;
   assign dummy_mac_address = DUMMY_MAC_ADDRESS;


   assign activity_flash  = int_activity_flash;
   assign activity_flashn = !int_activity_flash;


  assign frame_error  = int_frame_error;
  assign frame_errorn = !int_frame_error;
  
  // when the config_board button is pushed capture and hold the
  // state of the gne/chek tx_data inputs.  These values will persist until the
  // board is reprogrammed or config_board is pushed again
  always @(posedge gtx_clk_bufg)
  begin
     if (config_board) begin
        enable_address_swap   <= gen_tx_data;
     end
  end

            
  always @(posedge s_axi_aclk)
  begin
     if (config_board) begin
        enable_phy_loopback   <= chk_tx_data;
     end
  end

  //----------------------------------------------------------------------------
  // Clock logic to generate required clocks from the 200MHz on board
  // if 125MHz is available directly this can be removed
  //----------------------------------------------------------------------------
  
  /*
  tri_mode_ethernet_mac_0_example_design_clocks example_clocks
   (
      // differential clock inputs
      .clk_in_p         (clk_in_p),
      .clk_in_n         (clk_in_n),

      // asynchronous control/resets
      .glbl_rst         (glbl_rst),
      .dcm_locked       (dcm_locked),

      // clock outputs
      .gtx_clk_bufg     (gtx_clk_bufg),
      .s_axi_aclk       (s_axi_aclk)
   );
   */
   accelerator_controls vio(
    .clk(sys_clk),
    .probe_out0(glbl_rst)
    //.probe_out1(mac_speed_vio),
    //.probe_out2(update_speed_vio)
   );
   /*
   always @ (posedge sys_clk) begin
    glbl_rst <= glbl_rst_vio;
    mac_speed <= mac_speed_vio;
    update_speed <= update_speed_vio;
   end
   */
   
   assign mac_speed = 2'b00;
   assign update_speed = 1'b0;
   
   clk_wiz_0 clocking_wizard (
      // Inputs
      .reset(glbl_rst),
      .clk_in1(sys_clk),
      // Outputs
      .clk_out1(gtx_clk_bufg),
      // 50 MHz
      .clk_out2(clk_mii_rmii_ref),
      // 50 MHz 45-degrees shifted
      .clk_out3(clk_mii_rmii_ref45),
      .clk_out4(s_axi_aclk),
      .locked(dcm_locked)
   );

    // Pass the GTX clock to the Test Bench
   assign gtx_clk_bufg_out = gtx_clk_bufg;
   

  //----------------------------------------------------------------------------
  // Generate the user side clocks for the axi fifos
  //----------------------------------------------------------------------------
   
  assign tx_fifo_clock = gtx_clk_bufg;
  assign rx_fifo_clock = gtx_clk_bufg;
   

  //----------------------------------------------------------------------------
  // Generate resets required for the fifo side signals etc
  //----------------------------------------------------------------------------

   tri_mode_ethernet_mac_0_example_design_resets example_resets
   (      
      // clocks
      .s_axi_aclk       (s_axi_aclk),
      .gtx_clk          (gtx_clk_bufg),

      // asynchronous resets
      .glbl_rst         (glbl_rst),
      .reset_error      (reset_error),
      .rx_reset         (rx_reset),
      .tx_reset         (tx_reset),

      .dcm_locked       (dcm_locked),

      // synchronous reset outputs
  
      .glbl_rst_intn    (glbl_rst_intn),
   
   
      .gtx_resetn       (gtx_resetn),
   
      .s_axi_resetn     (s_axi_resetn),
      .phy_resetn       (phy_resetn),
      .chk_resetn       (chk_resetn)
   );


   // generate the user side resets for the axi fifos
   
   assign tx_fifo_resetn = gtx_resetn;
   assign rx_fifo_resetn = gtx_resetn;
   

  //----------------------------------------------------------------------------
  // Serialize the stats vectors
  // This is a single bit approach, retimed onto gtx_clk
  // this code is only present to prevent code being stripped..
  //----------------------------------------------------------------------------

  // RX STATS

  // first capture the stats on the appropriate clock
  always @(posedge rx_mac_aclk)
  begin
     rx_statistics_valid_reg <= rx_statistics_valid;
     if (!rx_statistics_valid_reg & rx_statistics_valid) begin
        rx_stats <= rx_statistics_vector;
        rx_stats_toggle <= !rx_stats_toggle;
     end
  end

  tri_mode_ethernet_mac_0_sync_block rx_stats_sync (
     .clk              (gtx_clk_bufg),
     .data_in          (rx_stats_toggle),
     .data_out         (rx_stats_toggle_sync)
  );

  always @(posedge gtx_clk_bufg)
  begin
     rx_stats_toggle_sync_reg <= rx_stats_toggle_sync;
  end

  // when an update is rxd load shifter (plus start/stop bit)
  // shifter always runs (no power concerns as this is an example design)
  always @(posedge gtx_clk_bufg)
  begin
     if (rx_stats_toggle_sync_reg != rx_stats_toggle_sync) begin
        rx_stats_shift <= {1'b1, rx_stats, 1'b1};
     end
     else begin
        rx_stats_shift <= {rx_stats_shift[28:0], 1'b0};
     end
  end

  assign rx_statistics_s = rx_stats_shift[29];

  // TX STATS

  // first capture the stats on the appropriate clock
  always @(posedge tx_mac_aclk)
  begin
     tx_statistics_valid_reg <= tx_statistics_valid;
     if (!tx_statistics_valid_reg & tx_statistics_valid) begin
        tx_stats <= tx_statistics_vector;
        tx_stats_toggle <= !tx_stats_toggle;
     end
  end

  tri_mode_ethernet_mac_0_sync_block tx_stats_sync (
     .clk              (gtx_clk_bufg),
     .data_in          (tx_stats_toggle),
     .data_out         (tx_stats_toggle_sync)
  );

  always @(posedge gtx_clk_bufg)
  begin
     tx_stats_toggle_sync_reg <= tx_stats_toggle_sync;
  end

  // when an update is txd load shifter (plus start bit)
  // shifter always runs (no power concerns as this is an example design)
  always @(posedge gtx_clk_bufg)
  begin
     if (tx_stats_toggle_sync_reg != tx_stats_toggle_sync) begin
        tx_stats_shift <= {1'b1, tx_stats, 1'b1};
     end
     else begin
        tx_stats_shift <= {tx_stats_shift[32:0], 1'b0};
     end
  end

  assign tx_statistics_s = tx_stats_shift[33];

  //----------------------------------------------------------------------------
  // DSerialize the Pause interface
  // This is a single bit approachtimed on gtx_clk
  // this code is only present to prevent code being stripped..
  //----------------------------------------------------------------------------
  // the serialised pause info has a start bit followed by the quanta and a stop bit
  // capture the quanta when the start bit hits the msb and the stop bit is in the lsb
  always @(posedge gtx_clk_bufg)
  begin
     pause_shift <= {pause_shift[17:0], pause_req_s};
  end

  always @(posedge gtx_clk_bufg)
  begin
     if (pause_shift[18] == 1'b0 & pause_shift[17] == 1'b1 & pause_shift[0] == 1'b1) begin
        pause_req <= 1'b1;
        pause_val <= pause_shift[16:1];
     end
     else begin
        pause_req <= 1'b0;
        pause_val <= 0;
     end
  end

  //----------------------------------------------------------------------------
  // Instantiate the AXI-LITE Controller
  //----------------------------------------------------------------------------

   tri_mode_ethernet_mac_0_axi_lite_sm axi_lite_controller (
      .s_axi_aclk                   (s_axi_aclk),
      .s_axi_resetn                 (s_axi_resetn),

      .mac_speed                    (mac_speed),
      .update_speed                 (update_speed),   // may need glitch protection on this..
      .serial_command               (pause_req_s),
      .serial_response              (serial_response),
            
      .phy_loopback                 (enable_phy_loopback),

      .s_axi_awaddr                 (s_axi_awaddr),
      .s_axi_awvalid                (s_axi_awvalid),
      .s_axi_awready                (s_axi_awready),

      .s_axi_wdata                  (s_axi_wdata),
      .s_axi_wvalid                 (s_axi_wvalid),
      .s_axi_wready                 (s_axi_wready),

      .s_axi_bresp                  (s_axi_bresp),
      .s_axi_bvalid                 (s_axi_bvalid),
      .s_axi_bready                 (s_axi_bready),

      .s_axi_araddr                 (s_axi_araddr),
      .s_axi_arvalid                (s_axi_arvalid),
      .s_axi_arready                (s_axi_arready),

      .s_axi_rdata                  (s_axi_rdata),
      .s_axi_rresp                  (s_axi_rresp),
      .s_axi_rvalid                 (s_axi_rvalid),
      .s_axi_rready                 (s_axi_rready),
      
      // mac addresses
      .src_mac_address(dummy_mac_address),
      .our_mac_address(our_mac_address)
   );

  //----------------------------------------------------------------------------
  // Instantiate the TRIMAC core fifo block wrapper
  //----------------------------------------------------------------------------
  tri_mode_ethernet_mac_0_fifo_block trimac_fifo_block (
      .gtx_clk                      (gtx_clk_bufg),
      
       
      // asynchronous reset
      .glbl_rstn                    (glbl_rst_intn),
      .rx_axi_rstn                  (1'b1),
      .tx_axi_rstn                  (1'b1),

      // Receiver Statistics Interface
      //---------------------------------------
      .rx_mac_aclk                  (rx_mac_aclk),
      .rx_reset                     (rx_reset),
      .rx_statistics_vector         (rx_statistics_vector),
      .rx_statistics_valid          (rx_statistics_valid),

      // Receiver (AXI-S) Interface
      //----------------------------------------
      .rx_fifo_clock                (rx_fifo_clock),
      .rx_fifo_resetn               (rx_fifo_resetn),
      .rx_axis_fifo_tdata           (rx_axis_fifo_tdata),
      .rx_axis_fifo_tvalid          (rx_axis_fifo_tvalid),
      .rx_axis_fifo_tready          (rx_axis_fifo_tready),
      .rx_axis_fifo_tlast           (rx_axis_fifo_tlast),
       
      // Transmitter Statistics Interface
      //------------------------------------------
      .tx_mac_aclk                  (tx_mac_aclk),
      .tx_reset                     (tx_reset),
      .tx_ifg_delay                 (tx_ifg_delay),
      .tx_statistics_vector         (tx_statistics_vector),
      .tx_statistics_valid          (tx_statistics_valid),

      // Transmitter (AXI-S) Interface
      //-------------------------------------------
      .tx_fifo_clock                (tx_fifo_clock),
      .tx_fifo_resetn               (tx_fifo_resetn),
      .tx_axis_fifo_tdata           (tx_axis_fifo_tdata),
      .tx_axis_fifo_tvalid          (tx_axis_fifo_tvalid),
      .tx_axis_fifo_tready          (tx_axis_fifo_tready),
      .tx_axis_fifo_tlast           (tx_axis_fifo_tlast),
       


      // MAC Control Interface
      //------------------------
      .pause_req                    (pause_req),
      .pause_val                    (pause_val),

      // MII Interface
      //---------------
      .mii_txd                      (mii_txd),
      .mii_tx_en                    (mii_tx_en),
      .mii_tx_er                    (mii_tx_er),
      .mii_rxd                      (mii_rxd),
      .mii_rx_dv                    (mii_rx_dv),
      .mii_rx_er                    (mii_rx_er),
      .mii_rx_clk                   (mii_rx_clk),
      .mii_tx_clk                   (mii_tx_clk),

      
      // MDIO Interface
      //---------------
      .mdio                         (mdio),
      .mdc                          (mdc),

      // AXI-Lite Interface
      //---------------
      .s_axi_aclk                   (s_axi_aclk),
      .s_axi_resetn                 (s_axi_resetn),

      .s_axi_awaddr                 (s_axi_awaddr),
      .s_axi_awvalid                (s_axi_awvalid),
      .s_axi_awready                (s_axi_awready),

      .s_axi_wdata                  (s_axi_wdata),
      .s_axi_wvalid                 (s_axi_wvalid),
      .s_axi_wready                 (s_axi_wready),

      .s_axi_bresp                  (s_axi_bresp),
      .s_axi_bvalid                 (s_axi_bvalid),
      .s_axi_bready                 (s_axi_bready),

      .s_axi_araddr                 (s_axi_araddr),
      .s_axi_arvalid                (s_axi_arvalid),
      .s_axi_arready                (s_axi_arready),

      .s_axi_rdata                  (s_axi_rdata),
      .s_axi_rresp                  (s_axi_rresp),
      .s_axi_rvalid                 (s_axi_rvalid),
      .s_axi_rready                 (s_axi_rready)

   );


  //----------------------------------------------------------------------------
  //  Instantiate the address swapping module and simple pattern generator
  //----------------------------------------------------------------------------
   /*
   tri_mode_ethernet_mac_0_basic_pat_gen basic_pat_gen_inst (
      .axi_tclk                     (tx_fifo_clock),
      .axi_tresetn                  (tx_fifo_resetn),
      .check_resetn                 (chk_resetn),

      .enable_pat_gen               (gen_tx_data),
      .enable_pat_chk               (chk_tx_data),
      .enable_address_swap          (enable_address_swap),
      .speed                        (mac_speed),

      .rx_axis_tdata                (rx_axis_fifo_tdata),
      .rx_axis_tvalid               (rx_axis_fifo_tvalid),
      .rx_axis_tlast                (rx_axis_fifo_tlast),
      .rx_axis_tuser                (1'b0), // the FIFO drops all bad frames
      .rx_axis_tready               (rx_axis_fifo_tready),

      .tx_axis_tdata                (tx_axis_fifo_tdata),
      .tx_axis_tvalid               (tx_axis_fifo_tvalid),
      .tx_axis_tlast                (tx_axis_fifo_tlast),
      .tx_axis_tready               (tx_axis_fifo_tready),

      .frame_error                  (int_frame_error),
      .activity_flash               (int_activity_flash)
   );*/
   
   
   ip_layer # (
      .USER_DATA_BYTES(USER_DATA_BYTES)
   )ip_layer_inst (
      .ACLK(tx_fifo_clock),
      .ARESET(tx_fifo_resetn),
      .ACCELERATOR_IP_ADDRESS(OUR_IP_ADDRESS),
      .ACCELERATOR_MAC_ADDRESS(OUR_MAC_ADDRESS),
      .ACCELERATOR_UDP_PORT(OUR_UDP_PORT),

      // To/From FIFO/MAC:
      // data from the RX data path
      .RX_AXIS_TDATA(rx_axis_fifo_tdata),
      .RX_AXIS_TVALID(rx_axis_fifo_tvalid),
      .RX_AXIS_TLAST(rx_axis_fifo_tlast),
      .RX_AXIS_TUSER(1'b0),
      .RX_AXIS_TREADY(rx_axis_fifo_tready),
        
      // data TO the TX data path
      .TX_AXIS_TDATA(tx_axis_fifo_tdata),
      .TX_AXIS_TVALID(tx_axis_fifo_tvalid),
      .TX_AXIS_TLAST(tx_axis_fifo_tlast),
      .TX_AXIS_TREADY(tx_axis_fifo_tready),
      
      // To/From NN Core   
      // Rx
      //.DATA_FRAME(data_frame_from_rx),
      .RX_DATA(rx_data_from_ip),
      .RX_ADDR(rx_addr_from_ip),
      .RX_EN(rx_en_from_ip),
      .SRC_IP_ADDRESS(ip_address_from_rx),
      .SRC_MAC_ADDRESS(mac_address_from_rx),
      .SRC_UDP_PORT(udp_port_from_rx),
      .FRAME_READY(frame_ready_from_rx),
      // Useful signals for debug
      .PACKET_FOR_ACCELERATOR(packet_for_accelerator_from_rx),
    
      // Tx
      .RECIPIENT_IP_ADDRESS(ip_address_to_tx),
      .RECIPIENT_MAC_ADDRESS(mac_address_to_tx),
      .RECIPIENT_UDP_PORT(udp_port_to_tx),
      .RECIPIENT_MESSAGE(recipient_message_to_tx), // Either a response to LB or an inference result
      
      .START_IP_TXN(start_ip_txn_to_tx),
      .READY_FOR_SEND(ready_for_send_to_tx)
   );
   assign int_frame_error = 1'b0;
   assign int_activity_flash = 1'b0;
   
   wire [0:31] ip_address_from_buff;
   wire [0:47] mac_address_from_buff;
   wire [0:15] udp_port_from_buff;
   wire w_en_from_buff;
   wire signed [17:0] w_data_from_buff;
   wire [9:0] w_addr_from_buff;
   wire w_done_from_buff;
   
   buff_ip_to_nn #(
    .USER_DATA_BYTES(USER_DATA_BYTES)
    ) ip_to_nn_buffer (
   .ACLK(tx_fifo_clock),
   .ARESET(tx_fifo_resetn),
   
   .RX_DATA(rx_data_from_ip),
   .RX_ADDR(rx_addr_from_ip),
   .RX_EN(rx_en_from_ip),
   .SRC_IP_ADDRESS_IP(ip_address_from_rx),
   .SRC_MAC_ADDRESS_IP(mac_address_from_rx),
   .SRC_UDP_PORT_IP(udp_port_from_rx),
   .FRAME_READY(frame_ready_from_rx),

   .SRC_IP_ADDRESS_NN(ip_address_from_buff),
   .SRC_MAC_ADDRESS_NN(mac_address_from_buff),
   .SRC_UDP_PORT_NN(udp_port_from_buff),
   .W_DATA(w_data_from_buff),
   .W_EN(w_en_from_buff),
   .W_ADDR(w_addr_from_buff),
   .W_DONE(w_done_from_buff)   
);

MNIST_Solver neural_net (
    // Control signals
   .clock(tx_fifo_clock),
   .reset_n(tx_fifo_resetn),
   .start(w_done_from_buff),
   .done(start_ip_txn_to_tx),
    
   // Input data, i.e. write to the first ibuf
   .w_addr(w_addr_from_buff),
   .w_data(w_data_from_buff),
   .w_en(w_en_from_buff),
    
   // IP stuff
   .SRC_IP_ADDRESS(ip_address_from_buff),
   .SRC_MAC_ADDRESS(mac_address_from_buff),
   .SRC_UDP_PORT(udp_port_from_buff),
    
   .IP_ADDRESS_OUT(ip_address_to_tx),
   .MAC_ADDRESS_OUT(mac_address_to_tx),
   .UDP_PORT_OUT(udp_port_to_tx),
    
   // Output data
   .out(recipient_message_to_tx)
);
   
   /*
   // Neural Network
   wire net_out_to_tx;
   XOR_NN nn(
    .clock(tx_fifo_clock),
    .reset_n(tx_fifo_resetn),
    .start(frame_ready_from_rx),
    .ip_address(ip_address_from_rx),
    .mac_address(mac_address_from_rx),
    .udp_port(udp_port_from_rx),
    .x(data_frame_from_rx[6]),
    .y(data_frame_from_rx[7]),
    .done(start_ip_txn_to_tx),
    .ip_out(ip_address_to_tx),
    .mac_out(mac_address_to_tx),
    .port_out(udp_port_to_tx),
    .out(net_out_to_tx)
   );
   assign recipient_message_to_tx = {9'd0, net_out_to_tx};
   */
   


endmodule

