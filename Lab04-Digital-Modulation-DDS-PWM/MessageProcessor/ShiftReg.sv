module ShiftReg (
    input  logic       clk,
    input  logic       rst,
    input  logic [4:0] parIn,
    input  logic       ld,
    input  logic       shen,
    output logic       serout,
    output logic [8:0] shiftOut
);

    assign serout = shiftOut[0];

    always_ff @(posedge clk or posedge rst) begin
        if (rst) begin
            shiftOut <= 9'b0;
        end else if (ld) begin
            shiftOut <= {parIn, 4'b0101};
        end else if (shen) begin
            shiftOut <= shiftOut >> 1;
        end
    end

endmodule
