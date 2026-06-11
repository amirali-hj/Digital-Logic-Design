

`timescale 1ns/1ns

module NOR_2inputs_TB();
    reg aa,bb;
    wire ww;
    
    NOR_2inputs CUT1(aa,bb,ww);

    initial begin
	bb=0;
        aa=0;
        #20 aa=1;
        #20 aa=0;
        #20 $stop;
    end

endmodule

