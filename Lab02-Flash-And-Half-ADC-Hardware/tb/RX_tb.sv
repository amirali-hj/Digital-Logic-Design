`timescale 1ns/1ns
module RX_tb();

reg rst,ser_in;
wire ready;
wire [7:0] out_data;
reg clk = 0;
always #1 clk = ~clk ;

top_RX top_RX (
    .clk(clk),
    .rst(rst),
    .ser_in(ser_in),
    .ready(ready),
    .data_out(out_data)
);

//data_out = 8'b11001011
initial begin
    rst = 1'b1;
    ser_in = 1'b1;
    #40 ;
    rst = 1'b0;

    #40 ;
    ser_in= 1'b0;
    #40;
    ser_in=1'b1;
    #40 ;
    ser_in= 1'b1;
    #40;
    ser_in=1'b0;
    #40 ;
    ser_in= 1'b1;
    #40;
    ser_in=1'b0;
    #40 ;
    ser_in= 1'b0;
    #40;
    ser_in=1'b1;
    #50

    #1000

$stop;
    
end


endmodule