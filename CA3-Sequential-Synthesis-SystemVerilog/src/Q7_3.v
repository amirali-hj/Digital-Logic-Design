`timescale 1ns/1ns
module register_always(input [7:0] PI , input clk , rst , output reg [7:0] PO);
	always@(posedge clk , posedge rst)begin
		if(rst)#72 PO<=8'b0;
		else #72 PO<=PI;
	end
endmodule

