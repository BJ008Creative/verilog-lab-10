module comparator(
    input [5:0] A, B,
    output [1:0] compare,
    output valid
);

wire [5:0] difference;

wire borrow;
wire equal;

wire nborrow;
wire nequal;

// Instantiate subtractor

subtractor SUB1(
    .A(A),
    .B(B),
    .result(difference),
    .valid(),
    .borrow(borrow)
);

// Check whether difference is zero

nor (equal,
     difference[0],
     difference[1],
     difference[2],
     difference[3],
     difference[4],
     difference[5]);

// Gate-level comparison logic

not (nborrow, borrow);
not (nequal, equal);

and (compare[0], nborrow, nequal);

assign compare[1] = borrow;

assign valid = 1'b1;

endmodule
