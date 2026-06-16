`timescale 1ns/1ps

module tb_TrsController;

  // DUT interface
  reg  clk;
  reg  rst;
  reg  op;
  reg  co;
  wire sel;
  wire cnten;
  wire cntinit;
  wire shiftld;
  wire shiften;
  logic [7:0] Data;
  logic btn;
  wire  DataOut;


  // Instantiate DUT
 TrsTop dut( .Data(Data),
             .clk(clk),
             .rst(rst),
             .btn(btn),
             .DataOut(DataOut)   );


  // Clock generation: 10ns period (100MHz)
  initial begin
    clk = 0;
    forever #5 clk = ~clk;
  end

  // Stimulus
  initial begin
    // Initialize inputs
    rst = 1;

    // Reset pulse
    #20;
    rst = 0;
    Data = 8'b11011011;
    #20

    btn = 1;
    #10;
    btn = 0;

    #150;
    $stop;
  end

  

endmodule