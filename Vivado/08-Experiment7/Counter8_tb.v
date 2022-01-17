`timescale 1ns/1ns
module Counter8_tb ();
    reg clk,reset;
    wire [2:0] Q;
    wire [6:0] Display;
    
    Counter8 uut (clk,reset,Q,Display);
    
    initial begin
        clk = 0;
        repeat(100) begin
            #8 clk = ~clk;
        end
    end
    
    initial begin
        reset = 0;
        #20
        reset = 1;
    end
endmodule
