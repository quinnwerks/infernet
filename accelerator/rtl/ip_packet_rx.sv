module ip_packet_rx(
    input            ACLK,
    input            ARESET,
    input [31:0]     ACCELERATOR_IP_ADDRESS,
    input [47:0]     ACCELERATOR_MAC_ADDRESS,
    
    // Interface with MAC
    input [7:0]      MAC_DATA_OUT,
    output           MAC_DATA_READY,
    input            MAC_DATA_VALID,
    input            MAC_DATA_LAST,
    
    // Interface with Accelerator
    output [785*8-1:0] DATA_FRAME,
    output [31     :0] SRC_IP_ADDRESS,
    output [47     :0] SRC_MAC_ADDRESS,
    output             FRAME_READY
);

localparam DATA_FRAME_WIDTH = 785*8; // 784 for inference frame + 1 byte for metadata
localparam IP_ADDR_WIDTH = 32;
localparam MAC_ADDR_WIDTH = 48;
localparam AXI_S_DATA_WIDTH = 8;

// List of FSM states
enum int unsigned {
    IDLE,          // No transation IPR
    GET_ETH_HDR,   // Process ethernet header
    GET_IP_HDR,    // Process ip header
    GET_USER_DATA, // Get user data
    WAIT_FOR_END   // State for ignoring the current packet
} state, nextstate;

// State logic
always_ff @ (posedge ACLK or negedge ARESET) begin
    if (ARESET == 'd0) begin
        state <= IDLE;
    end
    else begin
        state <= nextstate;
    end
end



// Exposed signals
logic [IP_ADDR_WIDTH-1:0]    accelerator_ip_address;
logic [MAC_ADDR_WIDTH-1:0]   accelerator_mac_address;

logic [AXI_S_DATA_WIDTH-1:0] mac_data_out;
logic                        mac_data_ready;
logic                        mac_data_valid;
logic                        mac_data_last;

logic [DATA_FRAME_WIDTH-1:0] data_frame;
logic [IP_ADDR_WIDTH-1:0]    src_ip_address;
logic [MAC_ADDR_WIDTH-1:0]   src_mac_address;
logic                        frame_ready;

// Internal to external
assign accelerator_ip_address  = ACCELERATOR_IP_ADDRESS;
assign accelerator_mac_address = ACCELERATOR_MAC_ADDRESS;

assign mac_data_out          = MAC_DATA_OUT;
assign MAC_DATA_READY        = mac_data_ready;
assign mac_data_valid        = MAC_DATA_VALID;
assign mac_data_last         = MAC_DATA_LAST;

assign DATA_FRAME            = data_frame;
assign SRC_IP_ADDRESS        = src_ip_address;
assign SRC_MAC_ADDRESS       = src_mac_address;

endmodule