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

    // Exposed signals
    logic [IP_ADDR_WIDTH-1:0]    accelerator_ip_address;
    logic [MAC_ADDR_WIDTH-1:0]   accelerator_mac_address;
       
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

    // Unexposed signals
    logic [7:0] state_counter;
    logic       state_counter_enable;
    logic       state_counter_reset;

    always_comb begin
        ready_for_send = 'd0;

        mac_data_out = 'd0;
        mac_data_valid = 'd0;
        mac_data_last = 'd0;
        mac_data_first = 'd0;
        
        state_counter_reset = 'd0;
        state_counter_enable = 'd0;

    // TODO: impl logic :-)
    case(state)
        IDLE: begin
            ready_for_send = mac_data_ready;
            state_counter_reset = 'd1;

            if (start_ip_txn
             && ready_for_send) begin
                 nextstate = SEND_ETH_HDR;
            end
        end
        SEND_ETH_HDR: begin
            ready_for_send = 'd0;
            nextstate = SEND_ETH_HDR;
            if (mac_data_ready == 'd1) begin
                mac_data_valid = 'd1;
                state_counter_enable = 'd1;
                case(state_counter)
                'h0: mac_data_out = recipient_mac_address[47:40];                 
                'h1: mac_data_out = recipient_mac_address[39:32];         
                'h2: mac_data_out = recipient_mac_address[31:24];            
                'h3: mac_data_out = recipient_mac_address[23:16];               
                'h4: mac_data_out = recipient_mac_address[15: 8];               
                'h5: mac_data_out = recipient_mac_address[ 8: 0];               
                'h6: mac_data_out = accelerator_mac_address[47:40];
                'h7: mac_data_out = accelerator_mac_address[39:32];
                'h8: mac_data_out = accelerator_mac_address[31:24];                
                'h9: mac_data_out = accelerator_mac_address[23:16];         
                'hA: mac_data_out = accelerator_mac_address[15: 8];            
                'hB: begin
                     mac_data_out = accelerator_mac_address[ 8: 0];
                     state_counter_reset = 'd1;
                     state_counter_enable = 'd0;
                     nextstate = SEND_IP_HDR;
                end               
                default: begin
                     // Flag error? We should never reach this.
                     mac_data_last = 'd1;
                     state_counter_reset = 'd1;
                     nextstate = IDLE;
                end
                endcase
            end
        end    
        SEND_IP_HDR: begin
            ready_for_send = 'd0;
            nextstate = SEND_IP_HDR;
            if(mac_data_ready == 'd1) begin
                mac_data_valid = 'd1;
                state_counter_enable = 'd1;
                case(state_counter)
                    'h00: mac_data_out = 'h45; // ip v4, 5 words in header
                    'h01: mac_data_out = 'h00; // service type
                    'h02: mac_data_out = 'hxx; // TODO total length upper 8 bits
                    'h03: mac_data_out = 'hxx; // total length lower 8 bits 
                    'h04: mac_data_out = 'h00; // identification
                    'h05: mac_data_out = 'h00; 
                    'h06: mac_data_out = 'h00; // flags and fragment offset
                    'h07: mac_data_out = 'h00; 
                    'h08: mac_data_out = 'h00; // TODO: TTL (time to live)
                    'h09: mac_data_out = 'h00; // TODO: protocol
                    'h0A: mac_data_out = 'h00; // TODO: header checksum
                    'h0B: mac_data_out = 'h00;
                    'h0C: mac_data_out = accelerator_ip_address[31:24];          
                    'h0D: mac_data_out = accelerator_ip_address[23:16];          
                    'h0E: mac_data_out = accelerator_ip_address[15:8];          
                    'h0F: mac_data_out = accelerator_ip_address[7:0];          
                    'h10: mac_data_out = recipient_ip_address[31:24];          
                    'h11: mac_data_out = recipient_ip_address[23:16];         
                    'h12: mac_data_out = recipient_ip_address[15:8];         
                    'h13: begin
                          mac_data_out = recipient_ip_address[7:0];
                          state_counter_reset = 'd1;
                          state_counter_enable = 'd0;
                          nextstate = SEND_USER_DATA;  
                    end
                    default: begin
                          // Flag error? We should never reach this.
                          mac_data_last = 'd1;
                          state_counter_reset = 'd1;
                          nextstate = IDLE;
                    end                
                endcase
            end
        end
        SEND_USER_DATA: begin
        end
    endcase
    end

    // Internal to external
    assign accelerator_ip_address  = ACCELERATOR_IP_ADDRESS;
    assign accelerator_mac_address = ACCELERATOR_MAC_ADDRESS;
    
    assign recipient_ip_address  = RECIPIENT_IP_ADDRESS;
    assign recipient_message     = RECIPIENT_MESSAGE;
    assign recipient_mac_address = RECIPIENT_MAC_ADDRESS;
    assign start_ip_txn          = START_IP_TXN;
    assign READY_FOR_SEND        = ready_for_send;
    assign MAC_DATA_OUT          = mac_data_out;
    assign mac_data_ready        = MAC_DATA_READY;
    assign MAC_DATA_LAST         = mac_data_last;
    assign MAC_DATA_FIRST        = mac_data_first;
    
    counter state_counter_business_logic (
        .CLK(aclk),
        .RESET(state_counter_reset),
        .ENABLE(state_counter_enable),
        .VALUE(state_counter_reset)
    );

endmodule

module counter #(parameter SIZE=8)(
          input              CLK,
          input              RESET,
          input              ENABLE,
          output  [SIZE-1:0] VALUE
       );
logic [SIZE-1:0] value;
always_ff @ (posedge CLK or posedge RESET) begin
    if (RESET) begin
        value <= 'd0;
    end
    else if (ENABLE) begin
        value <= value + 'd1;
    end
end

assign VALUE = value;
endmodule
