`timescale 1ns/1ns
module JK_FF_tb ();
    reg clk,j,k,reset;
    wire out1,out2;
    
    JK_FF uut (clk,j,k,reset,out1,out2);
    
    initial begin
        reset = 1;
        j     = 0;
        k     = 0;
        #30
        j = 1;
        #30
        reset = 0;
        #30
        k = 1;
        #30
        j = 0;
        #30
        k = 0;
        #30
        reset = 1;
        #30
        j = 0;
        k = 1;
        #30
        j = 1;
        k = 0;
        #30
        j = 1;
        k = 1;
        #30
        j = 0;
        k = 0;
        #30
        reset = 0;
    end
    
    initial begin
        clk = 0;
        
        repeat(100) begin
            #8 clk = ~clk;
        end
    end
    
endmodule
