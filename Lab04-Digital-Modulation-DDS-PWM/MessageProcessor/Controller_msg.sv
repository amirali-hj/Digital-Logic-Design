module Controller_msg (
    input  logic clk,
    input  logic rst,     // async active-high reset (مثل کدت)
    input  logic send,
    input  logic co_4bit,      // counter overflow / done

    output logic ld_4bit, // pulse when starting
    output logic sh_ld,    // pulse when starting (load shift register)
    output logic sh_en,
    output logic  en_10bit
);

    typedef enum logic [0:0] {WAITING, SENDING} state_t;
    state_t state, next;

    // State register
    always_ff @(posedge clk or posedge rst) begin
        if (rst) state <= WAITING;
        else     state <= next;
    end

    // Next-state + outputs
    always_comb begin
        // defaults
        next    = WAITING;
        ld_4bit = 1'b0;
        sh_ld   = 1'b0;
        sh_en   = 1'b0;
        en_10bit = 1'b0;

        case (state)
            WAITING: begin
                    ld_4bit = send;
                    sh_ld = send;
                if (send) begin
                    // sh_en   = 1'b1;
                    next    = SENDING;
                end
                else begin 
                    next = WAITING;
                end

            end

            SENDING: begin
                en_10bit = 1'b1;
                if (co_4bit) begin
                    next = WAITING;
                end
                else begin
                    next = SENDING;
                end
            end
        endcase
    end

endmodule
