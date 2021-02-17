`timescale 1 ns / 1 ps
module ip_layer # (
    parameter USER_DATA_BYTES=785
)(
    // Globals
    input        ACLK,
    input        ARESET,
    input [31:0] ACCELERATOR_IP_ADDRESS,
    input [47:0] ACCELERATOR_MAC_ADDRESS,

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
    output [USER_DATA_BYTES*8-1:0] DATA_FRAME,
    output [31     :0] SRC_IP_ADDRESS,
    output [47     :0] SRC_MAC_ADDRESS,
    output             FRAME_READY,
    // Useful signals for debug
    output             PACKET_FOR_ACCELERATOR,
    
    // Tx
    input [31:0] RECIPIENT_IP_ADDRESS,
    input [47:0] RECIPIENT_MAC_ADDRESS,
    input [9:0]  RECIPIENT_MESSAGE, // Either a response to LB or an inference result
    input        START_IP_TXN,
    output       READY_FOR_SEND
);

    ip_packet_tx tx (
        // Globals
        .ACLK(ACLK),
        .ARESET(ARESET),
        .ACCELERATOR_IP_ADDRESS(ACCELERATOR_IP_ADDRESS),
        .ACCELERATOR_MAC_ADDRESS(ACCELERATOR_MAC_ADDRESS),

        // From Accelerator
        .RECIPIENT_IP_ADDRESS(RECIPIENT_IP_ADDRESS),
        .RECIPIENT_MAC_ADDRESS(RECIPIENT_MAC_ADDRESS),
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
        
        // From MAC
        .MAC_DATA_OUT(RX_AXIS_TDATA),
        .MAC_DATA_READY(RX_AXIS_TREADY),
        .MAC_DATA_VALID(RX_AXIS_TVALID),
        .MAC_DATA_LAST(RX_AXIS_TLAST),
        .MAC_DATA_TUSER(RX_AXIS_TUSER),
        
        // To Accelerator
        .DATA_FRAME(DATA_FRAME),
        .SRC_IP_ADDRESS(SRC_IP_ADDRESS),
        .SRC_MAC_ADDRESS(SRC_MAC_ADDRESS),
        .FRAME_READY(FRAME_READY),
        .PACKET_FOR_ACCELERATOR(PACKET_FOR_ACCELERATOR)
    );


endmodule