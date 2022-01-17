`timescale 1ns/1ns
module barrelshifter32_tb ();
    reg [31:0] a;
    reg [4:0]  b;
    reg [1:0]  aluc;
    wire [31:0] c;
    barrelshifter32 uut(a,b,aluc,c);
    
    initial begin
        a = 32'b10100101111100001100001111100111;
        repeat (4) begin
            b = 5'b00000;
            repeat (31) begin
                #10 b = b+1;
            end
        end
        
    end
    
    initial begin
        aluc      = 2'b00;
        #320 aluc = 2'b01;
        #320 aluc = 2'b10;
        #320 aluc = 2'b11;
    end
endmodule
