`timescale 1ns/1ns
module C1B(input [1:0] a,b , output EQ , GT);

	Q1_GT OP1 (a,b,GT);
	Q2_EQ OP2 (a,b,EQ);
endmodule

