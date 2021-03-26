`timescale 1ns / 1ps

module MNIST_Solver_TB (

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
    localparam NUM_FRAMES = 3;
    localparam NUM_ITERS_PER_FRAME = 3;

    logic clock, reset_n, start, done;
    // x contains our test frame
    logic signed [17:0] x [27:0][27:0];
    // Expected contains the expected contents of the output frame buffer
    logic signed [17:0] expected [9:0];
    // max_fault is the maximum discrepancy the testbench will tolerate between
    //     any one output of the DUT and the expected data
    localparam signed [17:0] max_fault = 18'b10000000000;
    logic signed [17:0] difference;
    logic PASS;
    
    logic signed [17:0] in_data;
    logic signed [17:0] out_data;
    logic in_wen;
    logic [4:0] in_row, in_col, out_chan;
    
    int fd1, fd2, read_ret;
    
    MNIST_Solver DUT (
        .clock(clock),
        .reset_n(reset_n),
        .start(start),
        .done(done),
        .w_row(in_row),
        .w_col(in_col),
        .w_data(in_data),
        .w_en(in_wen),
        .r_chan(out_chan),
        .r_data_out(out_data)
    );
    
    always begin
        clock = 1'b0;
        #HALF_PERIOD;
        clock = 1'b1;
        #HALF_PERIOD;
    end
    
    initial begin
        PASS = 1'b1;
        reset_n = 1'b0;
        start = 1'b0;
        in_row = 'b0;
        in_col = 'b0;
        in_data = 'b0;
        in_wen = 'b0;
        out_chan = 'b0;
        difference = 'b0;
        #PERIOD;
        #PERIOD;
        reset_n = 1'b1;
        #PERIOD;
        #PERIOD;
    
        fd1 = $fopen("/home/andrew/infernet/accelerator/MNIST_Solver/MNIST_Solver.srcs/tb_data/Conv_1_Channel_TB_frame.mem", "r");
        fd2 = $fopen("/home/andrew/infernet/accelerator/MNIST_Solver/MNIST_Solver.srcs/tb_data/FC_TB_expected.mem", "r");
    
        for (int frame = 0; frame < NUM_FRAMES; frame++) begin
            // 1. Read frame in
            for (int i = 0; i < 28; i++) begin
                for (int j = 0; j < 28; j++) begin
                    read_ret = $fscanf(fd1, "%b", x[i][j]);
                end
            end
        
            // 2. Read expected data in        
            for (int chan = 0; chan < 10; chan++) begin
                read_ret = $fscanf(fd2, "%b", expected[chan]);
            end
            
            // 3. Write test frame into input frame buffer
            for (int row = 0; row < 28; row++) begin
                for (int col = 0; col < 28; col++) begin
                    in_row = row;
                    in_col = col;
                    in_data = x[row][col];
                    in_wen = 1'b1;
                    #PERIOD;
                end
            end
            in_wen = 1'b0;
            
            for (int iter = 0; iter < NUM_ITERS_PER_FRAME; iter++) begin
                // 4. Trigger channel with "start"
                start = 1'b1;
                #PERIOD;
                start = 1'b0;
                
                // 5. Wait for "done"
                while (!done) begin
                    #PERIOD;
                end
                
                // 6. Iterate over output frame buffer and compare against expected
                for (int chan = 0; chan < 10; chan++) begin
                    out_chan = chan;
                    #PERIOD;
                    difference = expected[chan] - out_data;
                    if (difference[17]) begin
                        difference = -difference;
                    end
                    if (difference > max_fault) begin
                        PASS = 1'b0;
                        $display("Mismatch at chan %d. Expected = %b_%b_%b Output = %b_%b_%b", chan, expected[chan][17], expected[chan][16:10], expected[chan][9:0], out_data[17], out_data[16:10], out_data[9:0]);
                        $display("Difference = %b_%b_%b", difference[17], difference[16:10], difference[9:0]);
                    end
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
