module de_selector14(
    input iC,
    input iS1,
    input iS0,
    output oZ0,
    output oZ1,
    output oZ2,
    output oZ3
);
    assign oZ0= iC | iS1 | iS0;
    assign oZ1= iC | iS1 | ~iS0;
    assign oZ2= iC | ~iS1 | iS0;
    assign oZ3= iC | ~iS1 | ~iS0;
endmodule