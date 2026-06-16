
module Sin_Rom 
    (
    input  logic [5:0] addr,

    output logic [7:0] readData
    );

    logic [7:0] mem [63:0];

    initial begin
        $readmemb("sine.mem", mem);
    end

    assign readData = mem[addr];


endmodule