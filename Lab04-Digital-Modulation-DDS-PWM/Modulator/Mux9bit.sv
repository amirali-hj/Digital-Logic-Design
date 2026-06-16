module Mux9 (
    input  logic [8:0] a,
    input  logic [8:0] b,
    input  logic sel,
    output logic [8:0] y
);

    always_comb begin
        if (sel)
            y = a;
        else
            y = b;
    end

endmodule
