`timescale 1ns/1ns

module OnePulser(  input  logic clk,
                   input  logic rst, 
                   input  logic btn,
                   output logic op     );
    
    typedef enum logic [1:0] {IDLE, SEND, DONE} state_t;
    state_t ps, ns;


    always @(posedge clk or posedge rst) begin
        if(rst) 
            ps <= IDLE;
        else
            ps <= ns;
    end

    always @(ps) begin

        op = 0;

        if(ps == SEND)
            op =1;
    end
	

    always @(ps, btn) begin

        case (ps)
            IDLE:
                if (btn) 
                    ns = SEND;
                else 
                    ns = IDLE;

            SEND:
                ns = DONE;

            DONE:
                if (!btn)
                    ns = IDLE;
                else
                    ns = DONE;
        endcase
    end

endmodule