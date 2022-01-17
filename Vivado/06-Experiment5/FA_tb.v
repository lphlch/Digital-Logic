`timescale 1ns/1ns
module FA_tb ();
    reg A,B,Ci;
    wire Co,S;
    FA uut (A,B,Ci,S,Co);
    
    initial begin
        A      = 0;
        #100 A = 1;
    end
    initial begin
        B     = 0;
        #50 B = 1;
        #50 B = 0;
        #50 B = 1;
    end
    initial begin
        Ci     = 0;
        #25 Ci = 1;
        #25 Ci = 0;
        #25 Ci = 1;
        #25 Ci = 0;
        #25 Ci = 1;
        #25 Ci = 0;
        #25 Ci = 1;
    end
endmodule
