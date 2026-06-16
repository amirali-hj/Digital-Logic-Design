module freqdivide (
    input  logic       clk,
    input  logic       rst,
    input  logic [2:0] sw,
    input  logic       init,
    input  logic       hl,
    output logic       co
);
    logic [8:0] count;
    const logic [4:0] FIXED_VAL = 5'b0;

    always_ff @(posedge clk or posedge rst) begin
        if (rst)
            count <= '0;
        else if (init | co)
            count <= {hl, sw, FIXED_VAL};
        else
            count <= count + 1'b1;
    end

    assign co = &count;
endmodule