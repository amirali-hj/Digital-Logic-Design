module all_top(
    input clk,
    input rst,
    input btn,
    input [7:0] data,
    output logic ready,
    output logic [7:0] data_out
);

logic clk_divided, T_in;
logic data_in_reciever;

TrsTop transmitter(
    .Data(data),
    .clk(clk_divided),
    .rst(rst),
    .btn(btn),
    .DataOut(data_in_reciever)
);

top_RX resiever(
    .clk(clk),
    .rst(rst),
    .ser_in(data_in_reciever),
    .ready(ready),
    .data_out(data_out)
);

Counter_top divider (
    .clk(clk),
    .rst(rst),
    .ldcnt(clk_divided),
    .co_cnt(clk_divided)
);

// T_ff t_ff (
//     .clk(clk),
//     .rst(rst),
//     .T_in(T_in),
//     .T_out(clk_divided)
// );

endmodule

