`timescale 1ns/1ps

module tb_adder12;

reg [11:0] A, B;
wire [11:0] Sum;
wire Cout;

adder12 uut(A, B, Sum, Cout);

initial begin
    $monitor("A=%d B=%d Sum=%d Cout=%b",
              A, B, Sum, Cout);

    A=12'd100;  B=12'd200;  #10;
    A=12'd1000; B=12'd2000; #10;
    A=12'd3000; B=12'd1095; #10;
    A=12'd4095; B=12'd1;    #10;

    $finish;
end

endmodule
