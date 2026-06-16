

module Counter_top # (
parameter n = 5
)(
    input clk,
    input rst,
    input ldcnt,

    output logic co_cnt,
    output logic data_out
);


logic [n-1:0] dataout;


always @(posedge clk, posedge rst) begin

    if(rst)
        dataout <= 5'd12;
    else if(ldcnt)
        dataout <= 5'd12;
    else
        dataout <= dataout + 1;
end

assign co_cnt = &dataout;

endmodule