`timescale 1ns/1ns
module SR_latch_st_clk(input S , R , clk ,output w , w_bar);
	wire j ,k;
	nand #8 N1(j,S,clk);
	nand #8 N2(k,R,clk);
	nand #8 N3(w,j,w_bar);
	nand #8 N4(w_bar,k,w);
endmodule