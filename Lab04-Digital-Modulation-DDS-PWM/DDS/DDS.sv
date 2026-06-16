module DDS (
    input logic clk,
    input logic rst,

    output logic [7:0] signal
    );

    logic sign, phase_pos, sel_mux_sign;
    logic [5:0] mux_sin, addr_inverse, addr;
    logic [7:0] sin_read, mux_sign;


    Phase_Acc_Top Phase_Acc(
        .clk(clk),
        .rst(rst),
        .sign(sign),
        .phase_pos(phase_pos),
        .cnt(addr)
    );

    assign addr_inverse = ~addr + 1;
    assign mux_sin = phase_pos ? addr_inverse : addr;

   Sin_Rom Mem(
        .addr(mux_sin),
         .readData(sin_read)
    );

    assign sel_mux_sign =( (~|addr) & (phase_pos) );
    assign mux_sign = sel_mux_sign ? 8'b11111111 : sin_read;

    assign signal = sign ? ~mux_sign+1 : mux_sign;

endmodule 