
module TrsTop (   input [7:0] Data,
                  input  logic clk,
                  input  logic rst,
                  input  logic btn,
                  output logic DataOut,
                  output logic [9:0] shiftOut   );

wire cntinit, cnt, co, shiftld, shiften, serout, op, sel ;

    Counter C(.clk(clk),
              .rst(rst),
            .init(cntinit), 
            .cnt(cnt), 
            .co(co)       
            );

    ShiftReg shifter (.clk(clk),
                      .rst(rst), 
                      .parIn(Data), 
                      .ld(shiftld), 
                      .shen(shiften), 
                      .serout(serout), 
                      .shiftOut(shiftOut)
                      );

    OnePulser P(  .clk(clk),
                .rst(rst), 
                .btn(btn),
                .op(op)    
                );

    Mux  M(   .A(1'b1),
              .B(serout), 
              .Sel(sel), 
              .MuxOut(DataOut) );

     TrsController Cont(   .clk(clk),
                        .rst(rst),
                        .op(op) ,
                        .co(co) ,
                        .sel(sel),
                        .cnten(cnten),
                        .cntinit(cntinit),
                        .shiftld(shiftld),
                        .shiften(shiften)   );

endmodule