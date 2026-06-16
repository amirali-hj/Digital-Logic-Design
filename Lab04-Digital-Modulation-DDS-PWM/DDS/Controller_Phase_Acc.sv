
`define FIRST 2'b00
`define SECOND 2'b01
`define THIRD 2'b10
`define FORTH   2'b11

module Controller_Phase_Acc(
    input logic clk,
    input logic rst,
    input logic co,

    output logic cnt_en,
    output logic sign,
    output logic phase_pos

);
logic [1:0] n_state,P_state;

always @(posedge clk, posedge rst) begin
    if(rst)
        P_state <= `FIRST;
    if(clk)
        P_state <= n_state; 
end

always @(*) begin
    case (P_state)
        `FIRST: if(co) begin n_state <= `SECOND; end else begin n_state <= `FIRST; end 
        `SECOND: if(co) begin n_state <= `THIRD; end else begin n_state <= `SECOND ;end 
        `THIRD : if(co) begin n_state <= `FORTH; end else begin n_state <= `THIRD ; end
        `FORTH : if(co) begin n_state <= `FIRST; end else begin n_state <= `FORTH ;end
        default: n_state <= `FIRST;
    endcase
    
end

always@(*)begin
    {sign, phase_pos} <= 0;
    cnt_en <=1;
    case (P_state)
        `FIRST: begin sign <= 1'b0; phase_pos <=1'b0;end
        `SECOND:begin sign <= 1'b0; phase_pos <=1'b1;end
        `THIRD: begin sign <= 1'b1; phase_pos <=1'b0;end
        `FORTH: begin sign <= 1'b1; phase_pos <=1'b1;end 
        default:begin sign <= 1'b0; phase_pos <=1'b0;end
    endcase
end

endmodule