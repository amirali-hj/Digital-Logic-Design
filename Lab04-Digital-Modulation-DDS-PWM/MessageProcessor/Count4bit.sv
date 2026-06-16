module  Count4bit (
    input logic clk,
    input logic rst,
    input logic cnt_en,
    output logic co,
    output logic [3:0] cnt
);
    always @(posedge clk, posedge rst) begin
        if (rst)
            cnt <= 4'b0;
        else if(cnt_en)
            cnt <= cnt +1;
        
    end

    assign co = cnt== 4'b1111 ? 1'b1 : 1'b0;
endmodule