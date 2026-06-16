module DDS (
    input  logic       clk,
    input  logic       rst,
    output logic [7:0] out_dds,
    output logic       msb
);
    logic sign, phase_pos, sel_m2;
    logic [5:0] cnt_val, cnt_2s, addr_rom;
    logic [7:0] rom_val, sign_in;

    phase_acc u_phase (.*, .count(cnt_val));
    comp2s #(6) u_c2s (.din(cnt_val), .dout(cnt_2s));
    
    // Mux 1: Address calculation
    mux #(6) u_m1 (.sel(phase_pos), .in0(cnt_val), .in1(cnt_2s), .out(addr_rom));
    
    sin_rom u_rom (.addr(addr_rom), .dout(rom_val));

    assign sel_m2 = phase_pos & (~|cnt_val);
    
    // Mux 2: Max value handling
    // sel=1 -> in1 (FF), sel=0 -> in0 (Sine Value)
    mux #(8) u_m2 (
        .sel(sel_m2), 
        .in0(rom_val), 
        .in1(8'hFF), 
        .out(sign_in)
    );
    
    comp2sign u_cs (.mode(sign), .din(sign_in), .dout(out_dds), .co(msb));
endmodule