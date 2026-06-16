module modulator_with_pwm (
    input  logic       clk,
    input  logic       rst,
    input  logic       send,
    input  logic       mode,
    input  logic [4:0] msg,
    input  logic       init,
    output logic       pwm
);
    logic [7:0] mod_val;

    modulator u_mod (.*, .out_mod(mod_val));
    PWM       u_pwm (.clk, .rst, .threshold(mod_val), .pwm_out(pwm));
endmodule