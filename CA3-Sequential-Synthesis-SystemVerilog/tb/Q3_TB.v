`timescale 1ns/1ns

module tb_SR_latch_memory_loss_extended;

    reg  S_tb, R_tb, clk_tb;
    wire w_tb, w_bar_tb;

    SR_latch_st_clk dut (
        .S(S_tb),
        .R(R_tb),
        .clk(clk_tb),
        .w(w_tb),
        .w_bar(w_bar_tb)
    );

    initial begin
        S_tb = 0; R_tb = 0; clk_tb = 0;
        #20; 

        S_tb = 1; R_tb = 0; 
        #1; clk_tb = 1; 
        #20; 
        clk_tb = 0;
        #20; 

        S_tb = 0; R_tb = 0; 
        #1; clk_tb = 1; 
        #20; 

        S_tb = 1; R_tb = 1; 
        #1; 
        #30; 

        S_tb = 0; R_tb = 0; 
        #1; 
        #30; 
        
        clk_tb = 0;
        #20; 
        
        S_tb = 0; R_tb = 0; 
        #1; clk_tb = 1; 
        #30; 
        clk_tb = 0;
        #20;


        S_tb = 0; R_tb = 1; 
        #1; clk_tb = 1; 
        #20; 
        clk_tb = 0;
        #20; 

        S_tb = 0; R_tb = 0; 
        #1; clk_tb = 1; 
        #20; 

        S_tb = 1; R_tb = 1; 
        #1;  
        #30; 

        clk_tb = 0; 
        #1; 
        #30; 

        S_tb = 0; R_tb = 0; 
        #1; clk_tb = 1; 
        #30; 
        clk_tb = 0;
        #20;

        S_tb = 1; R_tb = 0; clk_tb = 0;
        #20;
        S_tb = 1; R_tb = 0; clk_tb = 1;
        #20;
        S_tb = 1; R_tb = 1; clk_tb = 1;
        #20;
        S_tb = 0; R_tb = 1; clk_tb = 1; 
        #20;
        S_tb = 0; R_tb = 0; clk_tb = 1;
        #20;
        clk_tb = 0;
        #20;

        #20 $stop;
    end

endmodule