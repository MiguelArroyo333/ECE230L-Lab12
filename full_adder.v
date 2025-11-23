module full_adder(
    input a,
    input b,
    input cin,
    output sum,
    output cout
);

    // Full adder logic using basic gates
    assign sum = a ^ b ^ cin;
    assign cout = (a & b) | (b & cin) | (a & cin);

endmodule