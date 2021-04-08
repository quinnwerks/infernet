`timescale 1ns / 1ps

module Max_Pool_2D_TB (

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
    localparam NUM_ITER = 4;

    logic clock, reset_n, start, done;
    // x contains our test frame
    logic signed [17:0] x [27:0][27:0];
    // Expected contains the expected contents of the output frame buffer
    logic signed [17:0] expected [8:0][8:0];
    // max_fault is the maximum discrepancy the testbench will tolerate between
    //     any one output of the DUT and the expected data
    localparam signed [17:0] max_fault = 18'b1000;
    logic signed [17:0] difference;
    logic PASS;
    
    logic signed [17:0] ibuf_data_in [5:0];
    logic signed [17:0] ibuf_data_out [5:0];
    logic signed [17:0] obuf_data_in [5:0]; 
    logic signed [17:0] obuf_data_out [5:0];
    logic ibuf_wen, obuf_wen;
    logic [4:0] ibuf_wrow, ibuf_wcol, ibuf_rrow, ibuf_rcol, obuf_wrow, obuf_wcol, obuf_rrow, obuf_rcol;
    
    int fd, read_ret;
    
    Max_Pool_Layer DUT (
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
        
        Conv_1_Frame_Buffer ibuf (
            .clock(clock),
            .w_row(ibuf_wrow),
            .w_col(ibuf_wcol),
            .w_data(ibuf_data_in[k]),
            .w_en(ibuf_wen),
            .r_row(ibuf_rrow),
            .r_col(ibuf_rcol),
            .r_data(ibuf_data_out[k])
        );
    end
    endgenerate
    
    always begin
        clock = 1'b0;
        #HALF_PERIOD;
        clock = 1'b1;
        #HALF_PERIOD;
    end
    
    initial begin
        // 1. Read frame in
        fd = $fopen("/home/andrew/infernet/accelerator/MNIST_Solver/MNIST_Solver.srcs/tb_data/Max_Pool_2D_TB_frame.mem", "r");
        for (int i = 0; i < 28; i++) begin
            for (int j = 0; j < 28; j++) begin
                read_ret = $fscanf(fd, "%b", x[i][j]);
            end
        end
    
        // 2. Read expected data in    
        fd = $fopen("/home/andrew/infernet/accelerator/MNIST_Solver/MNIST_Solver.srcs/tb_data/Max_Pool_2D_TB_expected.mem", "r");
        for (int i = 0; i < 9; i++) begin
            for (int j = 0; j < 9; j++) begin
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
                for (int n = 0; n < 6; n++) begin
                    ibuf_data_in[n] = x[row][col];
                end
                ibuf_wen = 1'b1;
                #PERIOD;
            end
        end
        ibuf_wen = 1'b0;
        
        for (int iter = 0; iter < NUM_ITER; iter++) begin
            // 4. Trigger channel with "start"
            start = 1'b1;
            #PERIOD;
            start = 1'b0;
            
            // 5. Wait for "done"
            while (!done) begin
                #PERIOD;
            end
            
            // 6. Iterate over output frame buffer and compare against expected
            for (int row = 0; row < 9; row++) begin
                for (int col = 0; col < 9; col++) begin
                    obuf_rrow = row;
                    obuf_rcol = col;
                    #PERIOD;
                    difference = expected[row][col] - obuf_data_out[0];
                    if (difference[17]) begin
                        difference = -difference;
                    end
                    if (difference > max_fault) begin
                        PASS = 1'b0;
                        $display("Mismatch at row = %d col = %d. Expected = %b_%b_%b Output = %b_%b_%b", row, col, expected[row][col][17], expected[row][col][16:10], expected[row][col][9:0], obuf_data_out[0][17], obuf_data_out[0][16:10], obuf_data_out[0][9:0]);
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
