`timescale 1ns/1ns
module tb_all_top();

logic rst, btn;
wire ready;
logic [7:0] data_out, data;
logic clk = 0;
always #1 clk = ~clk ;

 all_top all (
    .clk(clk),
    .rst(rst),
    .btn(btn),
    .data(data),
    .ready(ready),
    .data_out(data_out)
);

//data_out = 8'b11001011
initial begin
    rst = 1'b1;
    #40;
    rst = 1'b0;
    #40;
    data = 8'b11001011;
    #40;
    btn = 1'b1;
    #40;
    btn = 1'b0;
    #2000;


$stop;
    
end


endmodule