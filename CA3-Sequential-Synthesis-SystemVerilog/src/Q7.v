`timescale 1ns/1ns 

module D_flipflop_Q7(input D , clk , rst , output Q);
wire Q_middle,clk_bar;

D_Latch_With_Reset_Part4 D2(.D_in(D),.CLK_D(clk),.RESET_D(rst),.Q_out(Q_middle),.Q_bar_out());

not N1(clk_bar,clk); 

D_Latch_With_Reset_Part4 D3(.D_in(Q_middle),.CLK_D(clk_bar),.RESET_D(rst),.Q_out(Q),.Q_bar_out());

endmodule
