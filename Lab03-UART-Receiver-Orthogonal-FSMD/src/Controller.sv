`timescale 1ns/1ns

module TrsController(
  input  logic clk,
  input  logic rst,
  input  logic op,
  input  logic co,

  output logic sel,
  output logic cnten,
  output logic cntinit,
  output logic shiftld,
  output logic shiften
);

  typedef enum logic [1:0] {IDLE, COUNT, DONE} state_t;
  state_t ps, ns;

  // State register
  always @(posedge clk or posedge rst) begin
    if (rst)
      ps <= IDLE;
    else
      ps <= ns;
  end

  // Combinational output logic based on current state
  always @(ps) begin
    // پیش‌فرض خروجی‌ها
    sel     = 1'b0;
    cnten   = 1'b0;
    cntinit = 1'b0;
    shiftld = 1'b0;
    shiften = 1'b0;

    case (ps)
      IDLE: begin
      end

      COUNT: begin
        cntinit = 1'b1;
        sel     = 1'b0;
        shiftld = 1'b1;
      end

      DONE: begin
        cnten   = 1'b1;
        shiften = 1'b1;
        sel     = 1'b1;
      end
    endcase
  end

  // Next-state logic
  always @(*) begin
    case (ps)
      IDLE: ns =(op) ? COUNT : IDLE;
      COUNT: ns = DONE; 
      DONE:  ns =  (co) ? IDLE : DONE;
      default: ns = IDLE;
    endcase
  end

endmodule