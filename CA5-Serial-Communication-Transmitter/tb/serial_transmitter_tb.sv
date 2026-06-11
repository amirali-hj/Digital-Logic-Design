

`timescale 1ns/1ns

module serial_transmitter_tb;

    logic clk, rst, rcIn;
    logic txOut1, txValid1, txAbort1;
    logic txOut2, txValid2, txAbort2;


    top_module dut (
        .clk(clk),
        .rst(rst),
        .rcIn(rcIn),
        .txOut(txOut1),
        .txValid(txValid1),
        .txAbort(txAbort1)
    );

	    top_module_post cut (
        .clk(clk),
        .rst(rst),
        .rcIn(rcIn),
        .txOut(txOut2),
        .txValid(txValid2),
        .txAbort(txAbort2)
    );


    // Clock generation: 100MHz
    always #5 clk = ~clk;

    // Task: ????? ?? ???? ?? ???? MSB ???
    task send_byte(input [7:0] data);
        for (int i = 7; i >= 0; i--) begin
            rcIn = data[i];
            #(10); // ?? ???? ????
        end
    endtask

    // Task: ????? n ??? ???? (????? 1 ?? 0)
    task send_bits(input logic bit_val, input int count);
        for (int i = 0; i < count; i++) begin
            rcIn = bit_val;
            #(10);
        end
    endtask

    initial begin
         $dumpfile("wave.vcd");
        $dumpvars;


        clk = 0;
        rst = 1;
        rcIn = 1;
        #20;
        rst = 0;

        // --- ??? ???: Start Sequence ? ????? ?? 97 ??? ---
        send_byte(8'b01111110);    // start sequence

        // ????? 97 ??? ???? (????? ??? 1)
        send_bits(1, 97);          // ??? ?? ???? txValid ???? ??? ???

        // ??? ??? ???? ?? ????? ?????? ?? IDLE
        send_bits(1, 20);

        // --- ??? ???: Start Sequence ? ??? ?? Abort ---
        send_byte(8'b01111110);    // start again
        send_bits(0, 10);          // ??? ??? ???? ???

        send_byte(8'b10000001);    // abort sequence

        send_bits(1, 20);          // ??? ??? ???? ???? ?????? ?????

        $stop;
    end

endmodule
