
`timescale 1ns/1ns

module tb_LogicBlock_Simple;

    logic [7:0] test_A, test_B;
    logic [1:0] test_m;
    logic       test_ci;
    logic       dut_co;
    logic [7:0] dut_w;

    // Instantiate the Device Under Test (DUT)
    LogicBlock_Combinational_SV dut (
        .A(test_A),
        .B(test_B),
        .m(test_m),
        .ci(test_ci),
        .co(dut_co),
        .w(dut_w)
    );

    initial begin
        // Test Mode 00: W = A
        test_A = 8'h12; test_B = 8'hFF; test_m = 2'b00; test_ci = 1'b0;
	#10
        // Test Mode 01: W = A+1 if Ci=1
        test_A = 8'hAA; test_B = 8'hFF; test_m = 2'b01; test_ci = 1'b1;
        #10
        test_A = 8'hBB; test_B = 8'hFF; test_m = 2'b01; test_ci = 1'b0; // Ci=0, W should be A
     	#10
        // Test Mode 10: W = A-1 if Ci=0
        test_A = 8'hCC; test_B = 8'hFF; test_m = 2'b10; test_ci = 1'b0;
        #10
        test_A = 8'hDD; test_B = 8'hFF; test_m = 2'b10; test_ci = 1'b1; // Ci=1, W should be A
        #10
        // Test Mode 11: W = B
        test_A = 8'hEE; test_B = 8'h55; test_m = 2'b11; test_ci = 1'b0;
	#10
	test_A = 8'b11111111; test_B = 8'b11110000; test_m = 2'b01; test_ci = 1'b1;
	#10 $stop;
    end

endmodule