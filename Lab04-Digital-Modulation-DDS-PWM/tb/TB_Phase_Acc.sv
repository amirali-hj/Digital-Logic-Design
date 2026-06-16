`timescale 1ns/1ns
module TB_Phase_Acc();

logic clk, rst;
wire  sign, phase_pos;
logic [7:0] signal;

// Phase_Acc_Top dut(
//     .clk(clk),
//     .rst(rst),
//     .sign(sign),
//     .phase_pos(phase_pos)
// );

DDS dut(
    .clk(clk),
    .rst(rst),
    .signal(signal)
);


always #5 clk = ~clk;

initial begin
    clk = 0;
    rst = 1;
    #10
    rst = 0;

    #3000

    $stop;
end

endmodule
