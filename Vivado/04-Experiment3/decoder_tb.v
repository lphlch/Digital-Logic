`timescale 1ns/1ns
module decoder_tb ();
    reg [2:0] iData;
    reg [1:0] iEna;
    wire [7:0] oData;
    decoder uut(iData,iEna,oData);
    initial
    begin
        iEna=2'b00;

        #200 
        iEna=2'b01;

        #200 
        iEna=2'b10;

        #200 
        iEna=2'b11;

    end
    initial
    begin
        iData=3'b000;
        #25 iData=3'b001;
        #25 iData=3'b010;
        #25 iData=3'b011;
        #25 iData=3'b100;
        #25 iData=3'b101;
        #25 iData=3'b110;
        #25 iData=3'b111;

        #25 iData=3'b000;
        #25 iData=3'b001;
        #25 iData=3'b010;
        #25 iData=3'b011;
        #25 iData=3'b100;
        #25 iData=3'b101;
        #25 iData=3'b110;
        #25 iData=3'b111;

        #25 iData=3'b000;
        #25 iData=3'b001;
        #25 iData=3'b010;
        #25 iData=3'b011;
        #25 iData=3'b100;
        #25 iData=3'b101;
        #25 iData=3'b110;
        #25 iData=3'b111;

        #25 iData=3'b000;
        #25 iData=3'b001;
        #25 iData=3'b010;
        #25 iData=3'b011;
        #25 iData=3'b100;
        #25 iData=3'b101;
        #25 iData=3'b110;
        #25 iData=3'b111;
    end
endmodule