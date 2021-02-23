`timescale 1ns / 1ps

module Conv_Kernel_TB (

);

    localparam PERIOD = 40;
    localparam HALF_PERIOD = 20;
    
    logic clock;
    logic reset_n;
    logic signed [17:0] x [1:0][1:0];
    logic signed [17:0] x2 [2:0][2:0];
    logic signed [17:0] out;
    logic signed [17:0] out2;
    
    Conv_Kernel_3by3 #(
        .weights('{'{18'b1_1111101_1110001101, 18'b0_0000010_1110001100, 18'b1_1111101_0001111001},
                   '{18'b0_0000000_1000011110, 18'b0_0000001_0010000001, 18'b0_0000001_0101010101},
                   '{18'b1_1111010_1110011111, 18'b0_0000000_1110001101, 18'b0_0000011_0000010110}}),
        .bias(18'b1_1111111_0100000000)
    ) C3 (
        .clock(clock),
        .reset_n(reset_n),
        .x(x2),
        .out(out2)
    );
    
    Conv_Kernel_2by2 #(
        .weights('{'{18'b1_1111111_0000000000, 18'b0_00000001_0100000000}, 
                   '{18'b0_0000011_0001000000, 18'b0_0000000_0010000000}}),
        .bias(18'b0_0000001_0000011000)
    ) C2 (
        .clock(clock),
        .reset_n(reset_n),
        .x(x),
        .out(out)
    );
    
    always begin
        clock = 1'b0;
        #HALF_PERIOD;
        clock = 1'b1;
        #HALF_PERIOD;
    end
    
    initial begin
        reset_n = 1'b0;
        x = '{'{'b0, 'b0}, '{'b0, 'b0}};
        x2 = '{'{'b0, 'b0, 'b0}, '{'b0, 'b0, 'b0}, '{'b0, 'b0, 'b0}}; 
        #PERIOD;
        #PERIOD;
        
        reset_n = 1'b1;
        #PERIOD;
        
        x = '{'{18'b0_0000000_1001100110, 18'b0_0000000_1100000000}, '{18'b0_0000000_0010000000, 18'b0_0000001_0000000000}};
        x2 = '{'{18'b0_0000000_0110100110, 18'b0_0000000_1011101111, 18'b0_0000000_1110001100}, 
               '{18'b0_0000000_0001110100, 18'b0_0000000_0101100101, 18'b0_0000000_1011011011}, 
               '{18'b0_0000000_1111111000, 18'b0_0000000_1111110100, 18'b0_0000000_1010110000}};
        #PERIOD;
        #PERIOD;
        #PERIOD;
        #PERIOD;
        #PERIOD;
        #PERIOD;
        #PERIOD;
        #PERIOD;
        #PERIOD;
        #PERIOD;
        #PERIOD;
        #PERIOD;
        #PERIOD;
        #PERIOD;
        #PERIOD;
        #PERIOD;
        #PERIOD;
        #PERIOD;
        #PERIOD;
        #PERIOD;
        #PERIOD;
        #PERIOD;
        #PERIOD;
        #PERIOD;
        #PERIOD;
        #PERIOD;
        
        $display("expected from 2x2 = 0_0000001_1101111010 = 1.869140625");
        $display("expected from 3x3 = 1_1111101_0011001011 = -2.8017578125");
        
        $finish;
        
    end

endmodule
