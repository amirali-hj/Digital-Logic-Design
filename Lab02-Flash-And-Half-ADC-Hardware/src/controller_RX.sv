
`define IDLE 2'b00
`define START_HALF 2'b01
`define START_FULL 2'b10
`define SHIFTING   2'b11

module controller_RX(
    input clk,
    input rst,
    input co_cnt_half,
    input co_cnt_full,
    input co_cnt_data,
    input ser_in,
    
    output reg ldcnt_half,
    output reg ldcnt_full,
    output reg ldcnt_data,
    output reg en_cnt_half,
    output reg en_cnt_full,
    output reg en_cnt_data,
    output reg shen,
    output reg ready
);

reg [1:0] n_state,P_state;

always @(posedge clk, posedge rst) begin
    if(rst)
        P_state <= `IDLE;
    if(clk)
        P_state <= n_state; 
end

always @(*) begin
    case (P_state)
        `IDLE: if(~ser_in) begin n_state <= `START_HALF; end else begin n_state <= `IDLE; end 
        `START_HALF: if(co_cnt_half) begin n_state <= `START_FULL; end else begin n_state <= `START_HALF ;end 
        `START_FULL : if(co_cnt_full) begin n_state <= `SHIFTING; end else begin n_state <= `START_FULL ; end
        `SHIFTING : if(co_cnt_data) begin n_state <= `IDLE ; end else begin n_state <= `START_FULL ;end
        default: ;
    endcase
    
end

always@(*)begin
    {ldcnt_full,ldcnt_half,ldcnt_data,en_cnt_data,en_cnt_full,en_cnt_half,shen,ready} <= 0;
    case (P_state)
        `IDLE: begin ready <= 1'b1;ldcnt_half<= 1'b1; ldcnt_full <= 1'b1; ldcnt_data <=1;end
        `START_HALF:begin   en_cnt_half <= 1'b1; end
        `START_FULL: begin  en_cnt_full <= 1'b1; end
        `SHIFTING : begin shen <= 1'b1; en_cnt_data<=1;ldcnt_full <= 1'b1; end 
        default: ;
    endcase
    
end

endmodule