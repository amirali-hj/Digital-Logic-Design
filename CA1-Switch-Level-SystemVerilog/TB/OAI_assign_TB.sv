

`timescale 1ns/1ns

module OAI_assign_TB ();
    reg aa,bb,cc;
    wire ww;

    OAI_assign CUT1(aa,bb,cc,ww);

    initial begin
        aa=1;
        bb=0;
        cc=1;
        #40 aa=0;
        #40 bb=1;
        #60 $stop;
    end
endmodule

