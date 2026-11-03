`timescale 1ns/1ps

module tb_subtractor;

reg [5:0] A, B;

wire [5:0] result;
wire valid, borrow;

subtractor uut(A, B, result, valid, borrow);

initial begin
    $monitor("A=%d B=%d Result=%d Valid=%b Borrow=%b",
              A, B, result, valid, borrow);

    A=6'd30; B=6'd10; #10;
    A=6'd50; B=6'd20; #10;
    A=6'd10; B=6'd30; #10;
    A=6'd25; B=6'd25; #10;
    A=6'd0;  B=6'd1;  #10;

    $finish;
end

endmodule
 