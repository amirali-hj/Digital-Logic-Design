`timescale 1ns/1ns
module tb_sequence_detector;

    logic clk, rst, J;
    logic detected;

    sequence_detector dut (
        .clk(clk),
        .rst(rst),
        .J(J),
        .detected(detected)
    );

    initial clk = 0;
    always #5 clk = ~clk;

    initial begin

        rst = 1; J = 0;
        #10;
        rst = 0;

        J = 1; #10;
        J = 0; #10;
        J = 0; #10;
        J = 0; #10;
        J = 0; #10;
        J = 0; #10;
        J = 0; #10;
        J = 1; #10;

        J = 0; #20;

        J = 1; #10;
        J = 0; #10;
        J = 0; #10;
        J = 0; #10;
        J = 0; #10;
        J = 0; #10;
        J = 1; #10;

        #20;
        $stop;
    end

endmodule

