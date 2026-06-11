`timescale 1ns/1ns
module asg_2bit_eq (input [1:0]a,b,output EQ);

assign #40  EQ = (a == b) ? 1'b1 :
	    ((a>b) || (a<b)) ?1'b0 : 1'bx;

endmodule 
