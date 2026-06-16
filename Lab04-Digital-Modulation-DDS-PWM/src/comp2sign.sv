module comp2sign #(parameter WIDTH = 8) (
    input  logic             mode,
    input  logic [WIDTH-1:0] din,
    output logic [WIDTH-1:0] dout,
    output logic             co
);
    assign {co, dout} = mode ? (~{1'b0, din} + 1'b1) : {1'b0, din};
endmodule