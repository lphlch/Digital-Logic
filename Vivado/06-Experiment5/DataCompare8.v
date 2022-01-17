module DataCompare8 (
    input [7:0] iData_a,
    input [7:0] iData_b,
    output [2:0] oData);

    wire [2:0] lowData;
    DataCompare4 low(iData_a[3:0],iData_b[3:0],3'b001,lowData);
    DataCompare4 high(iData_a[7:4],iData_b[7:4],lowData,oData);
endmodule

module DataCompare4 (input [3:0] iData_a,
                     input [3:0] iData_b,
                     input [2:0] iData,
                     output [2:0] oData);
reg[2:0] oDataReg;
always @(*) begin
    if (iData_a>iData_b)
        oDataReg = 3'b100;
    else if (iData_a<iData_b)
        oDataReg = 3'b010;
    else
        oDataReg = iData;
end
assign oData = oDataReg;

endmodule
