`timescale 1ns/1ps

module tb_not_gate;

reg [5:0] A;
wire [5:0] result;
wire valid;

not_gate uut(A, result, valid);

initial begin
    $monitor("A=%b Result=%b Valid=%b",
              A, result, valid);

    A=6'b000000; #10;
    A=6'b111111; #10;
    A=6'b101010; #10;
    A=6'b110011; #10;
    A=6'b010101; #10;

    $finish;
end

endmodule
