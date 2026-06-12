
module Counter  (   input  logic       clk,
                    input  logic       rst,
                    input  logic       init,
                    output logic [3:0] cnt,
                    output logic       co   
                );

    always@ (posedge clk or posedge rst) begin
        if(rst)
            cnt <= 4'b0;
        if(init) 
            cnt <= 4'd5;
        else
            cnt <= cnt+1;
    end

    assign co = &{cnt} ? 1'b1 : 1'b0;
endmodule