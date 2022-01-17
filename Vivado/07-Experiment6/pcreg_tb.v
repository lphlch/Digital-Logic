`timescale 1ns/1ns
module pcreg_tb ();
    reg clk,reset,ena;
    reg[31:0] in;
    wire [31:0] out;
    
    pcreg uut (clk,reset,ena,in,out);
    
    initial begin
        in=0;
        reset=0;
        ena=0;
        #20
        in=10;
        #20
        ena=1;
    #20
        in=100;
        #20
        reset=1;
        #20
        in=50;
        #20
        ena=0;
        #20
        reset=0;
        #20
        in=100;
        #20
        ena=1;
        #20
        in=150;
        #20
        reset=1;
    end
    
    initial begin
        clk = 0;
        
        repeat(100) begin
            #8 clk = ~clk;
        end
    end
    
endmodule
