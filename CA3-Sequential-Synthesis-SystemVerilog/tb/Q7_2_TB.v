
`timescale 1ns/1ns
module register_tb;
    reg [7:0] D;
    reg clk, re;
    wire [7:0] g,g_always;

    register_8bit uut (
        .PI(D),
        .clk(clk),
        .rst(re),
        .PO(g)
    );
     register_always cut(
	.PI(D),
        .clk(clk),
        .rst(re),
        .PO(g_always)
     );

    initial begin
        clk = 0;
        forever #40 clk = ~clk; 
    end


    initial begin

        D = 8'b00000000;
        re = 1; 
        #160;

        re = 0; D = 8'b10101010; #160;

        re = 1; D = 8'b11110000; #160;

        re = 0; #30;
        D = 8'b01010101; #160;

        D = 8'b11111111; re = 1; #160;

	
	D = 8'b10101111; re = 0; #160;

	D = 8'b10001000; re = 0; #160;

	re = 1; #160
	re = 0;#20;

	repeat(5)begin
		D = $random %256;#160;
	end
		

       #160;
	$stop;
    end
endmodule

