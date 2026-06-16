module Top_msg (
    input  logic       clk,
    input  logic       rst,
    input  logic       send,
    input  logic [4:0] msg,
    output logic       serout
);

    logic co_4bit;
    logic ld_4bit;
    logic sh_ld;
    logic sh_en;
    logic en_10bit;

    // FSM
    Controller_msg msg_cntrlr (
        .clk     (clk),
        .rst     (rst),
        .send    (send),
        .co_4bit (co_4bit),
        .ld_4bit (ld_4bit),
        .sh_ld   (sh_ld),
        .sh_en   (sh_en),
        .en_10bit(en_10bit)
    );

    // Datapath
    DataPath_msg u_dp (
        .clk     (clk),
        .rst     (rst),
        .msg     (msg),
        .send    (send),
        .sh_ld   (sh_ld),
        .ld_4bit (ld_4bit),
        .sh_en   (sh_en),
        .en_10bit(en_10bit),
        .co_4bit (co_4bit),
        .serout  (serout)
    );

endmodule
