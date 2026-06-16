

module ShiftReg (   input  logic       clk,
                    input  logic       rst,
                    input  logic [7:0] parIn,
                    input  logic       ld,
                    input  logic       shen,
                    output logic       serout,
                    output logic [9:0] shiftOut   
                );

    always@ (posedge clk or posedge rst) begin
        serout <= 1'b1;
        if(rst)
            shiftOut <= 10'b0;
        else if(ld) 
            shiftOut <= {1'b0, parIn, 1'b1};
        else if(shen) begin
           serout   <= shiftOut[9];
           shiftOut <= shiftOut << 1;
        end
    end
    
endmodule