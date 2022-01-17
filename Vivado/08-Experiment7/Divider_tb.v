`timescale 1ns/1ns
module Divider_tb ();
    reg clk,reset;
    wire oclk;
    
    Divider uut (clk,reset,oclk);
    
    initial begin
        clk = 0;
        repeat(300) begin
            #3 clk = ~clk;
        end
    end
    
    initial begin
        reset = 0;
        #450
        reset = 1;
    end
endmodule
