module Phase_Acc_Top(
    input logic clk,
    input logic rst,
    output logic sign,
    output logic phase_pos,
    output logic [5:0] cnt
);

logic cnt_en, co;


Counter_Phase_Acc counter(
    .clk(clk),
    .rst(rst),
    .cnt_en(cnt_en),
    .co(co),
    .cnt(cnt)
);

Controller_Phase_Acc cntlr(
    .clk(clk),
    .rst(rst),
    .co(co),
    .cnt_en(cnt_en),
    .sign(sign),
    .phase_pos(phase_pos)
);

endmodule