module multiplier(
    input [5:0] A, B,
    output [5:0] result,
    output valid
);

wire [5:0] pp [0:5];

wire [11:0] row [0:5];

wire [11:0] s1, s2, s3, s4, product;

wire c1, c2, c3, c4, c5;

genvar i, j;

// Generate partial products

generate
    for(i=0; i<6; i=i+1) begin: PP_ROW

        for(j=0; j<6; j=j+1) begin: PP_COL

            and (pp[i][j], A[j], B[i]);

        end
    end
endgenerate

// Shift partial products

assign row[0] = {6'b000000, pp[0]};

assign row[1] = {5'b00000, pp[1], 1'b0};

assign row[2] = {4'b0000, pp[2], 2'b00};

assign row[3] = {3'b000, pp[3], 3'b000};

assign row[4] = {2'b00, pp[4], 4'b0000};

assign row[5] = {1'b0, pp[5], 5'b00000};

// Add partial products

adder12 ADD1(
    .A(row[0]),
    .B(row[1]),
    .Sum(s1),
    .Cout(c1)
);

adder12 ADD2(
    .A(s1),
    .B(row[2]),
    .Sum(s2),
    .Cout(c2)
);

adder12 ADD3(
    .A(s2),
    .B(row[3]),
    .Sum(s3),
    .Cout(c3)
);

adder12 ADD4(
    .A(s3),
    .B(row[4]),
    .Sum(s4),
    .Cout(c4)
);

adder12 ADD5(
    .A(s4),
    .B(row[5]),
    .Sum(product),
    .Cout(c5)
);

// Output lower six bits

assign result = product[5:0];

// Valid when upper six bits are zero

nor (valid,
     product[6],
     product[7],
     product[8],
     product[9],
     product[10],
     product[11]);

endmodule
