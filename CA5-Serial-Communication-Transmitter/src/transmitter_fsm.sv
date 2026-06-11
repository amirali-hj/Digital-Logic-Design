
module transmitter_fsm (
    input  logic clk,
    input  logic rst,
    input  logic start,
    input  logic abort,
    input  logic rcIn,
    output logic txOut,
    output logic txValid,
    output logic txAbort
);
    typedef enum logic [1:0] {IDLE, SEND, DONE} state_t;
    state_t ps, ns;

    logic cen, ld, co;

    always_ff @(posedge clk or posedge rst) begin
        if (rst)
            ps <= IDLE;
        else
            ps <= ns;
    end

    always_comb begin
        ns = ps;
        cen = 0;
        ld = 0;
        txValid = 0;
        txOut = 1;
        txAbort = 0;

        case (ps)
            IDLE: begin
                if (start) begin
                    ns = SEND;
                    ld = 1;
                end
            end

            SEND: begin
                txValid = 1;
                txOut = rcIn;
                cen = 1;

                if (abort) begin
                    txAbort = 1;
                    ns = IDLE;
                end else if (co) begin
                    ns = DONE;
                end
            end

            DONE: begin
                txValid = 0;
                txOut = 1;
                ns = IDLE;
            end
        endcase
    end
	 counter_97 u_counter (
        .clk(clk), .rst(rst), .cen(cen), .ld(ld), .co(co)
    );
endmodule
