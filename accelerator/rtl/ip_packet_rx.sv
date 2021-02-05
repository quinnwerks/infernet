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
    input            MAC_DATA_TUSER,
    
    // Interface with Accelerator
    output [785*8-1:0] DATA_FRAME,
    output [31     :0] SRC_IP_ADDRESS,
    output [47     :0] SRC_MAC_ADDRESS,
    output             FRAME_READY
);

localparam IP_ADDR_WIDTH = 32;
localparam MAC_ADDR_WIDTH = 48;
localparam AXI_S_DATA_WIDTH = 8;
localparam COUNTER_WIDTH = 16;

localparam ETH_HDR_SIZE_BYTES = 14;
localparam IP_HDR_SIZE_BYTES = 24;
localparam USER_DATA_BYTES = 785; // 784 for inference frame + 1 byte for metadata

localparam DATA_FRAME_WIDTH = USER_DATA_BYTES*8; 


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
logic [IP_ADDR_WIDTH-1:0]        accelerator_ip_address;
logic [MAC_ADDR_WIDTH-1:0]       accelerator_mac_address;

logic [AXI_S_DATA_WIDTH-1:0]     mac_data_out;
logic                            mac_data_ready;
logic                            mac_data_valid;
logic                            mac_data_last;
logic                            mac_data_tuser;

logic [DATA_FRAME_WIDTH-1:0]     data_frame;
logic [IP_ADDR_WIDTH-1:0]        src_ip_address;
logic [MAC_ADDR_WIDTH-1:0]       src_mac_address;
logic                            frame_ready;

// Unexposed signals
logic [IP_ADDR_WIDTH-1:0]        dst_ip_address;
logic [MAC_ADDR_WIDTH-1:0]       dst_mac_address;

logic [COUNTER_WIDTH-1:0]        state_counter;
logic                            state_counter_enable;
logic                            state_counter_reset;

logic [ETH_HDR_SIZE_BYTES*8-1:0] eth_header_data;
logic [IP_HDR_SIZE_BYTES*8-1 :0] ip_header_data;

logic                            eth_header_enable;
logic                            ip_header_enable;
logic                            data_frame_enable;

