`timescale 1ns/1ns

module TB_msg;

    logic clk;
    logic rst;
    logic send;
    logic [4:0] msg;
    logic serout;

    // DUT
    Top_msg dut (
        .clk    (clk),
        .rst    (rst),
        .send   (send),
        .msg    (msg),
        .serout (serout)
    );

    // Clock: 10ns period
    always #5 clk = ~clk;

    initial begin
        // init
        clk  = 0;
        rst  = 1;
        send = 0;
        msg  = 5'b0;

        // reset
        #20;
        rst = 0;

        // set message
        #10;
        msg = 5'b11011;

        // send pulse
        #10;
        send = 1;
        // #10;
        // send = 0;

        // // wait for transmission to finish
        // #500;

        // // second message
        // msg = 5'b11001;
        // #10;
        // send = 1;
        // #10;
        // send = 0;

        #1000000;

        $stop;
    end

endmodule
