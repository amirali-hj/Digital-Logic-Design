module T_ff (
    input clk,
    input rst,
    input T_in,

    output logic T_out
);

always @(posedge clk, posedge rst) begin

    if(rst)
        T_out <= 1'b0;

    else
        if(T_in == 1'b1)
            T_out <= ~T_out;
end
endmodule

