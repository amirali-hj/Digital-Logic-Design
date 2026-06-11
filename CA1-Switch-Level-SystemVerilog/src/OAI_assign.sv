
`timescale 1ns/1ns

module OAI_assign (input a,b,c, output w);

    assign #(10,14) w = ~((a|b) & c);
    
endmodule
