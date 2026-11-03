`timescale 1ns/1ps

module tb_or_gate;

reg [5:0] A, B;
wire [5:0] result;
wire valid;

or_gate uut(A, B, result, valid);

initial begin
    $monitor("A=%b B=%b Result=%b Valid=%b",
              A, B, result, valid);

    A=6'b111100; B=6'b101010; #10;
    A=6'b000000; B=6'b111111; #10;
    A=6'b101010; B=6'b010101; #10;
    A=6'b000000; B=6'b000000; #10;

    $finish;
end

endmodule
