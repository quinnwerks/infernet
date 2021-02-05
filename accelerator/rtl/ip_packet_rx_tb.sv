module ip_packet_rx_tb();
logic clk;
logic reset;
logic enable;
    
initial clk = 'd1;
always #5 clk = ~clk;
    
localparam NUM_BYTES = 13;
localparam BYTE_NUM_SIZE = 4;
logic [7:0] input_value;
logic [BYTE_NUM_SIZE-1:0] byte_num;
logic [NUM_BYTES*8-1:0] output_value;

initial begin
    reset = 'd0;
    #10;
    reset = 'd1;
    #10;
    for (int i = 0; i < NUM_BYTES; i++) begin
        byte_num = i;
        enable = 'd1;
        input_value = i;
        #10;
    end
    $finish();
end

    
byte_write_register #(.SIZE_IN_BYTES(NUM_BYTES), .BYTE_NUM_SIZE(BYTE_NUM_SIZE)) 
dut (
    .CLK(clk),
    .ARESET(reset),
    .ENABLE(enable),
    .INPUT_VALUE(input_value),
    .BYTE_NUM(byte_num),
    .OUTPUT_VALUE(output_value)
);

endmodule