module Massage_processor (
    input  logic       clk,
    input  logic       rst,
    input  logic [4:0] msg,
    input  logic       send,
    output logic       out_msg
);
    logic co2, co10, en10, shen, ldcnt, ldreg;

    Counter4bit u_c4  (.clk, .rst, .en(co10), .co(co2), .load(ldcnt));
    counter #(10) u_c10 (.clk, .rst, .en(en10), .count(), .co(co10));
    shiftreg    u_sr  (.clk, .rst, .shift_en(shen), .load(ldreg), .din({msg, 4'b0101}), .ser_out(out_msg));
    Massage_controller u_ctrl (.*, .co2(co2), .co10(co10), .shift_en(shen), .load_cnt(ldcnt), .load_reg(ldreg), .en_cnt10(en10));
endmodule