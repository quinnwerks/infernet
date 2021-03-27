module buff_ip_to_nn  # (
    parameter USER_DATA_BYTES=784
) (
    input            ACLK,
    input            ARESET,
    
    input [0:USER_DATA_BYTES*8-1] DATA_FRAME_IP,
    input [0:31]                  SRC_IP_ADDRESS_IP,
    input [0:47]                  SRC_MAC_ADDRESS_IP,
    input [0:15]                  SRC_UDP_PORT_IP,
    input                         FRAME_READY,  
    
    output [0:31] SRC_IP_ADDRESS_NN,
    output [0:47] SRC_MAC_ADDRESS_NN,
    output [0:15] SRC_UDP_PORT_NN,
    output [17:0] W_DATA,
    output        W_EN,
    output [4:0]  W_ROW,
    output [4:0]  W_COL,
    output        W_DONE

);
    
(* mark_debug = "true" *) enum logic[7:0] {
IDLE,
WORKING,
DONE
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

// Forward declare relevant data stuff
// Index input data
logic [15:0] data_counter;
logic [7:0] data_frame_out;
logic [17:0] data_transformed;

logic w_en;


logic start_signal;
logic done_signal;
logic data_reset;
assign start_signal = FRAME_READY;
assign W_DONE = done_signal;
// Control
always_comb begin
    nextstate = state;
    done_signal = 'b0;
    data_reset = 'b0;
    w_en = 'b0;
    case(state) 
    IDLE: begin
        if (start_signal == 1'b1) begin
            nextstate = WORKING;
        end
    end
    WORKING: begin
        w_en = 'b1;
        if (data_counter == USER_DATA_BYTES - 1) begin
            nextstate = DONE;
        end
    end
    DONE: begin
        done_signal = 'b1;
        data_reset = 'b1;
        nextstate = IDLE;
    end
    default: begin
        nextstate = state;
    end
    endcase   
end

// Data
// Index row, col
logic [4:0] row, col;
always_ff @(posedge ACLK or negedge ARESET) begin
    if (ARESET == 'd0) begin
        row <= 5'd0;
        col <= 5'd0;
    end
    else if (state == WORKING) begin
        if (row == 5'd27 && col == 5'd27) begin
            row <= 5'd0;
            col <= 5'd0;
        end
        else if (col == 5'd27) begin
            row <= row + 1;
            col <= 5'd0;
        end 
        else begin
            col <= col + 1;
        end
    end
    else if (state == DONE) begin
        row <= 5'd0;
        col <= 5'd0;
    end
 end


logic [0:USER_DATA_BYTES*8-1] data_frame_reg;
logic [0:31]                  src_ip_address_reg;
logic [0:47]                  src_mac_address_reg;
logic [0:15]                  src_udp_port_reg;
 
always_ff @(posedge ACLK or negedge ARESET) begin
    if (ARESET == '0) begin
        data_counter <= 0;
    end
    else if (state == WORKING) begin
        data_counter <= data_counter + 1;
    end
    else if (data_reset == 'b1) begin
        data_counter <= 'd0;
    end
end

assign data_frame_out = data_counter >= 0 && data_counter < USER_DATA_BYTES ?
                        data_frame_reg[data_counter*8+:8] : 'd0;
assign data_transformed = {8'b0, data_frame_out, 2'b0};

always_ff @ (posedge ACLK) begin 
    if (ARESET == 'd0) begin
        data_frame_reg <= 0;
        src_ip_address_reg <= 0;
        src_mac_address_reg <= 0;
        src_udp_port_reg <= 0;
    end
    else if (start_signal && state == IDLE) begin
        data_frame_reg <= DATA_FRAME_IP;
        src_ip_address_reg <= SRC_IP_ADDRESS_IP;
        src_mac_address_reg <= SRC_MAC_ADDRESS_IP;
        src_udp_port_reg <= SRC_UDP_PORT_IP;
    end
end

assign SRC_IP_ADDRESS_NN = src_ip_address_reg;
assign SRC_MAC_ADDRESS_NN = src_mac_address_reg;
assign SRC_UDP_PORT_NN = src_udp_port_reg;

assign W_ROW = row;
assign W_COL = col;
assign W_DONE = done_signal; 
assign W_EN = w_en;
assign W_DATA = data_transformed;

endmodule

