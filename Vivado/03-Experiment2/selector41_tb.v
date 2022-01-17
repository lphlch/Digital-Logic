`timescale 1ns/1ns
module selector41_tb;
    reg iS1;
    reg iS0;
    reg [3:0]iC0,iC1,iC2,iC3;
    wire [3:0]oZ;
    selector41 uut(iC0,iC1,iC2,iC3,iS1,iS0,oZ);
    initial
    begin
        iS1=0;
        #40 iS1=0;
        #40 iS1=0;
        #40 iS1=1;
        #40 iS1=1;
    end
    initial
    begin
        iS0=0;
        iC0=4'b0001;
        iC1=4'b0011;
        iC2=4'b0111;
        iC3=4'b1111;
        #40 iS0=0;
        #40 iS0=1;
        #40 iS0=0;
        #40 iS0=1;
    end

endmodule