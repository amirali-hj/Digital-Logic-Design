module sin_rom (
    input  logic [5:0] addr,
    output logic [7:0] dout
);
    logic [7:0] mem [0:63];

    initial begin
        $readmemb("sine.mem", mem);
    end

    assign dout = mem[addr];
endmodule