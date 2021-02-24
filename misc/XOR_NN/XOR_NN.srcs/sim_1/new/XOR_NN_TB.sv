`timescale 1ns / 1ps

module XOR_NN_TB(

);
    localparam PERIOD = 100;
    localparam HALF_PERIOD = 50;
    logic [1:0] yx;
    logic x, y;
    logic out;
    logic clock, reset_n;
    logic start, done;
    logic waiting;
    
    always begin
        clock <= 1'b0;
        #HALF_PERIOD;
        clock <= 1'b1;
        #HALF_PERIOD;
    end
    
    assign x = yx[0];
    assign y = yx[1];
    
    XOR_NN my_first_nn (
        .clock(clock),
        .start(start),
        .reset_n(reset_n),
        .x(x),
        .y(y),
        .done(done),
        .out(out)
    );
    
    initial begin
        reset_n = 1'b0;
        start = 'b0;
        yx = 2'b00;
        
        #PERIOD;
        #PERIOD;
        
        reset_n = 1'b1;
        waiting = 1'b1;
        #PERIOD;
    end
    
    always @(posedge clock) begin
        if (reset_n == 1'b0) begin
            yx <= 2'b00;
            start <= 'b0;
        end else begin
            if (waiting) begin
                start <= 1'b1;
                waiting <= 1'b0;
            end
            if (start) begin
                start <= 1'b0;
            end
            if (done) begin
                if (yx == 2'b11) begin
                    $stop;
                end
                yx <= yx + 1'b1;
                waiting <= 1'b1; 
            end
        end
    end

endmodule
