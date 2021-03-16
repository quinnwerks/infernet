`timescale 1ns / 1ps

module Conv_1_Channel_TB(

);

    // Test plan
    // 1. Read frame in
    // 2. Read expected data in
    // 3. Write test frame into input frame buffer
    // 4. Trigger channel with "start"
    // 5. Wait for "done"
    // 6. Iterate over output frame buffer and compare against expected

    localparam PERIOD = 100;
    localparam HALF_PERIOD = 50;

    logic clock, reset_n, start, done;
    // x contains our test frame
    logic signed [17:0] x [27:0][27:0];
    // Expected contains the expected contents of the output frame buffer
    logic signed [17:0] expected [31:0][31:0];
    // max_fault is the maximum discrepancy the testbench will tolerate between
    //     any one output of the DUT and the expected data
    localparam signed [17:0] max_fault = 18'b1000;
    logic signed [17:0] difference;
    logic PASS;
    
    logic signed [17:0] ibuf_data_in, ibuf_data_out;
    logic signed [17:0] obuf_data_in [5:0];
    logic signed [17:0] obuf_data_out [5:0];
    logic ibuf_wen, obuf_wen;
    logic [4:0] ibuf_wrow, ibuf_wcol, ibuf_rrow, ibuf_rcol, obuf_wrow, obuf_wcol, obuf_rrow, obuf_rcol;
    
    int fd, read_ret;
    
    Conv_Layer_1 #(
        .weights('{
                   '{
                        '{18'b1_1111110_1011011110, 18'b1_1111110_1100110010, 18'b1_1111100_1111100100},
                        '{18'b1_1111101_0010000011, 18'b1_1111110_1100011110, 18'b1_1111101_1101111101},
                        '{18'b1_1111100_0111110010, 18'b0_0000010_1001001101, 18'b0_0000000_1000011110}
                    },
                   '{
                        '{18'b1_1111011_1011100001, 18'b1_1111100_0100111000, 18'b1_1111010_1111011101},
                        '{18'b0_0000010_0000011110, 18'b1_1111111_1000011101, 18'b1_1111010_0101000010},
                        '{18'b0_0000101_1101110100, 18'b0_0000100_0001001001, 18'b0_0000001_0010000001}
                    },
                   '{
                        '{18'b0_0000100_0111111001, 18'b0_0000001_1101011110, 18'b1_1111110_0110010100},
                        '{18'b1_1111110_1000011111, 18'b0_0000010_0000100011, 18'b0_0000000_0011010010},
                        '{18'b1_1111100_0011010110, 18'b1_1111111_1101111010, 18'b0_0000001_0101010101}
                    },
                   '{
                        '{18'b0_0000010_1001011010, 18'b0_0000010_0000111001, 18'b1_1111011_0010000001},
                        '{18'b0_0000010_1000001101, 18'b0_0000001_0110001110, 18'b1_1111100_0010101110},
                        '{18'b0_0000010_1111001011, 18'b1_1111101_1110001101, 18'b1_1111010_1110011111}
                    },
                   '{
                        '{18'b1_1111110_0110100010, 18'b1_1111011_1010010001, 18'b1_1111111_0010100110}, 
                        '{18'b1_1111101_1000011000, 18'b0_0000001_1000101111, 18'b0_0000100_1011010101}, 
                        '{18'b0_0000010_1010110010, 18'b0_0000010_1110001100, 18'b0_0000000_1110001101}
                    },
                   '{
                        '{18'b1_1111101_1001100110, 18'b1_1111110_0010110100, 18'b0_0000011_1100100110}, 
                        '{18'b1_1111110_0101110011, 18'b1_1111101_1100111111, 18'b0_0000100_0101111001}, 
                        '{18'b1_1111110_0010101110, 18'b1_1111101_0001111001, 18'b0_0000011_0000010110}
                    }
                   }),
        .biases('{18'b0_0000010_1100000110, 18'b1_1111111_1111111001, 18'b1_1111111_1111111011, 18'b1_1111111_1111111110, 18'b1_1111111_0100110100, 18'b1_1111111_1000000000})
    ) DUT (
        .clock(clock),
        .reset_n(reset_n),
        .start(start),
        .done(done),
        .in_data(ibuf_data_out),
        .in_row(ibuf_rrow),
        .in_col(ibuf_rcol),
        .out_data(obuf_data_in),
        .out_row(obuf_wrow),
        .out_col(obuf_wcol),
        .out_w_enable(obuf_wen)
    );
    
    genvar k;
    generate
    for (k = 0; k < 6; k++) begin : obuf_gen
        Conv_1_Frame_Buffer obuf (
            .clock(clock),
            .w_row(obuf_wrow),
            .w_col(obuf_wcol),
            .w_data(obuf_data_in[k]),
            .w_en(obuf_wen),
            .r_row(obuf_rrow),
            .r_col(obuf_rcol),
            .r_data(obuf_data_out[k])
        );
    end
    endgenerate
    
    Conv_1_Frame_Buffer ibuf (
        .clock(clock),
        .w_row(ibuf_wrow),
        .w_col(ibuf_wcol),
        .w_data(ibuf_data_in),
        .w_en(ibuf_wen),
        .r_row(ibuf_rrow),
        .r_col(ibuf_rcol),
        .r_data(ibuf_data_out)
    );
    
    always begin
        clock = 1'b0;
        #HALF_PERIOD;
        clock = 1'b1;
        #HALF_PERIOD;
    end
    
    initial begin
        // 1. Read frame in
        fd = $fopen("/home/andrew/infernet/accelerator/MNIST_Solver/MNIST_Solver.srcs/tb_data/Conv_1_Channel_TB_frame.mem", "r");
        for (int i = 0; i < 28; i++) begin
            for (int j = 0; j < 28; j++) begin
                read_ret = $fscanf(fd, "%b", x[i][j]);
            end
        end
    
        // 2. Read expected data in    
        fd = $fopen("/home/andrew/infernet/accelerator/MNIST_Solver/MNIST_Solver.srcs/tb_data/Conv_1_Channel_TB_expected.mem", "r");
        for (int i = 0; i < 32; i++) begin
            for (int j = 0; j < 32; j++) begin
                read_ret = $fscanf(fd, "%b", expected[i][j]);
            end
        end
        
        PASS = 1'b1;
        reset_n = 1'b0;
        start = 1'b0;
        obuf_rrow = 'b0;
        obuf_rcol = 'b0;
        difference = 'b0;
        #PERIOD;
        #PERIOD;
        reset_n = 1'b1;
        #PERIOD;
        #PERIOD;
        
        // 3. Write test frame into input frame buffer
        for (int row = 0; row < 28; row++) begin
            for (int col = 0; col < 28; col++) begin
                ibuf_wrow = row;
                ibuf_wcol = col;
                ibuf_data_in = x[row][col];
                ibuf_wen = 1'b1;
                #PERIOD;
            end
        end
        ibuf_wen = 1'b0;
        
        // 4. Trigger channel with "start"
        start = 1'b1;
        #PERIOD;
        start = 1'b0;
        
        // 5. Wait for "done"
        while (!done) begin
            #PERIOD;
        end
        
        // 6. Iterate over output frame buffer and compare against expected
        for (int row = 0; row < 28; row++) begin
            for (int col = 0; col < 28; col++) begin
                obuf_rrow = row;
                obuf_rcol = col;
                #PERIOD;
                difference = expected[row][col] - obuf_data_out[0];
                if (difference[17]) begin
                    difference = -difference;
                end
                if (difference > max_fault) begin
                    PASS = 1'b0;
                    $display("Mismatch at row = %d col = %d. Expected = %b_%b_%b Output = %b_%b_%b", row, col, expected[row][col][17], expected[row][col][16:10], expected[row][col][9:0], obuf_data_out[17], obuf_data_out[16:10], obuf_data_out[9:0]);
                    $display("Difference = %b_%b_%b", difference[17], difference[16:10], difference[9:0]);
                end
            end
        end
        
        if (PASS) begin
            $display("PASS! All outputs within %b tolerance to expected.", max_fault); 
        end else begin
            $display("FAIL! Some outputs exceed specified tolerance of %b.", max_fault);
        end
        
        $finish;
    end

endmodule
