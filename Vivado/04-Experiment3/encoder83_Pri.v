module encoder83_Pri(
    input [7:0] iData,
    input iEI,
    output [2:0] oData,
    output oEO
);
    assign oData[2]=~(~iEI & (~iData[7] | ~iData[6] | ~iData[5] | ~iData[4]));
    assign oData[1]=~(~iEI & (~iData[7] | ~iData[6] | (iData[5] & iData[4] & ~iData[3]) | (iData[5] & iData[4] & ~iData[2])));
    assign oData[0]=~(~iEI & (~iData[7] | (iData[6] & ~iData[5]) | (iData[6] & iData[4] & ~iData[3]) | (iData[6] & iData[4] & iData[2] & ~iData[1])));
    assign oEO=~(~iEI & iData[7] & iData[6] & iData[5] & iData[4] & iData[3] & iData[2] & iData[1] & iData[0]) & ~iEI;
endmodule