
` timescale 1ns/1ns
module Q1_GT(input [1:0] a,b, output GT);

assign #35 GT = (a[1]>b[1]) ? 1'b1:
		(a[0]>b[0]) ? 1'b1:
		1'b0;
endmodule
