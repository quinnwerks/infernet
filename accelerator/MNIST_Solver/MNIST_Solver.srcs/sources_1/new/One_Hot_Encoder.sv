`timescale 1ns / 1ps

module One_Hot_Encoder(
    // Control signals
    input clock,
    input reset_n,
    input start,
    output logic done,
    // Channel to read data in
    input signed [17:0] in_data,
    output logic [4:0] in_addr,
    // Output data
    output logic [9:0] out
);

    logic signed [17:0] max;
    logic [3:0] max_idx;

    enum logic [1:0] {
        IDLE,
        WORKING,
        DONE
    } state;
    
    // State machine control
    always_ff @(posedge clock) begin
        if (reset_n == 1'b0) begin
            state <= IDLE;
        end else begin
            if (state == IDLE) begin
                if (start) begin
                    state <= WORKING;
                end else begin
                    state <= IDLE;
                end
            end else if (state == WORKING) begin
                if (in_addr == 'd9) begin
                    state <= DONE;
                end
            end else if (state == DONE) begin
                state <= IDLE;
            end else begin
                state <= state;
            end
        end
    end
    
    always_ff @(posedge clock) begin
        if (reset_n == 1'b0) begin
            in_addr <= 'd0;
            done <= 1'b0;
            out <= 'b0;
            max <= 18'b1_0000000_0000000000;
            max_idx <= 'd0;
        end else begin
            if (state == WORKING) begin
                if (in_data > max) begin
                    max_idx <= in_addr;
                    max <= in_data;
                end 
                in_addr <= in_addr + 1;
            end
            if (state == DONE) begin
                in_addr <= 'b0;
                out <= (1 << max_idx);
                max <= 18'b1_0000000_0000000000;
                done <= 1'b1;
                max_idx <= 'd0;
            end
            if (done) begin
                done <= 1'b0;
            end
        end
    end
    
endmodule
