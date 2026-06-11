`timescale 1ns/1ns

module tb_counter_4in1_Q8;

    reg        tb_enable_clk;
    reg        tb_reset_reg;
    reg [1:0]  tb_mode_select;
    reg        tb_carry_in_lb;
    reg [7:0]  tb_b_parallel_val;

    wire [7:0] dut_current_count_q , dut_current_count_q_syn;
    wire       dut_carry_out_lb , dut_carry_out_lb_syn;

    counter_4in1_Q8 dut (
        .clk(tb_enable_clk),
        .reset(tb_reset_reg),
        .mode_select(tb_mode_select),
        .ci(tb_carry_in_lb),
        .b_parallel_val(tb_b_parallel_val),
        .current_count_q(dut_current_count_q),
        .co(dut_carry_out_lb)
    );

counter_4in1_Q8_syn dut2 (
        .clk(tb_enable_clk),
        .reset(tb_reset_reg),
        .mode_select(tb_mode_select),
        .ci(tb_carry_in_lb),
        .b_parallel_val(tb_b_parallel_val),
        .current_count_q(dut_current_count_q_syn),
        .co(dut_carry_out_lb_syn)
    );

    initial begin

        tb_enable_clk = 0;
        tb_reset_reg = 1;
        tb_mode_select = 2'b00;
        tb_carry_in_lb = 0;
        tb_b_parallel_val = 8'h00;
        #80;

       
        tb_reset_reg = 0;
        #80;

     
        tb_mode_select = 2'b11;
        tb_b_parallel_val = 8'h00;
        #80;
        tb_enable_clk = 1; 
        #80;               
        tb_enable_clk = 0;
        #80;              

        
        
        tb_mode_select = 2'b00;
        tb_b_parallel_val = 8'hFF; 
        tb_carry_in_lb = 1;      
        #100;
        tb_enable_clk = 1;
        #100;
        tb_enable_clk = 0;
        #100;               

       
        tb_mode_select = 2'b01;
        tb_carry_in_lb = 1; 
        #100;
        tb_enable_clk = 1;
        #100;
        tb_enable_clk = 0;
        #100;                       
        #100;
        tb_enable_clk = 1; 
        #80;
        tb_enable_clk = 0;
        #100;              

       
        tb_carry_in_lb = 1;
        #100;
	repeat (10) begin
        tb_enable_clk = 1;
        #120;
        tb_enable_clk = 0;
        #120;              
	end
      
        
        tb_mode_select = 2'b10;
        tb_carry_in_lb = 0; 
        #80;
        tb_enable_clk = 1; 
        #80;
        tb_enable_clk = 0;
        #80;     
	repeat (10) begin
        tb_enable_clk = 1;
        #120;
        tb_enable_clk = 0;
        #120;              
	end          
	
        
        #80;
        tb_enable_clk = 1; 
        #100;
        tb_enable_clk = 0;
        #100;               

      
        tb_carry_in_lb = 1; 
        #100;
        tb_enable_clk = 1;
        #80;
        tb_enable_clk = 0;
        #100;               

        
        tb_mode_select = 2'b11;
        tb_b_parallel_val = 8'h55;
        #100;
        tb_enable_clk = 1;
        #80;
        tb_enable_clk = 0;
        #80;              
        tb_b_parallel_val = 8'hCC;
        #100;
        tb_enable_clk = 1;
        #80;
        tb_enable_clk = 0;
        #100;               

        #20 $stop;
    end

endmodule
