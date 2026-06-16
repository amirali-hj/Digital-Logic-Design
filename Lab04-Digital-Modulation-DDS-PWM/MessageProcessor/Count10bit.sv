module  Count10bit (
    input logic clk,
    input logic rst,
    input logic cnt_en,
    output logic co,
    output logic [9:0] cnt
);
    always @(posedge clk, posedge rst) begin
        if (rst)
            cnt <= 10'b0;
        else if(cnt_en)
            cnt <= cnt +1;
        
    end

    assign co = cnt== 10'b1111111111 ? 1'b1 : 1'b0;
endmodule