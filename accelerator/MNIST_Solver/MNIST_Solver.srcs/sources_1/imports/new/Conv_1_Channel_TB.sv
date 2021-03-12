`timescale 1ns / 1ps

module Conv_1_Channel_TB(

);

    localparam PERIOD = 100;
    localparam HALF_PERIOD = 50;

    logic clock, reset_n, start, done, waiting;
    logic signed [17:0] x [27:0][27:0];
    logic signed [17:0] x_pad [29:0][29:0];
    logic signed [17:0] y [27:0][27:0];
    logic signed [17:0] expected [27:0][27:0];
    logic signed [17:0] weights [2:0][2:0] = '{'{18'h0, 18'h0, 18'h0}, 
                                                   '{18'h0, 18'h0, 18'h0}, 
                                                   '{18'h0, 18'h0, 18'h0}};
    logic signed [17:0] bias = 18'b0;
    // max_fault is the maximum discrepancy the testbench will tolerate between
    //     any one output of the DUT and the expected data
    localparam signed [17:0] max_fault = 18'b1000;
    logic signed [17:0] difference;
    logic PASS;
    
    int fd, read_ret;
    
    genvar a, b;
    generate
        for (a = 0; a < 30; a++) begin
            for (b = 0; b < 30; b++) begin
                if (a == 0 || b == 0 || a == 29 || b == 29) begin
                    assign x_pad[a][b] = 18'b0;
                end else begin
                    assign x_pad[a][b] = x[a - 1][b - 1];
                end
            end
        end
    endgenerate
    
    Conv_1_Channel DUT (
        .clock(clock),
        .reset_n(reset_n),
        .start(start),
        .x_pad(x_pad),
        .weights(weights),
        .bias(bias),
        .y(y),
        .done(done)
    );
    
    always begin
        clock = 1'b0;
        #HALF_PERIOD;
        clock = 1'b1;
        #HALF_PERIOD;
    end
    
    initial begin
        fd = $fopen("/home/andrew/infernet/accelerator/MNIST_Solver/MNIST_Solver.srcs/tb_data/Conv_1_Channel_TB_weights.mem", "r");
        for (int i = 0; i < 3; i++) begin
            for (int j = 0; j < 3; j++) begin
                read_ret = $fscanf(fd, "%b", weights[i][j]);
            end
        end
        
        fd = $fopen("/home/andrew/infernet/accelerator/MNIST_Solver/MNIST_Solver.srcs/tb_data/Conv_1_Channel_TB_frame.mem", "r");
        for (int i = 0; i < 28; i++) begin
            for (int j = 0; j < 28; j++) begin
                read_ret = $fscanf(fd, "%b", x[i][j]);
            end
        end
        
        fd = $fopen("/home/andrew/infernet/accelerator/MNIST_Solver/MNIST_Solver.srcs/tb_data/Conv_1_Channel_TB_expected.mem", "r");
        for (int i = 0; i < 28; i++) begin
            for (int j = 0; j < 28; j++) begin
                read_ret = $fscanf(fd, "%b", expected[i][j]);
            end
        end
        
        fd = $fopen("/home/andrew/infernet/accelerator/MNIST_Solver/MNIST_Solver.srcs/tb_data/Conv_1_Channel_TB_bias.mem", "r");
        read_ret = $fscanf(fd, "%b", bias);
        
        PASS = 1'b1;
        reset_n = 1'b0;
        waiting = 1'b0;
        start = 1'b0;
        #PERIOD;
        #PERIOD;
        reset_n = 1'b1;
        #PERIOD;
        #PERIOD;
        start = 1'b1;
    end
    
    always @(posedge clock) begin
        if (start) begin
            waiting <= 1'b1;
            start <= 1'b0;
        end
        if (done) begin
            for (int i = 0; i < 28; i++) begin
                for (int j = 0; j < 28; j++) begin
                    difference = expected[i][j] - y[i][j];
                    if (difference[17]) begin
                        difference = -difference;
                    end
                    if (difference > max_fault) begin
                        PASS = 1'b0;
                        $display("Mismatch at row = %d col = %d. Expected = %b_%b_%b Output = %b_%b_%b", i, j, expected[i][j][17], expected[i][j][16:10], expected[i][j][9:0], y[i][j][17], y[i][j][16:10], y[i][j][9:0]);
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
    end

endmodule
