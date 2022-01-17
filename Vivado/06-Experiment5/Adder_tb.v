`timescale 1ns/1ns
module Adder_tb ();
    reg[7:0] A,B;
    reg Ci;
    wire Co;
    wire [7:0] S;
    Adder uut (A,B,Ci,S,Co);
    
    initial begin
        A  = 8'b00000000;
        B  = 8'b00000000;
        Ci = 0;   //0
        #10
        A  = 8'b10000000;
        B  = 8'b10000000;
        Ci = 0;   //co = 1,s = 0
        #10
        Ci = 1;   //co = 1,s = 1
        #10
        A  = 8'b11111111;
        B  = 8'b11111111;
        Ci = 0;   //co = 1,s = 11111110
        #10
        Ci = 1;   //co = 1,s = 11111111
        #10
        A  = 8'b01010101;
        B  = 8'b10101010;
        Ci = 0;   //co = 0,s = 11111111
        #10
        Ci = 1;   //co = 1,s = 0
    end
endmodule
