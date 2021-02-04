module counter_tb();
logic clk;
logic reset;

initial clk = 'b1;
always #5 clk = ~clk;


localparam COUNTER_SIZE = 8;
localparam MAX_VALUE = COUNTER_SIZE**2;
logic enable;
logic[COUNTER_SIZE-1:0] value;

initial begin
    // reset the counter
    // set enable
    reset = 'd1;
    enable = 'd0;
    #10;
    // bring reset to low
    reset = 'd0;
    #10;
    // Test for overflow behaviour
    for(int i = 0; i <= MAX_VALUE; i++) begin
        enable = 'd1;
        #10;
        if (enable < MAX_VALUE) begin
            assert(value == i) else $error("Counter test failed");
        end
        else begin
            assert(value == 0) else $error("Counter test failed");
        end
    end
    
    reset = 'd1;
    enable = 'd0;
    #10;
    // bring reset to low
    reset = 'd0;
    #10;
    // Test early reset
    for (int i = 0; i < MAX_VALUE/2; i++) begin
        assert(value == i) else $error("Counter test failed");
    end
    reset = 'd1;
    enable = 'd0;
    #10;
    // bring reset to low
    reset = 'd0;
    #10;
    assert(value == 0) else $error("Counter test failed");
    $finish("Simulation success!");
end


counter_sync_reset #(
    .SIZE(COUNTER_SIZE) 
) dut (
    .CLK(clk),
    .RESET(reset),
    .ENABLE(enable),
    .VALUE(value)
);
    
endmodule