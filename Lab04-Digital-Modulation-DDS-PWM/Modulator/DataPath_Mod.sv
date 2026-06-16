module DataPath_Mod (
    input  logic       clk,   // کلاک اصلی 50 مگاهرتز
    input  logic       rst,
    input  logic       send,
    input  logic [4:0] msg,
    input  logic       init,
    input  logic       mode,
    output logic       out    // خروجی نهایی PWM
);

    // --- اصلاح تعریف سیگنال‌ها (تک‌بیت برای کلاک‌ها) ---
    wire serout, orout;
    wire FreqH, FreqL;        // کلاک‌ها باید تک‌بیت باشند
    wire NotInit;
    wire [8:0] cntNum1, cntNum2;
    wire muxOut_DDS;          // کلاک ورودی برای DDS (تک‌بیت)
    wire [7:0] signal_raw;    // خروجی خام DDS (Signed)
    wire [7:0] signal_final;  // خروجی اصلاح شده برای PWM
    wire [7:0] muxOut_PWM;

    assign NotInit = ~init;

    // ۱. بلوک پردازش پیام
    Top_msg msg_prcs (
        .clk(FreqH),
        .rst(rst),
        .send(send),
        .msg(msg),
        .serout(serout)
    );

    // ۲. تقسیم‌کننده‌های فرکانس (خروجی CO تک‌بیت است)
    FreqDiv_H FRQH (
        .clk(clk), .rst(rst), .en(NotInit),
        .ld(FreqH), .co(FreqH), .cnt(cntNum1)
    );

    FreqDiv_H FRQL (
        .clk(clk), .rst(rst), .en(NotInit),
        .ld(FreqL), .co(FreqL), .cnt(cntNum2)
    );

    // ۳. انتخاب کلاک برای DDS (FSK Modulation)
    // فرض بر این است که ماژول Mux_2to1_bit را دارید
    assign muxOut_DDS = serout ? FreqL : FreqH; 

    // ۴. بلوک تولید موج (DDS)
    DDS dds_inst (
        .clk(muxOut_DDS),
        .rst(rst),
        .signal(signal_raw)
    );

    // ۵. تبدیل Signed به Unsigned برای سازگاری با PWM
    assign signal_final = {~signal_raw[7], signal_raw[6:0]};

    // ۶. منطق انتخاب خروجی (Mux2)
    assign orout = serout || mode;
    assign muxOut_PWM = orout ? 8'b0 : signal_final;

    // ۷. بلوک PWM
    PWM pwm_inst (
        .clk(clk),
        .rst(rst),
        .in(muxOut_PWM),
        .out(out)
    );

endmodule