/** @brief  Module packages a result from the accelerator internals to send to
  *         the MAC. Based on the VHDL core found from this repo:
  *         https://github.com/freecores/udp_ip_stack/blob/master/rtl/vhdl/IPv4_TX.vhd
  * @author Quinn Smith
  */

module ip_packet_tx (
    // Global signals
    input        aclk,
    input        areset,
    input [31:0] ACCELERATOR_IP_ADDRESS,
    input [47:0] ACCELERATOR_MAC_ADDRESS,

    // Signals interfacing with accelerator
    input [31:0] RECIPIENT_IP_ADDRESS,
    input [47:0] RECIPIENT_MAC_ADDRESS,
    input [9:0]  RECIPIENT_MESSAGE, // Either a response to LB or an inference result
    input        START_IP_TXN,
    output       READY_FOR_SEND,

    // Signals interfacing with MAC
    output [7:0] MAC_DATA_OUT,
    input        MAC_DATA_READY,
    output       MAC_DATA_VALID,
    output       MAC_DATA_LAST,
    output       MAC_DATA_FIRST
);

    parameter AXI_S_DATA_WIDTH = 8;
    parameter IP_ADDR_WIDTH = 32;
    parameter MAC_ADDR_WIDTH = 48;
    parameter ACCEL_DATA_WIDTH = 10;

    // List of FSM states
    enum int unsigned {
        IDLE,          // No transation IPR
        SEND_ETH_HDR,  // Send ethernet header
        SEND_IP_HDR,   // Send ip header
        SEND_USER_DATA // Send user data
    } state, nextstate;

    // State logic
    always_ff @ (posedge aclk or posedge areset) begin
        if (areset) begin
            state <= IDLE;
        end
        else begin
            state <= nextstate;
        end
    end

    // Internal signal logic
    logic [IP_ADDR_WIDTH-1:0]    recipient_ip_address;
    logic [MAC_ADDR_WIDTH-1:0]   recipient_mac_address;
    logic [ACCEL_DATA_WIDTH-1:0] recipient_message;
    logic                        start_ip_txn;
    logic                        ready_for_send;
    logic [AXI_S_DATA_WIDTH-1:0] mac_data_out;
    logic                        mac_data_ready;
    logic                        mac_data_valid;
    logic                        mac_data_last;
    logic                        mac_data_first;

    always_comb begin
        ready_for_send = 'd0;

        mac_data_out = 'd0;
        mac_data_valid = 'd0;
        mac_data_last = 'd0;
        mac_data_first = 'd0;

    // TODO: impl logic :-)
    case(state)
        IDLE: begin
            ready_for_send = mac_data_ready;

            if (start_ip_txn
             && ready_for_send) begin
                 nextstate = SEND_ETH_HDR;
            end
        end
        SEND_ETH_HDR: begin
            ready_for_send = 'd0;
            if (mac_data_ready == 'd1) begin
                mac_data_valid = 'd1;
            end
        end
    endcase
    end

    // Internal to external
    assign recipient_ip_address  = RECIPIENT_IP_ADDRESS;
    assign recipient_message     = RECIPIENT_MESSAGE;
    assign recipient_mac_address = RECIPIENT_MAC_ADDRESS;
    assign start_ip_txn          = START_IP_TXN;
    assign READY_FOR_SEND        = ready_for_send;
    assign MAC_DATA_OUT          = mac_data_out;
    assign mac_data_ready        = MAC_DATA_READY;
    assign MAC_DATA_LAST         = mac_data_last;
    assign MAC_DATA_FIRST        = mac_data_first;

endmodule