always_comb begin
    frame_ready = 'd0;
    mac_data_ready = 'd0;
    
    state_counter_enable = 'd0;
    state_counter_reset = 'd0;
        
    eth_header_enable = 'd0;
    ip_header_enable  = 'd0;
    data_frame_enable = 'd0;
    
    case(state)
    IDLE:begin
        state_counter_reset = 'd0;
        if (mac_data_valid == 'd1) begin
            nextstate = GET_ETH_HDR;
        end
    end
    GET_ETH_HDR:begin
        mac_data_ready = 'd1;
        if (mac_data_last == 'd1) begin
            state_counter_reset = 'd1;
            nextstate = IDLE;
        end
        else if (mac_data_valid == 'd1) begin
            state_counter_enable = 'd1;
            eth_header_enable = 'd1;
            case(state_counter)
            ETH_HDR_SIZE_BYTES-1: begin
                 nextstate = GET_IP_HDR;
                 state_counter_reset = 'd1;
            end 
            default: begin
            end
            endcase
        end
    end
    GET_IP_HDR:begin
        mac_data_ready = 'd1;
        if (mac_data_last == 'd1) begin
            state_counter_reset = 'd1;
            nextstate = IDLE;
        end
        else if (mac_data_valid == 'd1) begin
            state_counter_enable = 'd1;
            ip_header_enable = 'd1;
            case(state_counter)
            IP_HDR_SIZE_BYTES-1: begin
                nextstate = GET_USER_DATA;
                state_counter_reset = 'd1;
            end
            default: begin
            end
            endcase
        end
    end
    GET_USER_DATA:begin
        mac_data_ready = 'd1;
        if (mac_data_valid == 'd1) begin
            state_counter_enable = 'd1;
            data_frame_enable = 'd1;
            // If the frame is not the 
            // expected size then abort
            if (state_counter == DATA_FRAME_WIDTH -1
             && mac_data_last == 'd1
             && mac_data_tuser == 'd0) begin
               state_counter_reset = 'd1;
               nextstate = IDLE;
               frame_ready = 'd1;
            end 
            else if (state_counter == DATA_FRAME_WIDTH -1
                  && mac_data_last == 'd1
                  && mac_data_tuser == 'd1) begin
                state_counter_reset = 'd1;
                nextstate = IDLE;
            end
            else if (state_counter != DATA_FRAME_WIDTH - 1
                  && mac_data_last == 'd1) begin
                state_counter_reset = 'd1;
                nextstate = IDLE;            
            end       
        end  
    end
    WAIT_FOR_END:begin
        mac_data_ready = 'd1;
        if(mac_data_last) begin
            nextstate = IDLE;
        end
    end
    endcase
end

// Internal to external
assign accelerator_ip_address  = ACCELERATOR_IP_ADDRESS;
assign accelerator_mac_address = ACCELERATOR_MAC_ADDRESS;

assign mac_data_out          = MAC_DATA_OUT;
assign MAC_DATA_READY        = mac_data_ready;
assign mac_data_valid        = MAC_DATA_VALID;
assign mac_data_last         = MAC_DATA_LAST;
assign mac_data_tuser        = MAC_DATA_TUSER;

assign DATA_FRAME            = data_frame;
assign SRC_IP_ADDRESS        = src_ip_address;
assign SRC_MAC_ADDRESS       = src_mac_address;

counter_sync_reset #(
    .SIZE(COUNTER_WIDTH)
) state_counter_logic (
    .CLK(ACLK),
    .RESET(state_counter_reset),
    .ENABLE(state_counter_enable),
    .VALUE(state_counter)
);


// Using ARESETN on the registers because 
// we don't actually need to clear the values
// because they will be simply over written by
// the next valid packet
byte_write_register #(
    .SIZE_IN_BYTES(ETH_HDR_SIZE_BYTES),
    .BYTE_NUM_SIZE(COUNTER_WIDTH)     
) eth_hdr_register (
    .CLK(ACLK),
    .ARESET(ARESET),
    .ENABLE(eth_header_enable),
    .INPUT_VALUE(mac_data_out),
    .BYTE_NUM(state_counter),
    .OUTPUT_VALUE(eth_header_data)
);

byte_write_register #(
    .SIZE_IN_BYTES(IP_HDR_SIZE_BYTES),
    .BYTE_NUM_SIZE(COUNTER_WIDTH)     
) ip_hdr_register (
    .CLK(ACLK),
    .ARESET(ARESET),
    .ENABLE(ip_header_enable),
    .INPUT_VALUE(mac_data_out),
    .BYTE_NUM(state_counter),
    .OUTPUT_VALUE(ip_header_data)
);

byte_write_register #(
    .SIZE_IN_BYTES(USER_DATA_BYTES),
    .BYTE_NUM_SIZE(COUNTER_WIDTH)    
) user_data_register (
    .CLK(ACLK),
    .ARESET(ARESET),
    .ENABLE(data_frame_enable),
    .INPUT_VALUE(mac_data_out),
    .BYTE_NUM(state_counter),
    .OUTPUT_VALUE(data_frame)
);


endmodule

module byte_write_register #(parameter SIZE_IN_BYTES=12, parameter BYTE_NUM_SIZE=16)(
    input                        CLK,
    input                        ARESET,
    input                        ENABLE,
    input  [     7:0]            INPUT_VALUE,
    input  [BYTE_NUM_SIZE-1  :0] BYTE_NUM,
    
    output [SIZE_IN_BYTES*8-1:0] OUTPUT_VALUE  
);

logic [SIZE_IN_BYTES*8-1:0] latched_value;
logic [SIZE_IN_BYTES*8-1:0] output_value;

always_ff @ (posedge CLK) begin
    if(ARESET == 1'b0) begin
       latched_value <= 'd0;
    end
    if (ENABLE) begin
       latched_value <= output_value;
    end
end

always_comb begin
    output_value = latched_value;
    for (int i = 0; i < SIZE_IN_BYTES; i++) begin
        if(BYTE_NUM == i) begin
            output_value[i*8+:8] = INPUT_VALUE;
        end
    end 
end
    
    assign OUTPUT_VALUE = latched_value;
endmodule