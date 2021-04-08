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
    logic [31:0] curr_ip, ip_out;
    logic [47:0] curr_mac, mac_out;
    
    logic PASS;
    
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
        .ip_address(curr_ip),
        .mac_address(curr_mac),
        .x(x),
        .y(y),
        .ip_out(ip_out),
        .mac_out(mac_out),
        .done(done),
        .out(out)
    );
    
    initial begin
        reset_n = 1'b0;
        start = 'b0;
        yx = 2'b00;
        curr_ip = 32'hABCDEF10;
        curr_mac = 48'hABCDEF123456;
        PASS = 1;
        
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
                if (ip_out != curr_ip || mac_out != curr_mac) begin
                    PASS = 1'b0;
                end
                if (yx == 2'b11) begin
                    if (PASS == 1'b0) begin
                        $display("FAIL! At some point returned IP or MAC did not match");
                    end else begin
                        $display("PASS! All IP and MAC addresses matched!");
                    end
                    $stop;
                end
                yx <= yx + 1'b1;
                curr_ip <= curr_ip + 8;
                curr_mac <= curr_mac + 8;
                waiting <= 1'b1; 
            end
        end
    end

endmodule
