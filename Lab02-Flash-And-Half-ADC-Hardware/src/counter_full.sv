

module Counter5bit_full # (
parameter n = 5
)(
    input clk,
    input rst,
    input en_cnt,
    input ldcnt,
    input [n-1:0] data_in,

    output logic co_cnt
);


logic [n-1:0] dataout;


always @(posedge clk, posedge rst) begin

    if(rst)
        dataout <= 0;
    else if(ldcnt)
        dataout <= data_in;
    else if(en_cnt)
        dataout <= dataout+1;
end

assign co_cnt = &dataout;

endmodule