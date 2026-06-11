
`timescale 1ns/1ns
module Q6_TB();
logic [15:0]aa,bb;
wire GT_t , EQ_t;

cmp_16bit CUT1(.a(aa),.b(bb),.GT(GT_t),.EQ(EQ_t));
	initial begin
		aa=0;
		bb=0;
		#200 aa=1;
		#200 bb=1;
		repeat (50) begin
				#200;
				aa= $random %65536;
				bb= $random %65536;
		end;
	#200 aa=7000;
	bb=7000;
	#200 aa=10;
	bb=30;
	#400 $stop;
	end;
endmodule
