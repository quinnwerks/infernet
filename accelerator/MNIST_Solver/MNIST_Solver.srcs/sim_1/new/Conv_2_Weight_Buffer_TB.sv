`timescale 1ns / 1ps

module Conv_2_Weight_Buffer_TB(

);

    localparam HALF_PERIOD = 50;
    localparam PERIOD = 100;

    logic clock;
    logic signed [17:0] data_out;
    logic [4:0] addr;
    logic signed [17:0] expected [23:0];
    int fd;
    
    Conv_2_Weight_Buffer DUT (
        .clock(clock),
        .addr(addr),
        .data(data_out)
    );
    
    always begin
        clock = 1'b0;
        #HALF_PERIOD;
        clock = 1'b1;
        #HALF_PERIOD;
    end
    
    initial begin
        $readmemb("/home/andrew/infernet/misc/Conv_2_Weights.mem", expected);
        #PERIOD;
        #PERIOD;
        addr = 0;
        
        for (int i = 0; i < 24; i++) begin
            addr = i;
            #PERIOD;
            if (expected[i] != data_out) begin
                $display("expected %b_%b_%b got %b_%b_%b", expected[17], expected[16:10], expected[9:0], data_out[17], data_out[16:10], data_out[9:0]);
            end
        end
        
        $finish;
    end

endmodule
