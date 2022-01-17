`timescale 1ns/1ns
module DataCompare8_tb ();
    reg [7:0] a,b;
    wire [2:0]o;
    
    DataCompare8 uut (a,b,o);
    
    initial begin
        a = 8'b00000000;
        b = 8'b00000000;
        #10
        a = 8'b10000000;
        #10
        a = 8'b00000010;
        #10
        b = 8'b00000010;
        #10
        b = 8'b01000000;
        #10
        a = 8'b11110000;
        #10
        b = 8'b11110000;
        #10
        b = 8'b11110111;
        #10
        a = 8'b11111111;
    end
    
endmodule
