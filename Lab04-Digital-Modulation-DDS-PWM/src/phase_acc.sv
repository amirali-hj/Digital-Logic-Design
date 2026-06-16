module phase_acc (
    input  logic       clk,
    input  logic       rst,
    output logic [5:0] count,
    output logic       sign,
    output logic       phase_pos
);
    typedef enum logic [1:0] {
        ST1 = 2'b00, ST2 = 2'b01, ST3 = 2'b10, ST4 = 2'b11
    } state_t;

    state_t state, n_state;
    logic co;

    always_ff @(posedge clk or posedge rst) begin
        if (rst) state <= ST1;
        else     state <= n_state;
    end

    always_comb begin
        n_state = state;
        case (state)
            ST1: if (co) n_state = ST2;
            ST2: if (co) n_state = ST3;
            ST3: if (co) n_state = ST4;
            ST4: if (co) n_state = ST1;
        endcase
    end

    always_comb begin
        case (state)
            ST1: {sign, phase_pos} = 2'b00;
            ST2: {sign, phase_pos} = 2'b01;
            ST3: {sign, phase_pos} = 2'b10;
            ST4: {sign, phase_pos} = 2'b11;
            default: {sign, phase_pos} = 2'b00;
        endcase
    end

    counter #(6) u_cnt (
        .clk(clk), .rst(rst), .en(1'b1), .count(count), .co(co)
    );
endmodule