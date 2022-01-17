module display7 (
    input [3:0] iData,
    output [6:0] oData
);
    assign oData[0]=(~iData[3] & ~iData[2] & ~iData[1] & iData[0]) | (~iData[3] & iData[2] & ~iData[1] & ~iData[0]);
    assign oData[1]=(~iData[3] & iData[2] & ~iData[1] & iData[0]) | (~iData[3] & iData[2] & iData[1] & ~iData[0]);
    assign oData[2]=(~iData[3] & ~iData[2] & iData[1] & ~iData[0]);
    assign oData[3]=(~iData[3] & ~iData[2] & ~iData[1] & iData[0]) | (~iData[3] & iData[2] & ~iData[1] & ~iData[0]) | (~iData[3] & iData[2] & iData[1] & iData[0]);
    assign oData[4]=(~iData[3] & ~iData[2] & iData[0]) | (~iData[3] & iData[2] & ~iData[1]) | (~iData[3] & iData[2] & iData[1] & iData[0]) | (iData[3] & ~iData[2] & ~iData[1] & iData[0]);
    assign oData[5]=(~iData[3] & ~iData[2] & ~iData[1] & iData[0]) | (~iData[3] & ~iData[2] & iData[1]) | (~iData[3] & iData[2] & iData[1] & iData[0]);
    assign oData[6]=(~iData[3] & ~iData[2] & ~iData[1]) | (~iData[3] & iData[2] & iData[1] & iData[0]);
endmodule