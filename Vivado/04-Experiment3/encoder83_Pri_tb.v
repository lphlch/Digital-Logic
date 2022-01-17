`timescale 1ns/1ns
module encoder83_Pri_tb ();
    reg [7:0] iData;
    reg iEI;
    wire [2:0] oData;
    wire oEO;
    encoder83_Pri uut(iData,iEI,oData,oEO);
    initial
    begin
        #25
        iData=8'b11111111;
        #25 iData=8'b11111110;
        #25 iData=8'b11111101;
        #25 iData=8'b11111011;
        #25 iData=8'b11110111;
        #25 iData=8'b11101111;
        #25 iData=8'b11011111;
        #25 iData=8'b10111111;
        #25 iData=8'b01111111;

        #25 iData=8'b11111110;
        #25 iData=8'b11111100;
        #25 iData=8'b11111001;
        #25 iData=8'b11110011;
        #25 iData=8'b11100110;
        #25 iData=8'b11010101;
        #25 iData=8'b10101010;
        #25 iData=8'b00001111;
        #25 iData=8'b01010100;

        #25 iData=8'b11111111;
        #25 iData=8'b11111110;
        #25 iData=8'b11111101;
        #25 iData=8'b11111011;
        #25 iData=8'b11110111;
        #25 iData=8'b11101111;
        #25 iData=8'b11011111;
        #25 iData=8'b10111111;
        #25 iData=8'b01111111;


    end

    initial
    begin
        #25
        iEI=0;
        #450 iEI=1;
    end
endmodule