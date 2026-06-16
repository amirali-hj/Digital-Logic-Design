module  FreqDiv_L (
    input logic clk,
    input logic rst,
    input logic en,
    input logic ld,
    output logic co,
    output logic [8:0] cnt
);
    always @(posedge clk, posedge rst) begin
        if (rst)
            cnt <= 9'b0;
        else if(ld)
            cnt <= 9'b000000000;
        else if(en)
            cnt <= cnt +1;
        
    end

    assign co = cnt== 9'b111111111 ? 1'b1 : 1'b0;
endmodule