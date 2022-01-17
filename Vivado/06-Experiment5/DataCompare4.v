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
