`timescale 1ns/1ns
module Q5_TB();
logic [3:0]aa,bb;
wire GT_t , EQ_t;

cmp_4bit CUT1(.a(aa),.b(bb),.GT_5(GT_t),.EQ_5(EQ_t));
	initial begin
		aa=0;
		bb=0;
		#120 aa=1;
		#120 bb=1;
		repeat (20) begin
				#160;
				aa= $random %16;
				bb= $random %16;
		end;
	#60 $stop;
	end;
endmodule

