`timescale 1ns/1ns
module decoder_tb ();
    reg [3:0] iData;
    wire [6:0] oData;
    display7 uut(iData,oData);
    initial
    begin
        iData=4'b0000;
        #25 iData=4'b0001;
        #25 iData=4'b0010;
        #25 iData=4'b0011;
        #25 iData=4'b0100;
        #25 iData=4'b0101;
        #25 iData=4'b0110;
        #25 iData=4'b0111;
        #25 iData=4'b1000;
        #25 iData=4'b1001;
        #25 iData=4'b1010;
        #25 iData=4'b1011;
        #25 iData=4'b1100;
        #25 iData=4'b1101;
        #25 iData=4'b1110;
        #25 iData=4'b1111;
    end
endmodule