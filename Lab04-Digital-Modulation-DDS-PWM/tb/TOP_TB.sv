`timescale 1ns/1ps

module DataPath_Mod_tb();

    logic clk;
    logic rst;
    logic send;
    logic [4:0] msg;
    logic init;
    logic mode;

    logic out;

    DataPath_Mod UUT (
        .clk(clk),
        .rst(rst),
        .send(send),
        .msg(msg),
        .init(init),
        .mode(mode),
        .out(out)
    );

    always begin
        clk = 0; #10;
        clk = 1; #10;
    end

    initial begin
        rst = 1;
        send = 0;
        msg = 5'b10101;
        init = 0;
        mode = 0;
        #50;            
        
        rst = 0;        
        #20;

        init = 1; 
        #100;
        init = 0;      
        #50;

        send = 1;
        #40;
        send = 0;       
        
        #2000;

        mode = 1;
        #1000;
        
        mode = 0;
        #500;

        $display("Simulation Finished Successfully.");
        $stop; 
    end

    initial begin
        $monitor("Time: %t | Init: %b | Mode: %b | Out: %b", $time, init, mode, out);
    end

endmodule