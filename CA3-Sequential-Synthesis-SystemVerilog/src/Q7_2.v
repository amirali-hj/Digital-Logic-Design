`timescale 1ns/1ns
module register_8bit(input [7:0]PI , input clk , rst , output [7:0]PO );

genvar i;
	generate
		for(i=0 ; i<8 ; i=i+1)
			D_flipflop_Q7 D1(.D(PI[i]),.clk(clk),.rst(rst),.Q(PO[i]));
	endgenerate
endmodule
