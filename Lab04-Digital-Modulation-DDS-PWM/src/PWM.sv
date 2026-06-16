module PWM (
    input  logic       clk,
    input  logic       rst,
    input  logic [7:0] threshold,
    output logic       pwm_out
);
    logic [7:0] count;
    counter #(8) u_cnt (
        .clk(clk), .rst(rst), .en(1'b1), .count(count), .co()
    );

    assign pwm_out = (count > threshold) ? 1'b0 : 1'b1;
endmodule