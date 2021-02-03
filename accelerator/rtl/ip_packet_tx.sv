/** @brief  Module packages a result from the accelerator internals to send to
  *         the MAC. Based on the VHDL core found from this repo:
  *         https://github.com/freecores/udp_ip_stack/blob/master/rtl/vhdl/IPv4_TX.vhd
  * @author Quinn Smith
  */

module ip_packet_tx (
    // Global signals
    input        aclk,
    input        areset,
    input [31:0] accelerator_ip_address,
    input [47:0] accelerator_mac_address,

    // Signals interfacing with accelerator
    input [31:0] recipient_ip_address,
    input [47:0] recipient_mac_address,
    input [9:0]  recipient_message, // Either a response to LB or an inference result
    input        start_ip_txn,
    output       ready_for_send,

    // Signals interfacing with MAC
    output [7:0] mac_data_out,
    input        mac_data_ready,
    output       mac_data_valid,
    output       mac_data_last,
    output       mac_data_first
);

    parameter AXI_S_DATA_WIDTH = 8;
    parameter IP_ADDR_WIDTH = 32;
    parameter MAC_ADDR_WIDTH = 48;
    parameter ACCEL_DATA_WIDTH = 10;

    // List of FSM states
    enum int unsigned {
        IDLE,          // No transation IPR
        WAIT_MAC,      // Waiting for MAC to be ready
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
    logic [IP_ADDR_WIDTH-1:0]    recipient_ip_address_internal;
    logic [MAC_ADDR_WIDTH-1:0]   recipient_mac_address_internal;
    logic [ACCEL_DATA_WIDTH-1:0] recipient_message_internal;
    logic                        start_ip_txn_internal;
    logic                        ready_for_send_internal;
    logic [AXI_S_DATA_WIDTH-1:0] mac_data_out_internal;
    logic                        mac_data_ready_internal;
    logic                        mac_data_valid_internal;
    logic                        mac_data_last_internal;
    logic                        mac_data_first_internal;

    always_comb begin
        ready_for_send_internal = 'd0;

        mac_data_out_internal = 'd0;
        mac_data_valid_internal = 'd0;
        mac_data_last_internal = 'd0;
        mac_data_first_internal = 'd0;

    // TODO: impl logic :-)
    case(state)   
        IDLE: begin
            nextstate = state;
        end
    endcase
    end

    // Internal to external
    assign recipient_message_internal     = recipient_message;
    assign recipient_mac_address_internal = recipient_mac_address;
    assign start_ip_txn_internal          = start_ip_txn;
    assign ready_for_send                 = ready_for_send_internal;
    assign mac_data_out                   = mac_data_out_internal;
    assign mac_data_ready_internal        = mac_data_ready;
    assign mac_data_last                  = mac_data_last_internal;
    assign mac_data_first                 = mac_data_first;

endmodule
