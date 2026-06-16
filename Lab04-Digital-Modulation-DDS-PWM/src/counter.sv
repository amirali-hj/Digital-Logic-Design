module counter #(parameter WIDTH = 6) (
    input  logic             clk,
    input  logic             rst,
    input  logic             en,
    output logic [WIDTH-1:0] count,
    output logic             co
);
    always_ff @(posedge clk or posedge rst) begin
        if (rst)
            count <= '0;
        else if (en)
            count <= count + 1'b1;
    end

    assign co = &count;
endmodule