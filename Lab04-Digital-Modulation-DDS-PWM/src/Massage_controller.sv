module Massage_controller (
    input  logic clk,
    input  logic rst,
    input  logic send,
    input  logic co2,
    input  logic co10,
    output logic shift_en,
    output logic load_cnt,
    output logic load_reg,
    output logic en_cnt10
);
    typedef enum logic { IDLE = 1'b0, SHIFT = 1'b1 } state_t;
    state_t state, n_state;

    always_ff @(posedge clk or posedge rst) begin
        if (rst) state <= IDLE;
        else     state <= n_state;
    end

    always_comb begin
        n_state = state;
        case (state)
            IDLE:  if (send) n_state = SHIFT;
            SHIFT: if (co2)  n_state = IDLE;
        endcase
    end

    always_comb begin
        {load_cnt, load_reg, shift_en, en_cnt10} = 4'b0;
        case (state)
            IDLE:  begin load_cnt = 1'b1; load_reg = 1'b1; end
            SHIFT: begin en_cnt10 = 1'b1; shift_en = co10; end
        endcase
    end
endmodule