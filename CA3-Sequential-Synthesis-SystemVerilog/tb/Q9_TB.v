`timescale 1ns/1ns

module counter_16bit_cascade_tb;

   
    reg clk_tb;
    reg reset_tb;
    reg [1:0] mode_select_tb;
    reg ci_tb;
    reg [15:0] b_parallel_val_tb;
    wire [15:0] current_count_q_tb;
    wire co_tb;

  
    counter_16bit_cascade UUT (
        .clk(clk_tb),
        .reset(reset_tb),
        .mode_select(mode_select_tb),
        .ci(ci_tb),
        .b_parallel_val(b_parallel_val_tb),
        .current_count_q(current_count_q_tb),
        .co(co_tb)
    );

    always #100 clk_tb = ~clk_tb;

    initial begin
        


        clk_tb = 0;
        reset_tb = 1;
        mode_select_tb = 2'b00;
        ci_tb = 0;
        b_parallel_val_tb = 16'h0000;


        #80;
        reset_tb = 0;
        #80;

   
        mode_select_tb = 2'b01;
        ci_tb = 0;
        b_parallel_val_tb = 16'h0000;
        #80;
        if (current_count_q_tb != 16'h0001) begin
            $display("??? ?? ????? ???? ?? ci=0");
        end
        ci_tb = 1;
        #80;
        if (current_count_q_tb != 16'h0003) begin
            $display("??? ?? ????? ???? ?? ci=1");
        end

        // ??? ????? ????? (mode_select = 2'b10)
        mode_select_tb = 2'b10;
        ci_tb = 0;
        b_parallel_val_tb = 16'h0000;
        #80;
        if (current_count_q_tb != 16'h0002) begin
            $display("??? ?? ????? ????? ?? ci=0");
        end
        ci_tb = 1;
        #80;
        if (current_count_q_tb != 16'h0000) begin
            $display("??? ?? ????? ????? ?? ci=1");
        end

        // ??? ???????? ????? (mode_select = 2'b11)
        mode_select_tb = 2'b11;
        b_parallel_val_tb = 16'hA5A5;
        #80;
        if (current_count_q_tb != 16'hA5A5) begin
            $display("??? ?? ???????? ?????");
        end

        // ??? ?? ?????? ??????
        repeat(10) begin
            mode_select_tb = $random%4;
            repeat(10) begin
                ci_tb = $random%2;
                b_parallel_val_tb = $random%256;
                #100;
                $display("???? ???: mode_select=%b, ci=%b, b_parallel_val=%h, ?????=%h", mode_select_tb, ci_tb, b_parallel_val_tb, current_count_q_tb);
            end
        end

        // ????? ?????????
        #80;
        $stop;
    end

endmodule
