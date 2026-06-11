
`timescale 1ns/1ns

module OAI_ALL_TB ();

    logic aa,bb,cc;
    wire ww1,ww2,ww3;

    OAI_transistor CUT1(aa,bb,cc,ww1);
    OAI_myNOR CUT2(aa,bb,cc,ww2);
    OAI_assign CUT3(aa,bb,cc,ww3);
    initial begin
        aa=1;
        bb=0;
        cc=1;
        #50 aa=0;
        #50 aa=~aa;
        #80 $stop;
    end
 
endmodule
