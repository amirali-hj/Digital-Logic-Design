`timescale 1ns/1ns
module cmp_16bit(input [15:0]a,b , output GT,EQ);
	wire g0,g1,g2,g3,e0,e1,e2,e3 , G0,G1,E0,E1;
	
	cmp_4bit op1(.a(a[3:0]) , .b(b[3:0]) , .GT_5(g0) , .EQ_5(e0));
	cmp_4bit op2(.a(a[7:4]) , .b(b[7:4]) , .GT_5(g1) , .EQ_5(e1));
	cmp_4bit op3(.a(a[11:8]) , .b(b[11:8]) , .GT_5(g2) , .EQ_5(e2));
	cmp_4bit op4(.a(a[15:12]) , .b(b[15:12]) , .GT_5(g3) , .EQ_5(e3));


	GTEQ op5(.gt({g1,g0}) , .eq({e1,e0}) , .GT(G0) , .EQ(E0));
	GTEQ op6(.gt({g3,g2}) , .eq({e3,e2}) , .GT(G1) , .EQ(E1));


	GTEQ op7(.gt({G1,G0}) , .eq({E1,E0}) , .GT(GT) , .EQ(EQ));
endmodule