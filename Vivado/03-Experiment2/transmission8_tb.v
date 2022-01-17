`timescale 1ns/1ns
module transmission8_tb;
    reg [7:0] iData;
    wire [7:0] oData;
    reg A,B,C;
    transmission8 uut(iData,A,B,C,oData);
    initial
    begin
        iData=8'b00001111;
        A=0;B=0;C=0;
        #40 A=0;B=0;C=1;
        #40 A=0;B=1;C=0;
        #40 A=0;B=1;C=1;
        #40 A=1;B=0;C=0;
        #40 A=1;B=0;C=1;
        #40 A=1;B=1;C=0;
        #40 A=1;B=1;C=1;
        #100
        iData=8'b10101010;
        A=0;B=0;C=0;
        #40 A=0;B=0;C=1;
        #40 A=0;B=1;C=0;
        #40 A=0;B=1;C=1;
        #40 A=1;B=0;C=0;
        #40 A=1;B=0;C=1;
        #40 A=1;B=1;C=0;
        #40 A=1;B=1;C=1;
    end
endmodule