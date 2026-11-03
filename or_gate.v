module or_gate(
    input [5:0] A, B,
    output [5:0] result,
    output valid
);

genvar i;

generate
    for(i=0; i<6; i=i+1) begin: OR_STAGE

        or (result[i], A[i], B[i]);

    end
endgenerate

assign valid = 1'b1;

endmodule
