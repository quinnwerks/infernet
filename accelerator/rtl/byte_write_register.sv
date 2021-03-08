module byte_write_register_little_endian #(parameter SIZE_IN_BYTES=12, parameter BYTE_NUM_SIZE=16)(
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