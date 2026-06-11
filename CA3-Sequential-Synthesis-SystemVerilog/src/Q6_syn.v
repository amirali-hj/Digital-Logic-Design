
`timescale 1ns/1ns
module counter_4in1_Q6_syn (
    
    input        enable_clk,     
    input        reset_reg,      
    input [1:0]  mode_select,    
    input        carry_in_lb,    
    input [7:0]  b_parallel_val, 

   
    output [7:0] current_count_q, 
    output       carry_out_lb      
);

    wire [7:0] w_next_state_internal; 
    wire [7:0] q_current_state_internal; 
    wire [7:0] q_bar_internal;       
   
    Register_8bit_From_D_Latch U_REG (
        .D_in_reg(w_next_state_internal), 
        .Clk_reg(enable_clk),          
        .Reset_reg(reset_reg),
        .Q_out_reg(q_current_state_internal),
        .Q_bar_out_reg(q_bar_internal)
    );

    
    LogicBlock_Combinational_synth U_LB (
        .A(q_current_state_internal), 
        .B(b_parallel_val),           
        .m(mode_select),
        .ci(carry_in_lb),             
        .w(w_next_state_internal),    
        .co(carry_out_lb)          
    );

    
    assign current_count_q = q_current_state_internal;

endmodule