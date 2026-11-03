`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/03/2026 02:30:25 PM
// Design Name: 
// Module Name: tb_main_alu
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module tb_main_alu;

reg [5:0] A, B;
reg [2:0] opcode;

wire [5:0] result;
wire [1:0] compare;
wire valid;

main_alu uut(
    .A(A),
    .B(B),
    .opcode(opcode),
    .result(result),
    .compare(compare),
    .valid(valid)
);

initial begin

    $monitor(
    "Time=%0t | A=%d | B=%d | Opcode=%b | Result=%d | Compare=%b | Valid=%b",
    $time, A, B, opcode, result, compare, valid
    );

    // ADDITION

    A=6'd10; B=6'd20; opcode=3'b000;
    #20;

    // SUBTRACTION

    A=6'd40; B=6'd20; opcode=3'b001;
    #20;

    // AND

    A=6'b111100; B=6'b101010; opcode=3'b010;
    #20;

    // OR

    A=6'b111100; B=6'b101010; opcode=3'b011;
    #20;

    // NOT

    A=6'b101010; B=6'b000000; opcode=3'b100;
    #20;

    // MULTIPLICATION

    A=6'd5; B=6'd6; opcode=3'b101;
    #20;

    // COMPARATOR EQUAL

    A=6'd20; B=6'd20; opcode=3'b110;
    #20;

    // COMPARATOR GREATER

    A=6'd40; B=6'd20; opcode=3'b110;
    #20;

    // COMPARATOR SMALLER

    A=6'd10; B=6'd30; opcode=3'b110;
    #20;

    // ADDITION OVERFLOW

    A=6'd50; B=6'd30; opcode=3'b000;
    #20;

    // SUBTRACTION INVALID

    A=6'd10; B=6'd30; opcode=3'b001;
    #20;

    // MULTIPLICATION OVERFLOW

    A=6'd10; B=6'd10; opcode=3'b101;
    #20;

    // INVALID OPCODE

    A=6'd10; B=6'd20; opcode=3'b111;
    #20;

    $finish;

end

endmodule

