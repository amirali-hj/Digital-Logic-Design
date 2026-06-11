
`timescale 1ns/1ns

module GTEQ(input [1:0] gt,eq , output GT , EQ);

assign #42 GT = (gt[1]||(eq[1]&gt[0]));
assign #42 EQ = (eq[1]&eq[0]);

endmodule


