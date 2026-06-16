`timescale 1ns/1ns

module TB_OnePulser;

    logic clk;
    logic btn;
    logic op;
    logic rst;

    // DUT
    OnePulser dut (
        .clk (clk),
        .rst (rst),
        .btn (btn),
        .op  (op)
    );

    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    initial begin
        btn = 0;
        rst = 1;
        #20;
        rst = 0;
        $display("=== First press ===");
        btn = 1;
        #50;     
        btn = 0;
        #50;

        $display("=== Second press ===");
        btn = 1;
        #30;
        btn = 0;
        #40;

        $display("=== Bouncing press ===");
        btn = 1;  #10;
        btn = 0;  #10;
        btn = 1;  #10;
        btn = 0;  #10;
        btn = 1;  #40;
        btn = 0;  #50;

        #100;
        $stop;
    end

    initial begin
        $display(" time   clk  btn  op");
        $monitor("%4t   %0b    %0b    %0b", $time, clk, btn, op);
    end

endmodule
