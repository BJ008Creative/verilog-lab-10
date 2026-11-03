`timescale 1ns/1ps

module tb_comparator;

reg [5:0] A, B;

wire [1:0] compare;
wire valid;

comparator uut(A, B, compare, valid);

initial begin
    $monitor("A=%d B=%d Compare=%b Valid=%b",
              A, B, compare, valid);

    A=6'd20; B=6'd20; #10;
    A=6'd40; B=6'd20; #10;
    A=6'd10; B=6'd30; #10;
    A=6'd63; B=6'd0;  #10;
    A=6'd0;  B=6'd63; #10;

    $finish;
end

endmodule
