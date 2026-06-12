module top_RX(
    input clk,
    input rst,
    input ser_in,
    output logic ready,
    output logic [7:0] data_out
);

wire en_cnt_data,en_cnt_full,en_cnt_half;
wire ldcnt_data,ldcnt_full,ldcnt_half;
wire co_cnt_data,co_cnt_full,co_cnt_half;

Counter4bit_half #(5) Counter4bit_half (
    .clk(clk),
    .rst(rst),
    .data_in(5'd22),
    .en_cnt(en_cnt_half),
    .ldcnt(ldcnt_half),
    .co_cnt(co_cnt_half)
);

Counter5bit_full #(5) Counter5bit_full  (
    .clk(clk),
    .rst(rst),
    .data_in(5'd12),
    .en_cnt(en_cnt_full),
    .ldcnt(ldcnt_full),
    .co_cnt(co_cnt_full)
);

Counter4bit Counter4bit (
    .clk(clk),
    .rst(rst),
    .en_cnt(en_cnt_data),
    .ldcnt(ldcnt_data),
    .co_cnt(co_cnt_data)
);

controller_RX controller_RX (
    .clk(clk),
    .rst(rst),
    .co_cnt_half(co_cnt_half),
    .co_cnt_full(co_cnt_full),
    .co_cnt_data(co_cnt_data),
    .ser_in(ser_in),
    
    .ldcnt_half(ldcnt_half),
    .ldcnt_full(ldcnt_full),
    .ldcnt_data(ldcnt_data),
    .en_cnt_half(en_cnt_half),
    .en_cnt_full(en_cnt_full),
    .en_cnt_data(en_cnt_data),
    .shen(shen),
    .ready(ready)
);

shiftreg_1bit_to_8bit shiftreg_1bit_to_8bit(
    .clk(clk),
    .rst(rst),
    .shen(shen),
    .ser_in(ser_in),
    .data_out(data_out)
);

endmodule