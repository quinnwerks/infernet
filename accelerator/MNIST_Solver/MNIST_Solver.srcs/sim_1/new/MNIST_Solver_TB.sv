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
    localparam NUM_FRAMES = 10;
    localparam NUM_ITERS_PER_FRAME = 1;

    logic clock, reset_n, start, done;
    // x contains our test frame
    logic signed [17:0] x [27:0][27:0];
    // Expected contains the expected contents of the output frame buffer
    logic [3:0] expected;
    logic [3:0] label;
    logic [3:0] prediction;
    logic PASS;
    
    logic signed [17:0] in_data;
    logic [9:0] out_data;
    logic in_wen;
    logic [4:0] in_row, in_col;
    
    int fd1, fd2, fd3, read_ret;
    
    MNIST_Solver DUT (
        .clock(clock),
        .reset_n(reset_n),
        .start(start),
        .done(done),
        .w_row(in_row),
        .w_col(in_col),
        .w_data(in_data),
        .w_en(in_wen),
        .out(out_data)
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
        #PERIOD;
        #PERIOD;
        reset_n = 1'b1;
        #PERIOD;
        #PERIOD;
    
        fd1 = $fopen("/home/andrew/infernet/accelerator/MNIST_Solver/MNIST_Solver.srcs/tb_data/MNIST_Solver_TB_frames.mem", "r");
        fd2 = $fopen("/home/andrew/infernet/accelerator/MNIST_Solver/MNIST_Solver.srcs/tb_data/MNIST_Solver_TB_expected.mem", "r");
        fd3 = $fopen("/home/andrew/infernet/accelerator/MNIST_Solver/MNIST_Solver.srcs/tb_data/MNIST_Solver_TB_labels.mem", "r");
    
        for (int frame = 0; frame < NUM_FRAMES; frame++) begin
            // 1. Read frame in
            for (int i = 0; i < 28; i++) begin
                for (int j = 0; j < 28; j++) begin
                    read_ret = $fscanf(fd1, "%b", x[i][j]);
                end
            end
        
            // 2. Read expected data in        
            read_ret = $fscanf(fd2, "%b", expected);
            read_ret = $fscanf(fd3, "%b", label);
            
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
                
                // 6. Check the output
                for (int i = 0; i < 10; i++) begin
                    if (out_data == (1 << i)) begin
                        prediction = i;
                    end
                end
                
                if (prediction != label && prediction != expected) begin
                    $display("FAIL! Prediction did not match label or expected. Prediction %d Expected %d Label %d", prediction, expected, label);
                    PASS = 1'b0;
                end else begin
                    $display("Prediction: %d Label: %d Expected: %d", prediction, label, expected);
                end
            end
        end
        
        if (PASS) begin
            $display("PASS! All outputs matched label or expected result!"); 
        end else begin
            $display("FAIL! Some outputs did not match label or expected result :(");
        end
        
        $finish;
    end

endmodule
