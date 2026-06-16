module mux #(parameter WIDTH = 6) (
    input  logic             sel,
    input  logic [WIDTH-1:0] in0, // Selected when sel = 0
    input  logic [WIDTH-1:0] in1, // Selected when sel = 1
    output logic [WIDTH-1:0] out
);
    // اصلاح: حالا اگر sel یک باشد، in1 انتخاب می‌شود
    assign out = sel ? in1 : in0;
endmodule