module decoder(
    input [2:0] iData,
    input [1:0] iEna,
    output [7:0] oData
);
    assign oData[0]=~(iEna[1] & ~iEna[0] & ~iData[2] & ~iData[1] & ~iData[0]);
    assign oData[1]=~(iEna[1] & ~iEna[0] & ~iData[2] & ~iData[1] & iData[0]);
    assign oData[2]=~(iEna[1] & ~iEna[0] & ~iData[2] & iData[1] & ~iData[0]);
    assign oData[3]=~(iEna[1] & ~iEna[0] & ~iData[2] & iData[1] & iData[0]);
    assign oData[4]=~(iEna[1] & ~iEna[0] & iData[2] & ~iData[1] & ~iData[0]);
    assign oData[5]=~(iEna[1] & ~iEna[0] & iData[2] & ~iData[1] & iData[0]);
    assign oData[6]=~(iEna[1] & ~iEna[0] & iData[2] & iData[1] & ~iData[0]);
    assign oData[7]=~(iEna[1] & ~iEna[0] & iData[2] & iData[1] & iData[0]);
endmodule