`timescale 1ns/1ns
module de_selector14_tb;
    reg iS1,iS0,iC;
    wire oZ0,oZ1,oZ2,oZ3;
    de_selector14 uut(iC,iS1,iS0,oZ0,oZ1,oZ2,oZ3);
    initial
    begin
        iS1=0;
        iS0=0;
        iC=0;
        #40 iS1=0;
        iS0=0;
        #40 iS1=0;
        iS0=1;
        #40 iS1=1;
        iS0=0;
        #40 iS1=1;
        iS0=1;
    end
endmodule