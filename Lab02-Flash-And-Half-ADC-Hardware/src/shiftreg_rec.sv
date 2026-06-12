module shiftreg_1bit_to_8bit(
    input clk,
    input rst,
    input shen,
    input ser_in,

    output reg [7:0] data_out
);

always @(posedge clk , posedge rst) begin
    if(rst)
        data_out <= 8'b0;
    else if(shen)begin
        data_out <= {{ser_in},data_out[7:1]};
    end 
end

endmodule