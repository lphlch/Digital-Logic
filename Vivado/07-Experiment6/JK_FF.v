module JK_FF (input CLK,
              input J,
              input K,
              input RST_n,
              output reg Q1,
              output reg Q2);
    
    always @(posedge CLK or negedge RST_n)    begin
        if (RST_n == 0) begin
            Q1 = 0;
            Q2 = 1;
        end
        else begin
            if (J == 1 && K == 1) begin
                Q1 = ~Q1;
                Q2 = ~Q2;
            end
            else
                if (J == 1 && K == 0) begin
                    Q1 = 1;
                    Q2 = 0;
                end
                else
                    if (J == 0 && K == 1) begin
                        Q1 = 0;
                        Q2 = 1;
                    end
            
        end
    end
    
endmodule