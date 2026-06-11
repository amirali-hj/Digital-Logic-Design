
`timescale 1ns/1ns

module OAI_myNOR (input a,b,c, output w);
    wire i,j,q;

    NOR_2inputs N1 (a,b,j);
    NOR_2inputs N2 (c,c,i);
    NOR_2inputs N3 (j,i,q);
    NOR_2inputs N4 (q,q,w);
 
endmodule