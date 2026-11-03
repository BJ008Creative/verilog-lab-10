`timescale 1ns/1ps

module tb_multiplier;

reg [5:0] A, B;

wire [5:0] result;
wire valid;

multiplier uut(A, B, result, valid);

initial begin
    $monitor("A=%d B=%d Result=%d Valid=%b",
              A, B, result, valid);

    A=6'd5;  B=6'd6;  #20;
    A=6'd7;  B=6'd8;  #20;
    A=6'd10; B=6'd10; #20;
    A=6'd63; B=6'd63; #20;
    A=6'd1;  B=6'd63; #20;
    A=6'd0;  B=6'd63; #20;

    $finish;
end

endmodule
