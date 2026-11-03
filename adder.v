`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/03/2026 02:23:16 PM
// Design Name: 
// Module Name: adder
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

module adder(
    input [5:0] A, B,
    output [5:0] result,
    output valid
);

wire [6:0] carry;

assign carry[0] = 1'b0;

genvar i;

generate
    for(i=0; i<6; i=i+1) begin: ADD_STAGE

        full_adder FA(
            .A(A[i]),
            .B(B[i]),
            .Cin(carry[i]),
            .Sum(result[i]),
            .Cout(carry[i+1])
        );

    end
endgenerate

not (valid, carry[6]);

endmodule

