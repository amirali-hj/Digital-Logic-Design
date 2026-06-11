

`timescale 1ns/1ns

module OAI_transistor(input a,b,c , output w);

supply1 vdd;
supply0 gnd;
wire i,j;

pmos #(5,6,7)T1(w,vdd,c);
pmos #(5,6,7)T2(i,vdd,a);
pmos #(5,6,7)T3(w,i,b);

nmos#(3,4,5)T4(w,j,b);
nmos#(3,4,5)T5(w,j,a);
nmos#(3,4,5)T6(j,gnd,c);

endmodule

