`timescale 1ns/1ns

module tb_LogicBlock_Simple_syn_random;

    reg [7:0] test_A, test_B;
    reg [1:0] test_m;
    reg       test_ci;
    wire      dut_co;
    wire [7:0] dut_w;

    LogicBlock_Combinational_V_syn dut (
        .A(test_A),
        .B(test_B),
        .m(test_m),
        .ci(test_ci),
        .co(dut_co),
        .w(dut_w)
    );

    initial begin
        test_A = 8'h12; test_B = 8'hFF; test_m = 2'b00; test_ci = 1'b0;
        #10;

        test_A = 8'hAA; test_B = 8'hFF; test_m = 2'b01; test_ci = 1'b1;
        #10; 

        test_A = 8'hBB; test_B = 8'hFF; test_m = 2'b01; test_ci = 1'b0;
        #10; 

        test_A = 8'hCC; test_B = 8'hFF; test_m = 2'b10; test_ci = 1'b0;
        #10; 

        test_A = 8'hDD; test_B = 8'hFF; test_m = 2'b10; test_ci = 1'b1;
        #10; 

        test_A = 8'hEE; test_B = 8'h55; test_m = 2'b11; test_ci = 1'b0;
        #10; 

        test_A = 8'b11111111; test_B = 8'b11110000; test_m = 2'b01; test_ci = 1'b1;
        #10; 

        repeat (20) begin
            test_A = $urandom_range(0, 255);
            test_B = $urandom_range(0, 255);
            test_m = $urandom_range(0, 3);
            test_ci = $urandom_range(0, 1);
            #10;
        end

        test_m = 2'b01;
        repeat (10) begin
            test_A = $urandom_range(0, 255);
            test_B = 8'hXX; 
            test_ci = $urandom_range(0, 1);
            #10;
        end

        #10 $finish;
    end

endmodule