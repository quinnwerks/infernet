module counter #(parameter SIZE=8)(
    input              CLK,
    input              RESET,
    input              ENABLE,
    output [SIZE-1:0]  VALUE
);
logic [SIZE-1:0] value;
always_ff @ (posedge CLK or posedge RESET) begin
    if (RESET) begin
        value <= 'd0;
    end
    else if (ENABLE) begin
        value <= value + 'd1;
    end
end

assign VALUE = value;
endmodule