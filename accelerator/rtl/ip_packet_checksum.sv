module ipv4_checksum_calculator (
    input  [ 7:0] VERSION,
    input  [ 7:0] SERVICE_TYPE,
    input  [15:0] LENGTH,
    input  [15:0] IDENTIFICATION,
    input  [15:0] FLAGS_AND_FRAGMENT,
    input  [ 7:0] TTL,
    input  [ 7:0] PROTOCOL,
    input  [31:0] SRC_IP_ADDRESS,
    input  [31:0] DST_IP_ADDRESS,
    
    output [15:0] CHECKSUM
);

logic [19:0] sum;
assign sum = {VERSION, SERVICE_TYPE} 
           + LENGTH 
           + IDENTIFICATION 
           + FLAGS_AND_FRAGMENT 
           + {TTL, PROTOCOL} 
           + {SRC_IP_ADDRESS[23:16], SRC_IP_ADDRESS[31:24]} 
           + {SRC_IP_ADDRESS[ 7: 0], SRC_IP_ADDRESS[15: 8]}
           + {DST_IP_ADDRESS[23:16], DST_IP_ADDRESS[31:24]} 
           + {DST_IP_ADDRESS[ 7: 0], DST_IP_ADDRESS[15: 8]};
logic [15:0] sum_plus_carry;
assign sum_plus_carry = sum[19:16] + sum[15:0];
assign CHECKSUM = ~sum_plus_carry;

endmodule