
`timescale 1ns/1ns

module OAI_myNOR_TB ();
    reg aa,bb,cc;
    wire ww;

    OAI_myNOR CUT1(aa,bb,cc,ww);

    initial begin
        aa=1;
        bb=0;
        cc=1;
        #40 cc=0;
        #40 cc=~cc;
        #60 $stop;
    end
endmodule

