`timescale 1ns / 1ps

module FP_Round_TB (

);

    logic clock;
    logic reset_n;
    localparam PERIOD = 100;
    localparam HALF_PERIOD = 50;

    logic signed [17:0] x;
    logic signed [17:0] y;
    logic signed [24:0] x_SE;
    logic signed [47:0] unrounded;
    logic signed [17:0] out;
    logic [ 0:0] overflow;
    logic [ 0:0] underflow;
    logic [ 0:0] lack_precision;
    
    logic signed [17:0] expected;
    logic [ 0:0] expected_OF;
    logic [ 0:0] expected_UF;
    logic [ 0:0] expected_LP;
    
    logic [ 0:0] curr_PASS;
    logic [ 0:0] PASS;
    
    int test_num;
    
    assign x_SE = x;
    
    Mult_Add_Pipelined_NC mult (
        .CLK(clock),
        .CE(1'b1),
        .SCLR(~reset_n),
        .A(x_SE),
        .B(y),
        .C('b0),
        .SUBTRACT(1'b0),
        .P(unrounded),
        .PCOUT()
    );
    
    FP_Round #(
        .NUM_P(48),
        .NUM_M(7),
        .NUM_F(10)
    ) rounding (
        .in(unrounded),
        .out(out),
        .underflow(underflow),
        .overflow(overflow),
        .lack_precision(lack_precision)
    );
    
//    Fixed_Point_Mult #(
//        .NUM_M(7),
//        .NUM_F(10)
//    ) DUT (
//        .x(x),
//        .y(y),
//        .out(out),
//        .overflow(overflow),
//        .underflow(underflow),
//        .lack_precision(lack_precision)
//    );
    
    always begin
        clock = 1'b0;
        #HALF_PERIOD;
        clock = 1'b1;
        #HALF_PERIOD;
    end
    
    // Test vectors:
    // 1. Positive basic case - +ve output, no overflow, underflow, or precision loss
    // 2. Negative basic case - -ve output, no overflow, underflow, or precision loss
    // 3. Positive basic case #2 - +ve output (but both inputs -ve), no overflow, underflow, or precision loss
    // 4. Lack of precision, positive, round up
    // 5. Lack of precision, negative, round up (more positive)
    // 6. Lack of precision, positive, round down
    // 7. Lack of precision, negative, round down (more negative)
    // 8. Overflow
    // 9. Underflow
    // 10. Lack of precicision, positive, that triggers an overflow after rounding
    initial begin
        reset_n = 1'b0;
        x = 'b0;
        y = 'b0;
        
        #PERIOD;
        #PERIOD;
        #PERIOD;
        
        reset_n = 1'b1;
        
        #PERIOD;
        #PERIOD;
    
        PASS = 1'b1;
        curr_PASS = 1'b1;
        test_num = 0;
    
        // Reset/most basic case
        x = 'b0;
        y = 'b0;
        expected = 'b0;
        expected_OF = 'b0;
        expected_UF = 'b0;
        expected_LP = 'b0;
        #PERIOD;
        #PERIOD;
        #PERIOD;
        #PERIOD;
        $display("Test %02d : x = 18'b%b_%b_%b y= 18'b%b_%b_%b", test_num, x[17], x[16:10], x[9:0], y[17], y[16:10], y[9:0]);
        if (expected != out) begin
            $display("FAIL! out = 18'b%b_%b_%b expected = 18'b%b_%b_%b", out[17], out[16:10], out[9:0], expected[17], expected[16:10], expected[9:0]);
            curr_PASS = 1'b0;
        end
        if (expected_OF != overflow) begin
            $display("FAIL! overflow = 1'b%b expected_OF = 1'b%b", overflow, expected_OF);
            curr_PASS = 1'b0;
        end
        if (expected_UF != underflow) begin
            $display("FAIL! underflow = 1'b%b expected_UF = 1'b%b", underflow, expected_UF);
            curr_PASS = 1'b0;
        end
        if (expected_LP != lack_precision) begin
            $display("FAIL! lack_precision = 1'b%b expected_LP = 1'b%b", lack_precision, expected_LP);
            curr_PASS = 1'b0;
        end
        
        if (curr_PASS) begin
            $display("Test %0d : PASS\n", test_num);
        end else begin
            $display("Test %0d : FAIL\n", test_num);
            PASS = 1'b0;
        end
        curr_PASS = 1'b1;
        test_num++;
        
        
        // Case 1: Positive basic case - +ve output, no overflow, underflow, or precision loss
        // x = 3.125
        // y = 6
        // expected = 18.75
        x =             18'b0_0000011_0010000000;
        y =             18'b0_0000110_0000000000;
        expected =      18'b0_0010010_1100000000;
        expected_OF =   1'b0;
        expected_UF =   1'b0;
        expected_LP =   1'b0;
        #PERIOD;
        #PERIOD;
        #PERIOD;
        #PERIOD;
        $display("Test %02d : x = 18'b%b_%b_%b y= 18'b%b_%b_%b", test_num, x[17], x[16:10], x[9:0], y[17], y[16:10], y[9:0]);
        if (expected != out) begin
            $display("FAIL! out = 18'b%b_%b_%b expected = 18'b%b_%b_%b", out[17], out[16:10], out[9:0], expected[17], expected[16:10], expected[9:0]);
            curr_PASS = 1'b0;
        end
        if (expected_OF != overflow) begin
            $display("FAIL! overflow = 1'b%b expected_OF = 1'b%b", overflow, expected_OF);
            curr_PASS = 1'b0;
        end
        if (expected_UF != underflow) begin
            $display("FAIL! underflow = 1'b%b expected_UF = 1'b%b", underflow, expected_UF);
            curr_PASS = 1'b0;
        end
        if (expected_LP != lack_precision) begin
            $display("FAIL! lack_precision = 1'b%b expected_LP = 1'b%b", lack_precision, expected_LP);
            curr_PASS = 1'b0;
        end
        
        if (curr_PASS) begin
            $display("Test %0d : PASS\n", test_num);
        end else begin
            $display("Test %0d : FAIL\n", test_num);
            PASS = 1'b0;
        end
        curr_PASS = 1'b1;
        test_num++;
        
        
        // Case 2: Negative basic case - -ve output, no overflow, underflow, or precision loss
        // x = -15.2900390625
        // y = 3
        // expected = -45.87011719        
        x =             18'b1_1110000_1011010111;
        y =             18'b0_0000011_0000000000;
        expected =      18'b1_1010010_0010000101;
        expected_OF =   1'b0;
        expected_UF =   1'b0;
        expected_LP =   1'b0;
        #PERIOD;
        #PERIOD;
        #PERIOD;
        #PERIOD;
        $display("Test %02d : x = 18'b%b_%b_%b y= 18'b%b_%b_%b", test_num, x[17], x[16:10], x[9:0], y[17], y[16:10], y[9:0]);
        if (expected != out) begin
            $display("FAIL! out = 18'b%b_%b_%b expected = 18'b%b_%b_%b", out[17], out[16:10], out[9:0], expected[17], expected[16:10], expected[9:0]);
            curr_PASS = 1'b0;
        end
        if (expected_OF != overflow) begin
            $display("FAIL! overflow = 1'b%b expected_OF = 1'b%b", overflow, expected_OF);
            curr_PASS = 1'b0;
        end
        if (expected_UF != underflow) begin
            $display("FAIL! underflow = 1'b%b expected_UF = 1'b%b", underflow, expected_UF);
            curr_PASS = 1'b0;
        end
        if (expected_LP != lack_precision) begin
            $display("FAIL! lack_precision = 1'b%b expected_LP = 1'b%b", lack_precision, expected_LP);
            curr_PASS = 1'b0;
        end
        
        if (curr_PASS) begin
            $display("Test %0d : PASS\n", test_num);
        end else begin
            $display("Test %0d : FAIL\n", test_num);
            PASS = 1'b0;
        end
        curr_PASS = 1'b1;
        test_num++;
        
        
        // Case 3: Positive basic case #2 - +ve output (but both inputs -ve), no overflow, underflow, or precision loss
        // x = -23.67578125
        // y = -0.25
        // expected = 5.9189453125
        x =             18'b1_1101000_0101001100;
        y =             18'b1_1111111_1100000000;
        expected =      18'b0_0000101_1110101101;
        expected_OF =   1'b0;
        expected_UF =   1'b0;
        expected_LP =   1'b0;
        #PERIOD;
        #PERIOD;
        #PERIOD;
        #PERIOD;
        $display("Test %02d : x = 18'b%b_%b_%b y= 18'b%b_%b_%b", test_num, x[17], x[16:10], x[9:0], y[17], y[16:10], y[9:0]);
        if (expected != out) begin
            $display("FAIL! out = 18'b%b_%b_%b expected = 18'b%b_%b_%b", out[17], out[16:10], out[9:0], expected[17], expected[16:10], expected[9:0]);
            curr_PASS = 1'b0;
        end
        if (expected_OF != overflow) begin
            $display("FAIL! overflow = 1'b%b expected_OF = 1'b%b", overflow, expected_OF);
            curr_PASS = 1'b0;
        end
        if (expected_UF != underflow) begin
            $display("FAIL! underflow = 1'b%b expected_UF = 1'b%b", underflow, expected_UF);
            curr_PASS = 1'b0;
        end
        if (expected_LP != lack_precision) begin
            $display("FAIL! lack_precision = 1'b%b expected_LP = 1'b%b", lack_precision, expected_LP);
            curr_PASS = 1'b0;
        end
        
        if (curr_PASS) begin
            $display("Test %0d : PASS\n", test_num);
        end else begin
            $display("Test %0d : FAIL\n", test_num);
            PASS = 1'b0;
        end
        curr_PASS = 1'b1;
        test_num++;
        
        
        // Case 4: Lack of precision, positive, round up
        // x = all 1s in fraction bits = 0.9990234375
        // y = 1/2 = 0.5
        // expected = 1/2 = 0.5
        x =             18'b0_0000000_1111111111;
        y =             18'b0_0000000_1000000000;
        expected =      18'b0_0000000_1000000000;
        expected_OF =   1'b0;
        expected_UF =   1'b0;
        expected_LP =   1'b1;
        #PERIOD;
        #PERIOD;
        #PERIOD;
        #PERIOD;
        $display("Test %02d : x = 18'b%b_%b_%b y= 18'b%b_%b_%b", test_num, x[17], x[16:10], x[9:0], y[17], y[16:10], y[9:0]);
        if (expected != out) begin
            $display("FAIL! out = 18'b%b_%b_%b expected = 18'b%b_%b_%b", out[17], out[16:10], out[9:0], expected[17], expected[16:10], expected[9:0]);
            curr_PASS = 1'b0;
        end
        if (expected_OF != overflow) begin
            $display("FAIL! overflow = 1'b%b expected_OF = 1'b%b", overflow, expected_OF);
            curr_PASS = 1'b0;
        end
        if (expected_UF != underflow) begin
            $display("FAIL! underflow = 1'b%b expected_UF = 1'b%b", underflow, expected_UF);
            curr_PASS = 1'b0;
        end
        if (expected_LP != lack_precision) begin
            $display("FAIL! lack_precision = 1'b%b expected_LP = 1'b%b", lack_precision, expected_LP);
            curr_PASS = 1'b0;
        end
        
        if (curr_PASS) begin
            $display("Test %0d : PASS\n", test_num);
        end else begin
            $display("Test %0d : FAIL\n", test_num);
            PASS = 1'b0;
        end
        curr_PASS = 1'b1;
        test_num++;
        
        
        // Case 5: Lack of precision, negative, round up (more positive)
        // x = -3/1024 = -0.0029296875
        // y = 1/2 = 0.5
        // expected = -1/1024 = -0.0009765625
        x =             18'b1_1111111_1111111101;
        y =             18'b0_0000000_1000000000;
        expected =      18'b1_1111111_1111111111;
        expected_OF =   1'b0;
        expected_UF =   1'b0;
        expected_LP =   1'b1;
        #PERIOD;
        #PERIOD;
        #PERIOD;
        #PERIOD;
        $display("Test %02d : x = 18'b%b_%b_%b y= 18'b%b_%b_%b", test_num, x[17], x[16:10], x[9:0], y[17], y[16:10], y[9:0]);
        if (expected != out) begin
            $display("FAIL! out = 18'b%b_%b_%b expected = 18'b%b_%b_%b", out[17], out[16:10], out[9:0], expected[17], expected[16:10], expected[9:0]);
            curr_PASS = 1'b0;
        end
        if (expected_OF != overflow) begin
            $display("FAIL! overflow = 1'b%b expected_OF = 1'b%b", overflow, expected_OF);
            curr_PASS = 1'b0;
        end
        if (expected_UF != underflow) begin
            $display("FAIL! underflow = 1'b%b expected_UF = 1'b%b", underflow, expected_UF);
            curr_PASS = 1'b0;
        end
        if (expected_LP != lack_precision) begin
            $display("FAIL! lack_precision = 1'b%b expected_LP = 1'b%b", lack_precision, expected_LP);
            curr_PASS = 1'b0;
        end
        
        if (curr_PASS) begin
            $display("Test %0d : PASS\n", test_num);
        end else begin
            $display("Test %0d : FAIL\n", test_num);
            PASS = 1'b0;
        end
        curr_PASS = 1'b1;
        test_num++;
        
        
        // Case 6: Lack of precision, positive, round down
        // x = 64.0625 = 64 + 1/16
        // y = 1/256 = 0.00390625
        // expected = 0.25 ((1/16) / (1/1024) rounded down)
        x =             18'b0_1000000_0001000000;
        y =             18'b0_0000000_0000000100;
        expected =      18'b0_0000000_0100000000;
        expected_OF =   1'b0;
        expected_UF =   1'b0;
        expected_LP =   1'b1;
        #PERIOD;
        #PERIOD;
        #PERIOD;
        #PERIOD;
        $display("Test %02d : x = 18'b%b_%b_%b y= 18'b%b_%b_%b", test_num, x[17], x[16:10], x[9:0], y[17], y[16:10], y[9:0]);
        if (expected != out) begin
            $display("FAIL! out = 18'b%b_%b_%b expected = 18'b%b_%b_%b", out[17], out[16:10], out[9:0], expected[17], expected[16:10], expected[9:0]);
            curr_PASS = 1'b0;
        end
        if (expected_OF != overflow) begin
            $display("FAIL! overflow = 1'b%b expected_OF = 1'b%b", overflow, expected_OF);
            curr_PASS = 1'b0;
        end
        if (expected_UF != underflow) begin
            $display("FAIL! underflow = 1'b%b expected_UF = 1'b%b", underflow, expected_UF);
            curr_PASS = 1'b0;
        end
        if (expected_LP != lack_precision) begin
            $display("FAIL! lack_precision = 1'b%b expected_LP = 1'b%b", lack_precision, expected_LP);
            curr_PASS = 1'b0;
        end
        
        if (curr_PASS) begin
            $display("Test %0d : PASS\n", test_num);
        end else begin
            $display("Test %0d : FAIL\n", test_num);
            PASS = 1'b0;
        end
        curr_PASS = 1'b1;
        test_num++;


        // Case 7: Lack of precision, negative, round down (more negative)
        // x = -64.0625 = -64 - 1/16
        // y = 1/256 = 0.00390625
        // expected = -0.25 ((-1/16) / (1/1024) rounded down)
        x =             18'b1_0111111_1111000000;
        y =             18'b0_0000000_0000000100;
        expected =      18'b1_1111111_1100000000;
        expected_OF =   1'b0;
        expected_UF =   1'b0;
        expected_LP =   1'b1;
        #PERIOD;
        #PERIOD;
        #PERIOD;
        #PERIOD;
        $display("Test %02d : x = 18'b%b_%b_%b y= 18'b%b_%b_%b", test_num, x[17], x[16:10], x[9:0], y[17], y[16:10], y[9:0]);
        if (expected != out) begin
            $display("FAIL! out = 18'b%b_%b_%b expected = 18'b%b_%b_%b", out[17], out[16:10], out[9:0], expected[17], expected[16:10], expected[9:0]);
            curr_PASS = 1'b0;
        end
        if (expected_OF != overflow) begin
            $display("FAIL! overflow = 1'b%b expected_OF = 1'b%b", overflow, expected_OF);
            curr_PASS = 1'b0;
        end
        if (expected_UF != underflow) begin
            $display("FAIL! underflow = 1'b%b expected_UF = 1'b%b", underflow, expected_UF);
            curr_PASS = 1'b0;
        end
        if (expected_LP != lack_precision) begin
            $display("FAIL! lack_precision = 1'b%b expected_LP = 1'b%b", lack_precision, expected_LP);
            curr_PASS = 1'b0;
        end
        
        if (curr_PASS) begin
            $display("Test %0d : PASS\n", test_num);
        end else begin
            $display("Test %0d : FAIL\n", test_num);
            PASS = 1'b0;
        end
        curr_PASS = 1'b1;
        test_num++;


        // Case 8: Overflow
        // x = 64
        // y = 2
        // expected = overflow! saturation to 127.9990234375
        x =             18'b0_1000000_0000000000;
        y =             18'b0_0000010_0000000000;
        expected =      18'b0_1111111_1111111111;
        expected_OF =   1'b1;
        expected_UF =   1'b0;
        expected_LP =   1'b0;
        #PERIOD;
        #PERIOD;
        #PERIOD;
        #PERIOD;
        $display("Test %02d : x = 18'b%b_%b_%b y= 18'b%b_%b_%b", test_num, x[17], x[16:10], x[9:0], y[17], y[16:10], y[9:0]);
        if (expected != out) begin
            $display("FAIL! out = 18'b%b_%b_%b expected = 18'b%b_%b_%b", out[17], out[16:10], out[9:0], expected[17], expected[16:10], expected[9:0]);
            curr_PASS = 1'b0;
        end
        if (expected_OF != overflow) begin
            $display("FAIL! overflow = 1'b%b expected_OF = 1'b%b", overflow, expected_OF);
            curr_PASS = 1'b0;
        end
        if (expected_UF != underflow) begin
            $display("FAIL! underflow = 1'b%b expected_UF = 1'b%b", underflow, expected_UF);
            curr_PASS = 1'b0;
        end
        if (expected_LP != lack_precision) begin
            $display("FAIL! lack_precision = 1'b%b expected_LP = 1'b%b", lack_precision, expected_LP);
            curr_PASS = 1'b0;
        end
        
        if (curr_PASS) begin
            $display("Test %0d : PASS\n", test_num);
        end else begin
            $display("Test %0d : FAIL\n", test_num);
            PASS = 1'b0;
        end
        curr_PASS = 1'b1;
        test_num++;

        // Case 9: Underflow
        // x = -65
        // y = 2
        // expected = underflow! saturation to -128.0
        x =             18'b1_0111111_0000000000;
        y =             18'b0_0000010_0000000000;
        expected =      18'b1_0000000_0000000000;
        expected_OF =   1'b0;
        expected_UF =   1'b1;
        expected_LP =   1'b0;
        #PERIOD;
        #PERIOD;
        #PERIOD;
        #PERIOD;
        $display("Test %02d : x = 18'b%b_%b_%b y= 18'b%b_%b_%b", test_num, x[17], x[16:10], x[9:0], y[17], y[16:10], y[9:0]);
        if (expected != out) begin
            $display("FAIL! out = 18'b%b_%b_%b expected = 18'b%b_%b_%b", out[17], out[16:10], out[9:0], expected[17], expected[16:10], expected[9:0]);
            curr_PASS = 1'b0;
        end
        if (expected_OF != overflow) begin
            $display("FAIL! overflow = 1'b%b expected_OF = 1'b%b", overflow, expected_OF);
            curr_PASS = 1'b0;
        end
        if (expected_UF != underflow) begin
            $display("FAIL! underflow = 1'b%b expected_UF = 1'b%b", underflow, expected_UF);
            curr_PASS = 1'b0;
        end
        if (expected_LP != lack_precision) begin
            $display("FAIL! lack_precision = 1'b%b expected_LP = 1'b%b", lack_precision, expected_LP);
            curr_PASS = 1'b0;
        end
        
        if (curr_PASS) begin
            $display("Test %0d : PASS\n", test_num);
        end else begin
            $display("Test %0d : FAIL\n", test_num);
            PASS = 1'b0;
        end
        curr_PASS = 1'b1;
        test_num++;

        // Case 10: Lack of precicision, positive, that triggers an overflow after rounding
        // x = 127.875
        // y = 1 + 1/1024 = 1.0009765625
        // expected = overflow after rounding, saturation to 127.9990234375
        x =             18'b0_1111111_1110000000;
        y =             18'b0_0000001_0000000001;
        expected =      18'b0_1111111_1111111111;
        expected_OF =   1'b1;
        expected_UF =   1'b0;
        expected_LP =   1'b1;
        #PERIOD;
        #PERIOD;
        #PERIOD;
        #PERIOD;
        $display("Test %02d : x = 18'b%b_%b_%b y= 18'b%b_%b_%b", test_num, x[17], x[16:10], x[9:0], y[17], y[16:10], y[9:0]);
        if (expected != out) begin
            $display("FAIL! out = 18'b%b_%b_%b expected = 18'b%b_%b_%b", out[17], out[16:10], out[9:0], expected[17], expected[16:10], expected[9:0]);
            curr_PASS = 1'b0;
        end
        if (expected_OF != overflow) begin
            $display("FAIL! overflow = 1'b%b expected_OF = 1'b%b", overflow, expected_OF);
            curr_PASS = 1'b0;
        end
        if (expected_UF != underflow) begin
            $display("FAIL! underflow = 1'b%b expected_UF = 1'b%b", underflow, expected_UF);
            curr_PASS = 1'b0;
        end
        if (expected_LP != lack_precision) begin
            $display("FAIL! lack_precision = 1'b%b expected_LP = 1'b%b", lack_precision, expected_LP);
            curr_PASS = 1'b0;
        end
        
        if (curr_PASS) begin
            $display("Test %0d : PASS\n", test_num);
        end else begin
            $display("Test %0d : FAIL\n", test_num);
            PASS = 1'b0;
        end
        curr_PASS = 1'b1;
        test_num++;

        if (PASS) begin
            $display("Success! All test cases passed :)");
        end else begin
            $display("Some test cases failed :(");
        end
        
        $stop;
    end

endmodule
