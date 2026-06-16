module Counter4bit (
    input  logic clk,
    input  logic rst,
    input  logic en,
    input  logic load,
    output logic co
);
    logic [3:0] data_in = 4'b0110;
    logic [3:0] count;

    always_ff @(posedge clk or posedge rst) begin
        if (rst)
            count <= 4'b0;
        else if (load)
            count <= data_in;
        else if (en)
            count <= count + 1'b1;
    end

    assign co = &count;
endmodule