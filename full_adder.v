module full_adder(
    input A, B, Cin,
    output sum, Cout
);

    assign sum = A ^ B ^ Cin;
    assign Cout = (A & B) | (B & Cin) | (A & Cin);

endmodule