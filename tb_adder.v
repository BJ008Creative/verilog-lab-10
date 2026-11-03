`timescale 1ns/1ps

module tb_adder;

reg [5:0] A, B;
wire [5:0] result;
wire valid;

adder uut(A, B, result, valid);

initial begin
    $monitor("A=%d B=%d Result=%d Valid=%b",
              A, B, result, valid);

    A=6'd10; B=6'd20; #10;
    A=6'd30; B=6'd40; #10;
    A=6'd63; B=6'd1;  #10;
    A=6'd25; B=6'd15; #10;
    A=6'd0;  B=6'd0;  #10;

    $finish;
end

endmodule
