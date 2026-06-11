
`timescale 1ns/1ns

module OAI_transistor_TB ();
    logic aa,bb,cc;
    wire ww;

    OAI_transistor CUT1(aa,bb,cc,ww);

    initial begin
        aa=1;
        bb=0;
        cc=1;
        #40 aa=0;
        #40 aa=~aa;
        #90 $stop;
    end
endmodule
