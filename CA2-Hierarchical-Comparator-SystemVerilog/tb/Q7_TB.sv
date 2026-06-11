
`timescale 1ns/1ns
module Q7_TB();
parameter N=16;
logic [0:N-1]aa,bb;
wire GT_t , EQ_t;


Q7 CUT1(.A(aa),.B(bb),.GT(GT_t),.EQ(EQ_t));
	initial begin
		aa=0;
		bb=0;
		#200 aa=1;
		#200 bb=1;
		repeat (50) begin
				#200;
				aa= $random %2**N;
				bb= $random %2**N;
		end;
	#200 aa=12;
	bb=12;
	#200 aa=10;
	bb=13;
	#400 $stop;
	end;
endmodule