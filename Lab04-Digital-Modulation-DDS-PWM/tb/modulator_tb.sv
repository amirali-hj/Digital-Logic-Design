`timescale 1ns/1ps

module modulator_tb();

    logic        clk = 0;
    logic        rst;
    logic        send;
    logic        mode;
    logic        init;
    logic [4:0]  msg;
    logic [7:0]  out_mod;

    always #10 clk = ~clk;

    modulator uut (
        .clk(clk),
        .rst(rst),
        .send(send),
        .mode(mode),
        .msg(msg),
        .init(init),
        .out_mod(out_mod)
    );

    initial begin
        mode = 1'b0;
        send = 1'b0;
        msg  = 5'b0;
        init = 1'b1;

        rst = 1'b1;
        #20;
        init = 1'b0;
        rst = 1'b0;
        #20;
        init = 1'b1;

        msg = 5'b01101;
        
        @(posedge clk);
        send = 1'b1;

        #1_000_000;

        mode = 1'b0;
        init = 1'b0;
        rst  = 1'b1;
        #20;
        rst  = 1'b0;
        init = 1'b1;
        
        msg  = 5'b01101;
        @(posedge clk);
        send = 1'b1;
        @(posedge clk);
        send = 1'b0;
        */

        $display("Simulation Finished at %t", $time);
        $stop;
    end

endmodule
