module comp2s #(parameter WIDTH = 6) (
    input  logic [WIDTH-1:0] din,
    output logic [WIDTH-1:0] dout
);
    assign dout = (~din + 1'b1);
endmodule