module DataPath_msg (
    input  logic       clk,
    input  logic       rst,
    input  logic [4:0] msg,

    input  logic       send,
    input  logic       sh_ld,
    input  logic       ld_4bit,
    input  logic       sh_en,
    input  logic       en_10bit,

    output logic       co_4bit,
    output logic       serout
);

    wire [3:0] cnt_4bit;
    wire [9:0] cnt_10bit;
    wire [8:0] sh_out;
    logic      co_10bit;

    Count10bit c1 (
        .clk    (clk),
        .rst    (rst),
        .cnt_en (en_10bit),     
        .co     (co_10bit),
        .cnt    (cnt_10bit)
    );

    Count4bit c2 (
        .clk    (clk),
        .rst    (rst),
        .cnt_en (co_10bit),  // هر بار co_10bit پالس می‌زند، 4bit یکی زیاد می‌شود
        .co     (co_4bit),
        .cnt    (cnt_4bit)
    );

    ShiftReg s1 (
        .clk      (clk),
        .rst      (rst),
        .parIn    (msg),
        .ld       (sh_ld),
        .shen     (co_10bit), // شیفت با پالس co_10bit
        .serout   (serout),
        .shiftOut (sh_out)
    );

endmodule
