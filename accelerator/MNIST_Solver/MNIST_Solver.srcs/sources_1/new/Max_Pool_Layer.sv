`timescale 1ns / 1ps

module Max_Pool_Layer (
    // Control signals
    input clock,
    input reset_n,
    input start,
    output logic done,
    
    // Channel to read data in
    input signed [17:0] in_data [5:0],
    output logic [4:0] in_row,
    output logic [4:0] in_col,
    
    // Output data
    output logic signed [17:0] out_data [5:0],
    output logic [4:0] out_row,
    output logic [4:0] out_col,
    output logic out_w_enable
);

    logic [4:0] in_row_major, in_col_major, in_row_offset, in_col_offset;
    logic pool_enable;
    logic signed [17:0] max [5:0];
    logic done_cell, done_cell_buf;
    
    assign in_row = in_row_major + in_row_offset;
    assign in_col = in_col_major + in_col_offset;
    
    // Control logic for writing data in/out
    always_ff @(posedge clock) begin
        if (reset_n == 1'b0) begin
            done <= 1'b0;
            pool_enable <= 1'b0;
        
            in_row_major <= 'b0;
            in_col_major <= 'b0;
            in_row_offset <= 'b0;
            in_col_offset <= 'b0;
            
            out_row <= 'b0;
            out_col <= 'b0;
            out_w_enable <= 'b0;
            
            max <= '{6{18'b1_0000000_0000000000}};
            out_data <= '{6{18'b0}};
            done_cell <= 1'b0;
            done_cell_buf <= 1'b0;
        end else begin
            done_cell_buf <= done_cell;
            if (start && !pool_enable) begin
                pool_enable <= 1'b1;
            end
            if (pool_enable) begin
                // Control offsets
                if (!done_cell) begin
                    if (in_row_offset == 5'd2 && in_col_offset == 5'd2) begin
                        in_row_offset <= 5'd0;
                        in_col_offset <= 5'd0;
                        done_cell <= 1'b1;
                    end else if (in_col_offset == 5'd2) begin
                        in_row_offset <= in_row_offset + 1;
                        in_col_offset <= 5'd0;
                    end else begin
                        in_col_offset <= in_col_offset + 1;
                    end
                end
                
                // Control max
                if (done_cell_buf) begin
                    max <= '{6{18'b1_0000000_0000000000}};
                end else begin
                    for (int i = 0; i < 6; i++) begin
                        max[i] <= (in_data[i] > max[i]) ? in_data[i] : max[i];
                    end
                end
                
                // Control input row/col
                if (done_cell) begin
                    if (in_row_major == 5'd24 && in_col_major == 5'd24) begin
                        done <= 1'b1;
                        in_row_major <= 5'd0;
                        in_col_major <= 5'd0;
                    end else if (in_col_major == 5'd24) begin
                        in_row_major <= in_row_major + 3;
                        in_col_major <= 5'd0;
                    end else begin
                        in_col_major <= in_col_major + 3;
                    end
                end
                
                // Control output write data
                if (done_cell_buf) begin
                    out_data <= max;
                    out_w_enable <= 1'b1;
                end
                
                // Control output row/column
                if (out_w_enable) begin
                    out_w_enable <= 1'b0;
                    
                    if (out_row == 5'd8 && out_col == 5'd8) begin
                        out_row <= 5'd0;
                        out_col <= 5'd0;
                    end else if (out_col == 5'd8) begin
                        out_row <= out_row + 1;
                        out_col <= 5'd0;
                    end else begin
                        out_col <= out_col + 1;
                    end
                end
                
                if (done_cell) begin
                    done_cell <= 1'b0;
                end
            end
            // We do this to make "done" a 1-cycle pulse
            // We also use "done" to effectively be a reset for the module
            if (done) begin
                done <= 1'b0;
                pool_enable <= 1'b0;
        
                in_row_major <= 'b0;
                in_col_major <= 'b0;
                in_row_offset <= 'b0;
                in_col_offset <= 'b0;
                
                out_row <= 'b0;
                out_col <= 'b0;
                out_w_enable <= 'b0;
                
                max <= '{6{18'b1_0000000_0000000000}};
                out_data <= '{6{18'b0}};
                done_cell <= 1'b0;
            end
        end
    end

endmodule
