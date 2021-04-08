`timescale 1ns / 1ps

module ip_packet_tx_tb();
logic aclk;
initial aclk = 'd1;
always #5 aclk = ~aclk;

logic areset;

logic [ 0:31] accelerator_ip_address;
logic [ 0:47] accelerator_mac_address;
logic [ 0:15] accelerator_udp_port;

// Signals interfacing with accelerator
logic [ 0:31] recipient_ip_address;
logic [ 0:47] recipient_mac_address;
logic [ 0:15] recipient_udp_port;
logic [ 0:9]  recipient_message; // Either a response to LB or an inference result
logic        start_ip_txn;
logic        ready_for_send;

// Signals interfacing with MAC
logic [7:0] mac_data_out;
logic       mac_data_ready;
logic       mac_data_valid;
logic       mac_data_last;
logic       mac_data_tuser;

// Simulation params
localparam [ 0:15] eth_packet_type = 'h0800; // ip protocol

localparam [ 0: 7] ip_version = 'h45;
localparam [ 0: 7] service_type = 'h00;
localparam [ 0:15] packet_length = 'd20 + 'd8 + 'd18; // ip hdr length + udp hdr lenght + data length (bytes)
localparam [ 0:15] identification = 'h0000;
localparam [ 0:15] flags_and_fragment = 'h0000;
localparam [ 0: 7] time_to_live = 'h80;
localparam [ 0: 7] protocol = 'h11; 

localparam [0:15] packet_length_udp = 'd8 + 'd18;
localparam [0:15] checksum_udp = 'd0;

int checksum;
int passed;


int unsigned data_out_list[];
int ready_wait_list[];
int ready_low_list[];

// Eth hdr + ip hdr + udp hdr + payload - checksum
localparam MIN_PAYLOAD_SIZE = 60;

initial begin
   // Reset the ip and set input signals
   areset = 'd0;
   accelerator_ip_address =  32'h01_02_03_04;
   accelerator_mac_address = 48'h54b00bedabba;
   accelerator_udp_port = 16'h66ff;
   
   recipient_ip_address =  32'h0a_0b_0c_0d;
   recipient_mac_address = 48'h32dabbadebd5;
   recipient_udp_port = 16'h99dd;
   recipient_message = 10'h1ff;

   

   #10;
   areset = 'd1;
   #10;
   
   data_out_list = {recipient_mac_address[ 0: 7],
                    recipient_mac_address[ 8:15],
                    recipient_mac_address[16:23],
                    recipient_mac_address[24:31],
                    recipient_mac_address[32:39],
                    recipient_mac_address[40:47], 
                    accelerator_mac_address[ 0: 7],
                    accelerator_mac_address[ 8:15],
                    accelerator_mac_address[16:23],
                    accelerator_mac_address[24:31],
                    accelerator_mac_address[32:39],
                    accelerator_mac_address[40:47],
                    eth_packet_type[ 0:7],
                    eth_packet_type[ 8:15],
                    ip_version,
                    service_type,
                    packet_length[ 0:7],
                    packet_length[ 8:15],                 
                    identification[ 0: 7],
                    identification[ 8:15],                  
                    flags_and_fragment[ 0: 7],
                    flags_and_fragment[ 8:15],       
                    time_to_live,
                    protocol,
                    checksum[15:8],
                    checksum[ 7:0],
                    accelerator_ip_address[ 0: 7],
                    accelerator_ip_address[ 8:15],
                    accelerator_ip_address[16:23],
                    accelerator_ip_address[24:31],                  
                    recipient_ip_address[ 0: 7],
                    recipient_ip_address[ 8:15],
                    recipient_ip_address[16:23],
                    recipient_ip_address[24:31],
                    accelerator_udp_port[ 0: 7],
                    accelerator_udp_port[ 8:15],
                    recipient_udp_port[ 0: 7],
                    recipient_udp_port[ 8:15],
                    packet_length_udp[ 0: 7],
                    packet_length_udp[ 8:15],
                    checksum_udp[0:7],
                    checksum_udp[8:15],
                    recipient_message[0:1],
                    recipient_message[2:9],
                    'h00,
                    'h00,
                    'h00,
                    'h00,
                    'h00,
                    'h00,
                    'h00,
                    'h00,
                    'h00,
                    'h00,
                    'h00,
                    'h00,
                    'h00,
                    'h00,
                    'h00,
                    'h00};
   $display("Size:%d", data_out_list.size);
   assert(data_out_list.size == MIN_PAYLOAD_SIZE) else $stop("Bad expected payload");
   ready_low_list = {};
   passed = 0;
   test_tx(data_out_list, ready_wait_list, ready_low_list, passed);

   #40
   ready_low_list = {4,5,6,7, 20, 33};
   ready_wait_list = {1,2,3,4, 5,  6};
   test_tx(data_out_list, ready_wait_list, ready_low_list, passed);

   $finish();
end


task test_tx(
    input  int unsigned data_out_list[],
    input  int          ready_wait_list[],
    input  int          ready_low_list[],
    output int          passed
);
   int i;
   int j;
   int unsigned found_list[];
   // Start a transaction
   assert(ready_for_send == 'd1) else $stop("Simulation failed! Ready for send should be low!");
   assert(ready_wait_list.size == ready_low_list.size) else $stop("Bad tb sizes!");
   mac_data_ready = 'd0;
   start_ip_txn = 'd1;
   #10
   start_ip_txn = 'd0;
   i = 0;
   j = 0;
   while(i < data_out_list.size) begin
        if(ready_low_list.size > 0 && ready_low_list[j] == i) begin
            ready_low_list[j] = -1;
            mac_data_ready = 'd0;
            for (int n = 0; n < ready_wait_list[j]; n++) begin
                #10;
                assert(mac_data_valid == 'd1) else $stop("Simulation failed! Bad valid!");
                assert(mac_data_out == 'd0) else $stop("Simulation failed! Bad data out!"); 
            end
            j++;
        end begin
            mac_data_ready = 'd1;
            #10;
            $display("I:%d, MAC_DATA_OUT:%x DATA_LIST:%x", i, mac_data_out, data_out_list[i]);
            assert(mac_data_valid == 'd1) else $stop("Simulation failed! Bad valid!");
            assert(mac_data_out == data_out_list[i]) else $stop("Simulation failed! Bad data out!"); 
            if (i == data_out_list.size - 1) begin
                assert(mac_data_last == 'd1) else $stop("Simulation failed! Last should be asserted!");
            end
            i++;
        end
        assert(ready_for_send == 'd0) else $stop("Simulation failed! Ready for send should be low!");
    end
    // move into idle state
    #10;
    passed = 1;
endtask


ip_packet_tx dut (
    // Global signals
    .ACLK(aclk),
    .ARESET(areset),
    .ACCELERATOR_IP_ADDRESS(accelerator_ip_address),
    .ACCELERATOR_MAC_ADDRESS(accelerator_mac_address),
    .ACCELERATOR_UDP_PORT(accelerator_udp_port),

    // Signals interfacing with accelerator
    .RECIPIENT_IP_ADDRESS(recipient_ip_address),
    .RECIPIENT_MAC_ADDRESS(recipient_mac_address),
    .RECIPIENT_UDP_PORT(recipient_udp_port),
    .RECIPIENT_MESSAGE(recipient_message), // Either a response to LB or an inference result
    .START_IP_TXN(start_ip_txn),
    .READY_FOR_SEND(ready_for_send),

    // Signals interfacing with MAC
    .MAC_DATA_OUT(mac_data_out),
    .MAC_DATA_READY(mac_data_ready),
    .MAC_DATA_VALID(mac_data_valid),
    .MAC_DATA_LAST(mac_data_last),
    .MAC_DATA_TUSER(mac_data_tuser)
);

ipv4_checksum_calculator get_checksum(
    .VERSION(ip_version),
    .SERVICE_TYPE(service_type),
    .LENGTH(packet_length),
    .IDENTIFICATION(identification),
    .FLAGS_AND_FRAGMENT(flags_and_fragment),
    .TTL(time_to_live),
    .PROTOCOL(protocol),
    .SRC_IP_ADDRESS(accelerator_ip_address),
    .DST_IP_ADDRESS(recipient_ip_address),
    .CHECKSUM(checksum)
);

endmodule