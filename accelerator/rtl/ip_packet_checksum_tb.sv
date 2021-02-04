module ip_packet_checksum_tb();

logic [ 7:0] version;
logic [ 7:0] service_type;
logic [15:0] length;
logic [15:0] identification;
logic [15:0] flags_and_fragment;
logic [ 7:0] ttl;
logic [ 7:0] protocol;
logic [31:0] src_ip_address;
logic [31:0] dst_ip_address;
    
logic [15:0] checksum;

initial begin
    int golden_value = 'hb861;
    // See: 
    // https://en.wikipedia.org/wiki/IPv4_header_checksum#Calculating_the_IPv4_header_checksum
    version = 'h45;
    service_type = 'h00;
    length = 'h0073;
    identification = 'h0000;
    flags_and_fragment = 'h4000;
    ttl = 'h40;
    protocol = 'h11;
    src_ip_address = 'hc0a80001;
    dst_ip_address = 'hc0a800c7;
    #20
    assert(golden_value == checksum) else $error("Checksum does not equal golden value");
    $finish();
end
    
ipv4_checksum_calculator dut(
    .VERSION(version),
    .SERVICE_TYPE(service_type),
    .LENGTH(length),
    .IDENTIFICATION(identification),
    .FLAGS_AND_FRAGMENT(flags_and_fragment),
    .TTL(ttl),
    .PROTOCOL(protocol),
    .SRC_IP_ADDRESS(src_ip_address),
    .DST_IP_ADDRESS(dst_ip_address),
    .CHECKSUM(checksum)
);

endmodule