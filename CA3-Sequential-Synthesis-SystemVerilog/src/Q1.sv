`timescale 1ns/1ns

module LogicBlock_Combinational_SV(
    input  logic [7:0] A, B,
    input  logic [1:0] m,
    input  logic       ci,
    output logic       co,
    output logic [7:0] w
);

    always_comb begin
        w = 8'b0;
        co = 1'b0;

        case (m)
            2'b00: begin
                w = A;
                co = 1'b0;
            end
            2'b01: begin
                if (ci == 1'b1) begin
                    {co, w} = A + 8'd1;
                end else begin
                    w = A;
                    co = 1'b0;
                end
            end
            2'b10: begin
                if (ci == 1'b0) begin
                    w = A - 8'd1;
                    co = (A == 8'd0) ? 1'b1 : 1'b0;
                end else begin
                    w = A;
                    co = 1'b0;
                end
            end
            2'b11: begin
                w = B;
                co = 1'b0;
            end
            default: begin
                w = 8'hxx;
                co = 1'bx;
            end
        endcase
    end

endmodule
