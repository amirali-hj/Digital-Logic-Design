

module top_module_post (
    input  logic clk,
    input  logic rst,
    input  logic rcIn,
    output logic txOut,
    output logic txValid,
    output logic txAbort
);
    logic start_detected, abort_detected;

    // Start detector
    sequence_detector u_start (
        .clk(clk), .rst(rst), .J(~rcIn), .detected(start_detected)
    );

    // Abort detector
    sequence_detector u_abort (
        .clk(clk), .rst(rst), .J(rcIn), .detected(abort_detected)
    );

    // Transmitter FSM
    transmitter_fsm_post c_fsm (
        .clk(clk), .rst(rst),
        .start(start_detected),
        .abort(abort_detected),
        .rcIn(rcIn),
        .txOut(txOut),
        .txValid(txValid),
        .txAbort(txAbort)
    );
endmodule
