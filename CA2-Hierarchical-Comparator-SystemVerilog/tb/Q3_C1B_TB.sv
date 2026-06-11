
` timescale 1ns/1ns
module Q3_C1B_TB();
logic [1:0] aa,bb;
wire GTtb,EQtb;

Q3_C1B CUT1(.a(aa),.b(bb),.GT(GTtb),.EQ(EQtb));
initial begin
	aa=0;
	bb=1;
	#120 aa=1;
	#120 bb=3;
	repeat (16) begin
		#90;
		aa= $random %4;
		bb= $random %4;
	end;
	#30 $stop;
	end

endmodule
