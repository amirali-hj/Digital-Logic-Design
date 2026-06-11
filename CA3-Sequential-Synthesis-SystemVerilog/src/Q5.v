
`timescale 1ns/1ns

module Register_8bit_From_D_Latch (
    input  [7:0] D_in_reg,    
    input        Clk_reg, 
    input        Reset_reg,   
    output [7:0] Q_out_reg,   
    output [7:0] Q_bar_out_reg 
);

    
    genvar i;
    generate
        for (i = 0; i < 8; i = i + 1) begin : d_latch_instances
            D_Latch_With_Reset_Part4 individual_d_latch (
                .D_in(D_in_reg[i]),
                .CLK_D(Clk_reg),    
                .RESET_D(Reset_reg),   
                .Q_out(Q_out_reg[i]),
                .Q_bar_out(Q_bar_out_reg[i])
            );
        end
    endgenerate

endmodule