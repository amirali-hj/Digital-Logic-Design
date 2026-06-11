`timescale 1ns/1ns

module cmp_4bit(input [3:0]a,b , output GT_5,EQ_5);
wire gt0 , eq0 , gt1 , eq1;

C1B op1(.a(a[1:0]) , .b(b[1:0]) , .GT(gt0) , .EQ(eq0));
C1B op2(.a(a[3:2]) , .b(b[3:2]) , .GT(gt1) , .EQ(eq1));

GTEQ op3(.gt({gt1,gt0}) , .eq({eq1,eq0}) , .GT(GT_5) , .EQ(EQ_5));

endmodule
