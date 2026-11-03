`timescale 1ns/1ps

module tb_full_subtractor;

reg A, B, Bin;
wire Diff, Bout;

full_subtractor uut(A, B, Bin, Diff, Bout);

initial begin
    $monitor("A=%b B=%b Bin=%b Diff=%b Bout=%b",
              A, B, Bin, Diff, Bout);

    A=0; B=0; Bin=0; #10;
    A=0; B=0; Bin=1; #10;
    A=0; B=1; Bin=0; #10;
    A=0; B=1; Bin=1; #10;
    A=1; B=0; Bin=0; #10;
    A=1; B=0; Bin=1; #10;
    A=1; B=1; Bin=0; #10;
    A=1; B=1; Bin=1; #10;

    $finish;
end

endmodule
