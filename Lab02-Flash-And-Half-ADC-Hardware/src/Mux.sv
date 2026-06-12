module Mux  (
  input  logic A,
  input  logic B, 
  input  logic Sel, 
  output logic MuxOut
);

  assign MuxOut = Sel ? B : A;

endmodule