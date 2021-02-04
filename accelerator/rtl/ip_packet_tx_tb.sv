`timescale 1ns / 1ps

module ip_packet_tx_tb();
logic aclk;
initial aclk = 'd1;
always #5 aclk = ~aclk;

logic areset;

logic [31:0] accelerator_ip_address;
logic [47:0] accelerator_mac_address;

// Signals interfacing with accelerator
logic [31:0] recipient_ip_address;
logic [47:0] recipient_mac_address;
logic [9:0]  recipient_message; // Either a response to LB or an inference result
logic        start_ip_txn;
logic        ready_for_send;

// Signals interfacing with MAC
logic [7:0] mac_data_out;
logic       mac_data_ready;
logic       mac_data_valid;
logic       mac_data_last;
logic       mac_data_first;

// Simulation params
localparam total_packet_size_bytes = 46;

localparam [ 7:0] ip_version = 'h45;
localparam [ 7:0] service_type = 'h00;
localparam [15:0] packet_length = 'd20 + 'd2; // header length + data length (bytes)
localparam [15:0] identification = 'h0000;
localparam [15:0] flags_and_fragment = 'h0000;
localparam [ 7:0] time_to_live = 'h80;
localparam [ 7:0] protocol = 'h04; 
int checksum;
int passed;


int unsigned data_out_list[];
int ready_wait_list[];
int ready_low_list[];

initial begin
   // Reset the ip and set input signals
   areset = 'd0;
   accelerator_ip_address =  31'hbeefbeef;
   accelerator_mac_address = 48'h54b00bedabba;
   
   recipient_ip_address =  31'hdeadbeef;
   recipient_mac_address = 48'h32dabbadebd5;
   recipient_message = 10'h1ff;

   

   #10;
   areset = 'd1;
   #10;
   
   data_out_list = {recipient_mac_address[47:40], 
                    recipient_mac_address[39:32],
                    recipient_mac_address[31:24],
                    recipient_mac_address[23:16],
                    recipient_mac_address[15: 8],
                    recipient_mac_address[ 7: 0],
                    accelerator_mac_address[47:40],
                    accelerator_mac_address[39:32],
                    accelerator_mac_address[31:24],
                    accelerator_mac_address[23:16],
                    accelerator_mac_address[15: 8],
                    accelerator_mac_address[ 7: 0],
                    ip_version,
                    service_type,
                    packet_length[15:8],
                    packet_length[ 7:0],
                    identification[15:8],
                    identification[ 7:0],
                    flags_and_fragment[15:8],
                    flags_and_fragment[7:0],
                    time_to_live,
                    protocol,
                    checksum[15:8],
                    checksum[ 7:0],
                    accelerator_ip_address[31:24],
                    accelerator_ip_address[23:16],
                    accelerator_ip_address[15: 8],
                    accelerator_ip_address[ 7: 0],
                    recipient_ip_address[31:24],
                    recipient_ip_address[23:16],
                    recipient_ip_address[15: 8],
                    recipient_ip_address[ 7: 0],
                    recipient_message[9:8],
                    recipient_message[7:0]};
   ready_low_list = {};
   passed = 0;
   test_tx(data_out_list, ready_wait_list, ready_low_list, passed);
   #40
   ready_low_list = {4,5,6,7};
   ready_wait_list = {1,2,3,4};
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
                assert(mac_data_valid == 'd0) else $stop("Simulation failed! Bad valid!");
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
                assert(mac_data_last == 'd1) else $stop("Simulation failed! Data in should be asserted!");
            end
            i++;
        end
        assert(ready_for_send == 'd0) else $stop("Simulation failed! Ready for send should be low!");
    end
    mac_data_ready = 'd0;
    passed = 1;
endtask


ip_packet_tx dut (
    // Global signals
    .ACLK(aclk),
    .ARESET(areset),
    .ACCELERATOR_IP_ADDRESS(accelerator_ip_address),
    .ACCELERATOR_MAC_ADDRESS(accelerator_mac_address),

    // Signals interfacing with accelerator
    .RECIPIENT_IP_ADDRESS(recipient_ip_address),
    .RECIPIENT_MAC_ADDRESS(recipient_mac_address),
    .RECIPIENT_MESSAGE(recipient_message), // Either a response to LB or an inference result
    .START_IP_TXN(start_ip_txn),
    .READY_FOR_SEND(ready_for_send),

    // Signals interfacing with MAC
    .MAC_DATA_OUT(mac_data_out),
    .MAC_DATA_READY(mac_data_ready),
    .MAC_DATA_VALID(mac_data_valid),
    .MAC_DATA_LAST(mac_data_last),
    .MAC_DATA_FIRST(mac_data_first)
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