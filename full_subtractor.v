module full_subtractor(
    input A, B, Bin,
    output Diff, Bout
);

wire x1, nx1, na;
wire t1, t2;

xor (x1, A, B);
xor (Diff, x1, Bin);

not (na, A);
not (nx1, x1);

and (t1, na, B);
and (t2, nx1, Bin);

or (Bout, t1, t2);

endmodule
