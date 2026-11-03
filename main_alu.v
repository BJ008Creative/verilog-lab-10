module main_alu(

    input [5:0] A,
    input [5:0] B,

    input [2:0] opcode,

    output [5:0] result,
    output [1:0] compare,
    output valid

);

// Individual operation results

wire [5:0] add_result;
wire [5:0] sub_result;
wire [5:0] and_result;
wire [5:0] or_result;
wire [5:0] not_result;
wire [5:0] mul_result;

wire add_valid;
wire sub_valid;
wire and_valid;
wire or_valid;
wire not_valid;
wire mul_valid;
wire cmp_valid;

wire [1:0] cmp_result;

// Opcode decoder

wire [7:0] select;

wire n0, n1, n2;

not (n0, opcode[0]);
not (n1, opcode[1]);
not (n2, opcode[2]);

and (select[0], n2, n1, n0);
and (select[1], n2, n1, opcode[0]);
and (select[2], n2, opcode[1], n0);
and (select[3], n2, opcode[1], opcode[0]);
and (select[4], opcode[2], n1, n0);
and (select[5], opcode[2], n1, opcode[0]);
and (select[6], opcode[2], opcode[1], n0);
and (select[7], opcode[2], opcode[1], opcode[0]);

// Adder

adder U1(
    .A(A),
    .B(B),
    .result(add_result),
    .valid(add_valid)
);

// Subtractor

subtractor U2(
    .A(A),
    .B(B),
    .result(sub_result),
    .valid(sub_valid),
    .borrow()
);

// AND

and_gate U3(
    .A(A),
    .B(B),
    .result(and_result),
    .valid(and_valid)
);

// OR

or_gate U4(
    .A(A),
    .B(B),
    .result(or_result),
    .valid(or_valid)
);

// NOT

not_gate U5(
    .A(A),
    .result(not_result),
    .valid(not_valid)
);

// Multiplier

multiplier U6(
    .A(A),
    .B(B),
    .result(mul_result),
    .valid(mul_valid)
);

// Comparator

comparator U7(
    .A(A),
    .B(B),
    .compare(cmp_result),
    .valid(cmp_valid)
);

// Result multiplexer

genvar i;

generate
    for(i=0; i<6; i=i+1) begin: RESULT_MUX

        wire t0, t1, t2, t3, t4, t5;

        and (t0, select[0], add_result[i]);
        and (t1, select[1], sub_result[i]);
        and (t2, select[2], and_result[i]);
        and (t3, select[3], or_result[i]);
        and (t4, select[4], not_result[i]);
        and (t5, select[5], mul_result[i]);

        or (result[i], t0, t1, t2, t3, t4, t5);

    end
endgenerate

// Comparator output multiplexer

and (compare[0], select[6], cmp_result[0]);
and (compare[1], select[6], cmp_result[1]);

// Valid output multiplexer

wire v0, v1, v2, v3, v4, v5, v6;

and (v0, select[0], add_valid);
and (v1, select[1], sub_valid);
and (v2, select[2], and_valid);
and (v3, select[3], or_valid);
and (v4, select[4], not_valid);
and (v5, select[5], mul_valid);
and (v6, select[6], cmp_valid);

or (valid, v0, v1, v2, v3, v4, v5, v6);

endmodule
