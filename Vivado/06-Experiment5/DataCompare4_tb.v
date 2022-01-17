`timescale 1ns/1ns
module DataCompare4_tb ();
    reg [3:0] a,b;
    reg [2:0] comp;
    wire [2:0]o;
    
    DataCompare4 uut (a,b,comp,o);
    
    initial begin
        repeat (3) begin
            a = 4'b0000;
            b = 4'b0000;
            #10
            a = 4'b0010;
            #10
            a = 4'b0100;
            #10
            a = 4'b1000;
            #10
            b = 4'b0010;
            #10
            b = 4'b0110;
            #10
            b = 4'b1100;
        end
    end
    
    initial begin
        comp     = 3'b001;
        #60 comp = 3'b010;
        #60 comp = 3'b100;
    end
endmodule
