`timescale 1ns / 1ps

module Top(
    input clock,
    input reset_n,
    input x,
    input y,
    output logic out
);

    logic x_reg, y_reg;
    logic out_wire;
    
    always_ff @(posedge clock) begin
        if (reset_n == 1'b0) begin
            x_reg <= 'b0;
            y_reg <= 'b0;
            out <= 'b0;
        end else begin
            x_reg <= x;
            y_reg <= y;
            out <= out_wire;
        end
    end
    
    XOR_NN NN (
        .clock(clock),
        .reset_n(reset_n),
        .x(x_reg),
        .y(y_reg),
        .out(out_wire)
    );

endmodule
