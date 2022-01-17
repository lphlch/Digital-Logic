module transmission8(
    input [7:0] iData,
    input A,B,C,
    output [7:0] oData
);
    wire Y;
    assign Y=  ( (iData[0] & ~C & ~B & ~A) | 
                (iData[1] & C & ~B & ~A) |
                (iData[2] & ~C & B & ~A) | 
                (iData[3] & C & B & ~A) | 
                (iData[4] & ~C & ~B & A) | 
                (iData[5] & C & ~B & A) | 
                (iData[6] & ~C & B & A) | 
                (iData[7] & C & B & A));

    assign oData[0]= Y | A | B | C;
    assign oData[1]= Y | A | B | ~C;
    assign oData[2]= Y | A | ~B | C;
    assign oData[3]= Y | A | ~B | ~C;
    assign oData[4]= Y | ~A | B | C;
    assign oData[5]= Y | ~A | B | ~C;
    assign oData[6]= Y | ~A | ~B | C;
    assign oData[7]= Y | ~A | ~B | ~C;
endmodule