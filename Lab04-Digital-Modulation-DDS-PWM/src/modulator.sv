module modulator (
    input  logic       clk,
    input  logic       rst,
    input  logic       send,
    input  logic       mode,
    input  logic [4:0] msg,
    input  logic       init,
    output logic [7:0] out_mod
);
    logic co_h, co_l, msg_ser, clk_dds, msb, sel2;
    logic [7:0] dds_val;

    freqdivide u_fvh (.clk, .rst, .init(~init), .sw(3'b0), .hl(1'b1), .co(co_h));
    freqdivide u_fvl (.clk, .rst, .init(~init), .sw(3'b0), .hl(1'b0), .co(co_l));
    
    Massage_processor u_msg (
        .clk(co_h), .rst, .msg, .send, .out_msg(msg_ser)
    );

    // Mux 1: Select clock source based on message bit
    // sel=0 -> in0 (co_l), sel=1 -> in1 (co_h)
    mux #(1) u_m1 (
        .sel(msg_ser), 
        .in0(co_l), 
        .in1(co_h), 
        .out(clk_dds)
    );

    DDS u_dds (.clk(clk_dds), .rst, .out_dds(dds_val), .msb);

    assign sel2 = msg_ser | mode;

    // Mux 2: Output selection
    // sel2=1 -> in1 (dds_val), sel2=0 -> in0 (0)
    mux #(8) u_m2 (
        .sel(sel2), 
        .in0(8'h0),     // وقتی sel2 صفر است
        .in1(dds_val),  // وقتی sel2 یک است
        .out(out_mod)
    );
endmodule