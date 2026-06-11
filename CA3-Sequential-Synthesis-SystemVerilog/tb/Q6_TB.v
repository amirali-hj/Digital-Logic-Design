`timescale 1ns/1ns

module tb_counter_4in1_Q6_cor;

    reg        tb_enable_clk;
    reg        tb_reset_reg;
    reg [1:0]  tb_mode_select;
    reg        tb_carry_in_lb;
    reg [7:0]  tb_b_parallel_val;

    wire [7:0] dut_current_count_q ,dut_current_count_q_syn ;
    wire       dut_carry_out_lb , dut_carry_out_lb_syn;

   
    counter_4in1_Q6_corrected dut (
        .enable_clk(tb_enable_clk),
        .reset_reg(tb_reset_reg),
        .mode_select(tb_mode_select),
        .carry_in_lb(tb_carry_in_lb),
        .b_parallel_val(tb_b_parallel_val),
        .current_count_q(dut_current_count_q),
        .carry_out_lb(dut_carry_out_lb)
    );

 counter_4in1_Q6_syn dut2 (
        .enable_clk(tb_enable_clk),
        .reset_reg(tb_reset_reg),
        .mode_select(tb_mode_select),
        .carry_in_lb(tb_carry_in_lb),
        .b_parallel_val(tb_b_parallel_val),
        .current_count_q(dut_current_count_q_syn),
        .carry_out_lb(dut_carry_out_lb_syn)
    );


    initial begin
  
        tb_enable_clk = 0;
        tb_reset_reg = 1;
        tb_mode_select = 2'b00;
        tb_carry_in_lb = 0;
        tb_b_parallel_val = 8'h00;
        #20;

        tb_reset_reg = 0;
        #20;

       
        tb_mode_select = 2'b11;
        tb_b_parallel_val = 8'h00;
        #10;
        tb_enable_clk = 1; 
        #40;           
        tb_enable_clk = 0;
        #40;              

       
        tb_mode_select = 2'b00;
        tb_b_parallel_val = 8'hFF; 
        tb_carry_in_lb = 1;     
        #10;
        tb_enable_clk = 1;
        #40;
        tb_enable_clk = 0;
        #40;               

        
        tb_mode_select = 2'b01;
        tb_carry_in_lb = 1; 
        #10;
        tb_enable_clk = 1; 
        #40;
        tb_enable_clk = 0;
        #40;             

        
        #10;
        tb_enable_clk = 1; 
        #40;
        tb_enable_clk = 0;
        #40;               

        
        tb_carry_in_lb = 0; 
        #10;
        tb_enable_clk = 1;
        #40;
        tb_enable_clk = 0;
        #40;               

     
        tb_mode_select = 2'b10;
        tb_carry_in_lb = 0;
        #10;
        tb_enable_clk = 1; 
        #40;
        tb_enable_clk = 0;
        #40;              

        #10;
        tb_enable_clk = 1; 
        #40;
        tb_enable_clk = 0;
        #40;               

       
        tb_carry_in_lb = 1; 
        #10;
        tb_enable_clk = 1;
        #40;
        tb_enable_clk = 0;
        #40;              

        tb_mode_select = 2'b11;
        tb_b_parallel_val = 8'h55;
        #10;
        tb_enable_clk = 1;
        #40;
        tb_enable_clk = 0;
        #40;     

        tb_b_parallel_val = 8'hCC;
        #10;
        tb_enable_clk = 1;
        #40;
        tb_enable_clk = 0;
        #40;              
	
	repeat(20)begin
		tb_mode_select = $random % 4;
		tb_b_parallel_val = $random % 256;
		tb_carry_in_lb = $random % 2 ;
		tb_enable_clk = 1;
		#80;
		tb_enable_clk = 0;
		#80;
	end
	
        #20 $stop;
    end

endmodule
