`timescale 1ns/1ns
module rigester_8bit_Q5_TB;
    reg  [7:0] tb_D_in_reg;
    reg        tb_Enable_reg;
    reg        tb_Reset_reg;
    wire [7:0] tb_Q_out_reg;
    wire [7:0] tb_Q_bar_out_reg;

    Register_8bit_From_D_Latch dut_register (
        .D_in_reg(tb_D_in_reg),
        .Clk_reg(tb_Enable_reg),
        .Reset_reg(tb_Reset_reg),
        .Q_out_reg(tb_Q_out_reg),
        .Q_bar_out_reg(tb_Q_bar_out_reg)
    );

    initial begin
        tb_D_in_reg = 8'h00;
        tb_Enable_reg = 0;
        tb_Reset_reg = 0;
        #20;

        tb_Reset_reg = 1;
        #10;
        tb_Enable_reg = 1;
        #30; 
        tb_Enable_reg = 0;
        #10;
        tb_Reset_reg = 0;
        #20;

        tb_D_in_reg = 8'hA5;
        #10;
        tb_Enable_reg = 1;
        #30; 
        tb_Enable_reg = 0;
        #20; 

        tb_D_in_reg = 8'hF0; 
        #30; 

        tb_Enable_reg = 1;
        #10; 
        tb_D_in_reg = 8'h3C; 
        #30; 
        tb_Enable_reg = 0;
        #20;

        tb_Reset_reg = 1;
        #10;
        tb_Enable_reg = 1;
        #30;
        tb_Enable_reg = 0;
        #10;
        tb_Reset_reg = 0;
        #20;
        
        #20 $stop;
    end

endmodule
