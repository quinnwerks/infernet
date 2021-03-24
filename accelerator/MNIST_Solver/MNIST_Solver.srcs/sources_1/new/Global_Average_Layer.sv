`timescale 1ns / 1ps

// 1/81 in our S7.10 fixed point is 00000000.0000001101

// This layer is slightly different than conv_1, max_pool, and conv_2
// Instead of outputting write data and associated control signals for piping
//     data to a BRAM buffer, this module stores results in internal distributed
//     RAM buffers (SLICEM), which can be accessed by 
module Global_Average_Layer(
    // Control signals
    input clock,
    input reset_n,
    input start,
    output logic done,
    
    // Channel to read data in
    input signed [17:0] in_data [19:0],
    output logic [4:0] in_row,
    output logic [4:0] in_col,
    
    // Output data
    input [4:0] out_chan,
    output logic signed [17:0] out_data
);

    (* ram_style = "distributed " *) logic signed [17:0] obuf [19:0];
    logic signed [24:0] a [19:0];
    logic signed [17:0] b [19:0];
    logic signed [47:0] c [19:0];
    logic signed [47:0] p [19:0];
    logic signed [24:0] loopback_rounded [19:0];
    logic signed [17:0] out_rounded [19:0];
    logic [3:0] counter;
    
    always_comb begin
        out_data = obuf[out_chan];
    end
    
    enum logic [1:0] {
        IDLE,
        ADD,
        DIV,
        DONE
    } state;

    // State machine control
    always_ff @(posedge clock) begin
        if (reset_n == 1'b0) begin
            state <= IDLE;
        end else begin
            if (state == IDLE) begin
                if (start) begin
                    state <= ADD;
                end else begin
                    state <= IDLE;
                end
            end else if (state == ADD) begin
                if (in_row == 'd8 && in_col == 'd8 && counter == 'b0) begin
                    state <= DIV;
                end else begin
                    state <= ADD;
                end
            end else if (state == DIV) begin
                if (counter == 'b0) begin
                    state <= DONE;
                end
            end else if (state == DONE) begin
                state <= IDLE;
            end else begin
                state <= state;
            end
        end
    end

    // Input/output controls
    always_ff @(posedge clock) begin
        if (reset_n == 1'b0) begin
            counter <= 'd5;
            done <= 1'b0;
            in_row <= 'b0;
            in_col <= 'b0;
        end else begin
            if (state == ADD || state == DIV) begin
                if (counter == 'd0) begin
                    counter <= 'd5;
                    if (in_row == 'd8 && in_col == 'd8) begin
                        in_row <= 'd0;
                        in_col <= 'd0;
                    end else if (in_col == 'd8) begin
                        in_col <= 'd0;
                        in_row <= in_row + 1;
                    end else begin
                        in_col <= in_col + 1;
                    end
                end else begin
                    counter <= counter - 1;
                end
            end
            if (state == DONE) begin
                done <= 1'b1;
            end
            if (done) begin
                done <= 1'b0;
            end
        end
    end

    genvar i;
    generate
    for (i = 0; i < 20; i++) begin : global_avg_gen
        Mult_Add_Global_Average mult (
            .CLK(clock),
            .CE(1'b1),
            .SCLR(~reset_n),
            .A(a[i]),
            .B(b[i]),
            .C(c[i]),
            .P(p[i]),
            .SUBTRACT(1'b0)
        );
        
        always_ff @(posedge clock) begin
            if (reset_n == 1'b0) begin
                a[i] <= 'b0;
                b[i] <= 'b0;
                c[i] <= 'b0;
                obuf[i] <= 'b0;
            end else begin
                if (state == ADD) begin
                    a[i] <= in_data[i];
                    b[i] <= 18'b0_0000001_0000000000;
                    if (in_row == 'd8 && in_col == 'd8 && counter == 'b0) begin
                        c[i] <= 'b0;
                    end else if (counter == 'b0) begin
                        c[i] <= p[i];
                    end 
                end else if (state == DIV) begin
                    a[i] <= loopback_rounded[i];
                    b[i] <= 18'b0_0000000_0000001101;
                    c[i] <= 'b0;
                    if (counter == 'b0) begin
                        obuf[i] <= out_rounded[i];
                    end
                end else if (state == DONE) begin
                    a[i] <= 'b0;
                    b[i] <= 'b0;
                    c[i] <= 'b0;
                end
            end
        end
        
        FP_Round #(
            .NUM_M(14),
            .NUM_F(10),
            .NUM_P(48)
        ) loopback_rounding (
            .in(p[i]),
            .out(loopback_rounded[i]),
            .overflow(),
            .underflow(),
            .lack_precision()
        );
        
        FP_Round #(
            .NUM_M(7),
            .NUM_F(10),
            .NUM_P(48)
        ) output_rounding (
            .in(p[i]),
            .out(out_rounded[i]),
            .overflow(),
            .underflow(),
            .lack_precision()
        );
    end
    endgenerate

endmodule
