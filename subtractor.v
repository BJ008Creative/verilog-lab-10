module subtractor(
    input [5:0] A, B,
    output [5:0] result,
    output valid,
    output borrow
);

wire [6:0] borrow_chain;

assign borrow_chain[0] = 1'b0;

genvar i;

generate
    for(i=0; i<6; i=i+1) begin: SUB_STAGE

        full_subtractor FS(
            .A(A[i]),
            .B(B[i]),
            .Bin(borrow_chain[i]),
            .Diff(result[i]),
            .Bout(borrow_chain[i+1])
        );

    end
endgenerate

assign borrow = borrow_chain[6];

not (valid, borrow);

endmodule
