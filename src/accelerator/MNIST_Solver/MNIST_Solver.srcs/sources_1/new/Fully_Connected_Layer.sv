`timescale 1ns / 1ps

module Fully_Connected_Layer #(
    parameter signed [17:0] biases [9:0] = '{ 18'h0, 18'h0, 18'h0, 18'h0, 18'h0,
                                              18'h0, 18'h0, 18'h0, 18'h0, 18'h0}
) (
    // Control signals
    input clock,
    input reset_n,
    input start,
    output logic done,
    // Channel to read weights in
    output logic [4:0] in_weight_chan,
    input signed [17:0] in_weight [9:0],
    // Channel to read data in
    input signed [17:0] in_data,
    output logic [4:0] in_chan,
    // Output data
    input [4:0] out_neuron,
    output logic signed [17:0] out_data
);

    (* ram_style = "distributed" *) logic signed [17:0] obuf [9:0];
    
    logic signed [24:0] a [9:0];
    logic signed [17:0] b [9:0];
    logic signed [47:0] c [9:0];
    logic signed [47:0] p [9:0];
    logic signed [17:0] out_rounded [9:0];
    
    logic [3:0] counter;
    
    enum logic [1:0] {
        IDLE,
        WORKING,
        DONE
    } state;
    
    always_comb begin
        out_data = obuf[out_neuron];
        in_weight_chan = in_chan;
    end
    
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
                if (in_chan == 'd19 && counter == 'd0) begin
                    state <= DONE;
                end else begin
                    state <= WORKING;
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
            in_chan <= 'd0;
        end else begin
            if (state == WORKING) begin
                if (counter == 'd0) begin
                    counter <= 'd5;
                    if (in_chan == 'd19) begin
                        in_chan <= 'd0;
                    end else begin
                        in_chan <= in_chan + 1;
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
    for (i = 0; i < 10; i++) begin : fc_neuron_gen
        assign a[i] = in_data;
        assign b[i] = in_weight[i];
    
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
                c[i] <= {{20{biases[i][17]}}, biases[i], {10{1'b0}}};
                obuf[i] <= 'b0;
            end else begin
                if (state == WORKING) begin
                    if (counter == 'd0) begin
                        c[i] <= p[i];
                        if (in_chan == 'd19) begin
                            obuf[i] <= out_rounded[i];
                        end
                    end    
                end else if (state == DONE) begin
                    c[i] <= {{20{biases[i][17]}}, biases[i], {10{1'b0}}};
                end
            end
        end
        
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
