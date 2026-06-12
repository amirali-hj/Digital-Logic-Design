module Counter4bit(
    input clk,
    input rst,
    input en_cnt,
    input ldcnt,

    output logic co_cnt
);

reg [3:0] datain = 4'b1000;
reg [3:0] dataout;


always @(posedge clk, posedge rst) begin

    if(rst)
        dataout <= 4'b0;
    else if(ldcnt)
        dataout <= datain;
    else if(en_cnt)
        dataout <= dataout+1;
end

assign co_cnt = &dataout;

endmodule