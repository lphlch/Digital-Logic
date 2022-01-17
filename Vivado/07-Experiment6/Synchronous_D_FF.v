module Synchronous_D_FF (input CLK,
                         input D,
                         input RST_n,
                         output reg Q1,
                         output reg Q2);
    
    always @(posedge CLK)    begin
        if (RST_n == 0) begin
            Q1 = 0;
            Q2 = 1;
        end
        
        if (RST_n == 1) begin
            Q1 = D;
            Q2 = ~D;
        end
    end
    
endmodule
