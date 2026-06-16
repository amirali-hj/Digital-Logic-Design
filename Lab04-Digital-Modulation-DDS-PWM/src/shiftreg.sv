module shiftreg (
    input  logic       clk,
    input  logic       rst,
    input  logic       shift_en,
    input  logic       load,
    input  logic [8:0] din,
    output logic       ser_out
);
    logic [8:0] data;

    always_ff @(posedge clk or posedge rst) begin
        if (rst)
            data <= '0;
        else if (load)
            data <= din;
        else if (shift_en)
            data <= data >> 1;
    end

    assign ser_out = data[0];
endmodule