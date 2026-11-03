module not_gate(
    input [5:0] A,
    output [5:0] result,
    output valid
);

genvar i;

generate
    for(i=0; i<6; i=i+1) begin: NOT_STAGE

        not (result[i], A[i]);

    end
endgenerate

assign valid = 1'b1;

endmodule
