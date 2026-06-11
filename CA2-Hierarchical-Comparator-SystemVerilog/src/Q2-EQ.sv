
` timescale 1ns/1ns
module Q2_EQ(input[1:0]a,b, output EQ);
	assign #56  EQ = (a==b)?1'b1:
		((a>b) || (b>a))?1'b0:
		1'bx;
endmodule


