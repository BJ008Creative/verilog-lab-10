module adder12(
    input [11:0] A, B,
    output [11:0] Sum,
    output Cout
);

wire [12:0] carry;

assign carry[0] = 1'b0;

genvar i;

generate
    for(i=0; i<12; i=i+1) begin: ADD12_STAGE

        full_adder FA(
            .A(A[i]),
            .B(B[i]),
            .Cin(carry[i]),
            .Sum(Sum[i]),
            .Cout(carry[i+1])
        );

    end
endgenerate

assign Cout = carry[12];

endmodule
