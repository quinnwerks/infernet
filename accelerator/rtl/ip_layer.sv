`timescale 1 ns / 1 ps
module ip_layer # (
    parameter USER_DATA_BYTES=785
)(
    // Globals
    input        ACLK,
    input        ARESET,
    input [ 0:31] ACCELERATOR_IP_ADDRESS,
    input [ 0:47] ACCELERATOR_MAC_ADDRESS,
    input [ 0:15] ACCELERATOR_UDP_PORT,

    // To/From FIFO/MAC:
    // data from the RX data path
    input [7:0]  RX_AXIS_TDATA,
    input        RX_AXIS_TVALID,
    input        RX_AXIS_TLAST,
    input        RX_AXIS_TUSER,
    output       RX_AXIS_TREADY,
    // data TO the TX data path
    output [7:0] TX_AXIS_TDATA,
    output       TX_AXIS_TVALID,
    output       TX_AXIS_TLAST,
    input        TX_AXIS_TREADY,
    
    // To/From NN Core   
    // Rx
    
    //output [0:USER_DATA_BYTES*8-1] DATA_FRAME,
    output [7:0] RX_DATA,
    output [9:0] RX_ADDR,
    output       RX_EN,
    output [0:31] SRC_IP_ADDRESS,
    output [0:47] SRC_MAC_ADDRESS,
    output [0:15] SRC_UDP_PORT,

    output             FRAME_READY,
    // Useful signals for debug
    output             PACKET_FOR_ACCELERATOR,
    
    // Tx
    input [0:31] RECIPIENT_IP_ADDRESS,
    input [0:47] RECIPIENT_MAC_ADDRESS,
    input [0:15] RECIPIENT_UDP_PORT,
    input [0:9]  RECIPIENT_MESSAGE, // Either a response to LB or an inference result
    input        START_IP_TXN,
    output       READY_FOR_SEND
);

    ip_packet_tx tx (
        // Globals
        .ACLK(ACLK),
        .ARESET(ARESET),
        .ACCELERATOR_IP_ADDRESS(ACCELERATOR_IP_ADDRESS),
        .ACCELERATOR_MAC_ADDRESS(ACCELERATOR_MAC_ADDRESS),
        .ACCELERATOR_UDP_PORT(ACCELERATOR_UDP_PORT),

        // From Accelerator
        .RECIPIENT_IP_ADDRESS(RECIPIENT_IP_ADDRESS),
        .RECIPIENT_MAC_ADDRESS(RECIPIENT_MAC_ADDRESS),
        .RECIPIENT_UDP_PORT(RECIPIENT_UDP_PORT),
        .RECIPIENT_MESSAGE(RECIPIENT_MESSAGE), // Either a response to LB or an inference result
        .START_IP_TXN(START_IP_TXN),
        .READY_FOR_SEND(READY_FOR_SEND),

        // To MAC
        .MAC_DATA_OUT(TX_AXIS_TDATA),
        .MAC_DATA_READY(TX_AXIS_TREADY),
        .MAC_DATA_VALID(TX_AXIS_TVALID),
        .MAC_DATA_LAST(TX_AXIS_TLAST),
        .MAC_DATA_TUSER()
    );
    
    ip_packet_rx #(
        .USER_DATA_BYTES(USER_DATA_BYTES)
    ) rx (
         // Globals
        .ACLK(ACLK),
        .ARESET(ARESET),
        .ACCELERATOR_IP_ADDRESS(ACCELERATOR_IP_ADDRESS),
        .ACCELERATOR_MAC_ADDRESS(ACCELERATOR_MAC_ADDRESS),
        .ACCELERATOR_UDP_PORT(ACCELERATOR_UDP_PORT),
        
        // From MAC
        .MAC_DATA_OUT(RX_AXIS_TDATA),
        .MAC_DATA_READY(RX_AXIS_TREADY),
        .MAC_DATA_VALID(RX_AXIS_TVALID),
        .MAC_DATA_LAST(RX_AXIS_TLAST),
        .MAC_DATA_TUSER(RX_AXIS_TUSER),
        
        // To Accelerator
        //.DATA_FRAME(DATA_FRAME),
        .RX_DATA(RX_DATA),
        .RX_ADDR(RX_ADDR),
        .RX_EN(RX_EN),
        .SRC_IP_ADDRESS(SRC_IP_ADDRESS),
        .SRC_MAC_ADDRESS(SRC_MAC_ADDRESS),
        .SRC_UDP_PORT(SRC_UDP_PORT),
        .FRAME_READY(FRAME_READY),
        .PACKET_FOR_ACCELERATOR(PACKET_FOR_ACCELERATOR)
    );


endmodule