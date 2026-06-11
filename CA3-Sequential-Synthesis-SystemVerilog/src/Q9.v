`timescale 1ns/1ns

module counter_16bit_cascade(
    input clk,
    input reset,
    input [1:0] mode_select,
    input ci,
    input [15:0] b_parallel_val,
    output [15:0] current_count_q,
    output co
);

    
    wire carry_out_8bit_1;
    reg carry_in_8bit_2;

    
    counter_4in1_Q8 U_COUNTER_LOW (
        .clk(clk),
        .reset(reset),
        .mode_select(mode_select),
        .ci(ci),
        .b_parallel_val(b_parallel_val[7:0]),
        .current_count_q(current_count_q[7:0]),
        .co(carry_out_8bit_1)
    );

    
    always @(*) begin
        case (mode_select)
            2'b00: carry_in_8bit_2 = carry_out_8bit_1;      
            2'b01: carry_in_8bit_2 = carry_out_8bit_1;       
            2'b10: carry_in_8bit_2 = ~carry_out_8bit_1;     
            2'b11: carry_in_8bit_2 = 1'b0;                  
            default: carry_in_8bit_2 = 1'b0;
        endcase
    end

   
    counter_4in1_Q8 U_COUNTER_HIGH (
        .clk(clk),
        .reset(reset),
        .mode_select(mode_select),
        .ci(carry_in_8bit_2), 
        .b_parallel_val(b_parallel_val[15:8]), 
        .current_count_q(current_count_q[15:8]), 
        .co(co)
    );

endmodule

