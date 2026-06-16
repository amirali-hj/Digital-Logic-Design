module  Counter_Phase_Acc (
    input logic clk,
    input logic rst,
    input logic cnt_en,
    output logic co,
    output logic [5:0] cnt
);
    always @(posedge clk, posedge rst) begin
        if (rst)
            cnt <= 6'b0;
        else if(cnt_en)
            cnt <= cnt +1;
        
    end

    assign co = cnt== 6'b111111 ? 1'b1 : 1'b0;
endmodule