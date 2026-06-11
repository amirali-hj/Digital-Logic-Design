`timescale 1ns/1ns

module D_Latch_With_Reset_Part4 (
    input  D_in,
    input  CLK_D,
    input  RESET_D,
    output Q_out,
    output Q_bar_out
);

    wire s_final_to_sr;
    wire r_final_to_sr;
    wire d_not;
    wire reset_d_not;

    not #(6) inv_d_input (d_not, D_in);
    not #(6) inv_reset_d (reset_d_not, RESET_D);

    and #(14) and_for_s (s_final_to_sr, D_in, reset_d_not);
    or  #(14) or_for_r  (r_final_to_sr, d_not, RESET_D);
    
    SR_latch_st_clk sr_instance (
        .S(s_final_to_sr),
        .R(r_final_to_sr),
        .clk(CLK_D),
        .w(Q_out),
        .w_bar(Q_bar_out)
    );

endmodule
