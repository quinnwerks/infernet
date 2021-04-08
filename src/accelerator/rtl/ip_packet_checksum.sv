module ipv4_checksum_calculator (
    input  [ 0:7] VERSION,
    input  [ 0:7] SERVICE_TYPE,
    input  [ 0:15] LENGTH,
    input  [ 0:15] IDENTIFICATION,
    input  [ 0:15] FLAGS_AND_FRAGMENT,
    input  [ 0:7] TTL,
    input  [ 0:7] PROTOCOL,
    input  [ 0:31] SRC_IP_ADDRESS,
    input  [ 0:31] DST_IP_ADDRESS,
    
    output [15:0] CHECKSUM
);

logic [19:0] sum;
assign sum = {VERSION, SERVICE_TYPE} 
           + LENGTH 
           + IDENTIFICATION 
           + FLAGS_AND_FRAGMENT 
           + {TTL, PROTOCOL} 
           + SRC_IP_ADDRESS[16:31]
           + SRC_IP_ADDRESS[ 0:15]
           + DST_IP_ADDRESS[16:31] 
           + DST_IP_ADDRESS[ 0:15];
logic [15:0] sum_plus_carry;
assign sum_plus_carry = sum[19:16] + sum[15:0];
assign CHECKSUM = ~sum_plus_carry;

endmodule