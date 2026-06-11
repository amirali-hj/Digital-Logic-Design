
`timescale 1ns/1ns
module Q6();
	logic aa0,bb0,bb1,aa1;
	wire gg;
	Q5_func UT(aa1,aa0,bb1,bb0,gg);
	initial begin
	aa1=1;
	aa0=1;
	bb0=1;
	bb1=0;
	
	#120 bb1=1;
	#120 aa0=0;
	#120 bb1=0;
	#250 $stop;
	end
endmodule
