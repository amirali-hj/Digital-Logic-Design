`timescale 1ns/1ns
module counter_4in1_Q8(
	input  clk,     
    	input  reset,      
    	input [1:0] mode_select,    
    	input        ci ,    
    	input [7:0]  b_parallel_val, 
	
    	output [7:0] current_count_q, 
    	output  co  
	);

	wire [7:0] w_next_state_internal; 
    	wire [7:0] q_current_state_internal; 
   	wire [7:0] q_bar_internal;       
   
    register_8bit U_REG (
        .PI(w_next_state_internal), 
        .clk(clk),          
        .rst(reset),
        .PO(q_current_state_internal)
       
    );

    
    LogicBlock_Combinational_SV U_LB (
        .A(q_current_state_internal), 
        .B(b_parallel_val),           
        .m(mode_select),
        .ci(ci),             
        .w(w_next_state_internal),    
        .co(co)          
    );
assign current_count_q = q_current_state_internal;

endmodule