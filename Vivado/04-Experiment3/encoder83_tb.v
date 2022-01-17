`timescale 1ns/1ns
module encoder83_tb ();
    reg [7:0] iData;
    wire [2:0] oData;
    encoder83 uut(iData,oData);
    initial
    begin
        iData=8'b00000000;
        #100 iData=8'b00000001;
        #100 iData=8'b00000010;
        #100 iData=8'b00000100;
        #100 iData=8'b00001000;
        #100 iData=8'b00010000;
        #100 iData=8'b00100000;
        #100 iData=8'b01000000;
        #100 iData=8'b10000000;
    end
endmodule