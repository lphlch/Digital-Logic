module Counter8 (input CLK,
                 input rst_n,
                 output [2:0] oQ,
                 output [6:0] oDisplay);
    wire waste[2:0];
    JK_FF uut1(CLK,1'b1,1'b1,rst_n,oQ[0],waste[0]);
    JK_FF uut2(CLK,oQ[0],oQ[0],rst_n,oQ[1],waste[1]);
    
    wire Q1AndQ2;
    assign Q1AndQ2 = oQ[0] & oQ[1];
    JK_FF uut3(CLK,Q1AndQ2,Q1AndQ2,rst_n,oQ[2],waste[2]);
    
    wire [3:0] disData;
    assign disData[0] = oQ[0];
    assign disData[1] = oQ[1];
    assign disData[2] = oQ[2];
    assign disData[3] = 0;

    display7 dis(disData,oDisplay);
    
endmodule
    
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
 
module display7 (
    input [3:0] iData,
    output [6:0] oData
    );
    assign oData[0] = (~iData[3] & ~iData[2] & ~iData[1] & iData[0]) | (~iData[3] & iData[2] & ~iData[1] & ~iData[0]);
    assign oData[1] = (~iData[3] & iData[2] & ~iData[1] & iData[0]) | (~iData[3] & iData[2] & iData[1] & ~iData[0]);
    assign oData[2] = (~iData[3] & ~iData[2] & iData[1] & ~iData[0]);
    assign oData[3] = (~iData[3] & ~iData[2] & ~iData[1] & iData[0]) | (~iData[3] & iData[2] & ~iData[1] & ~iData[0]) | (~iData[3] & iData[2] & iData[1] & iData[0]);
    assign oData[4] = (~iData[3] & ~iData[2] & iData[0]) | (~iData[3] & iData[2] & ~iData[1]) | (~iData[3] & iData[2] & iData[1] & iData[0]) | (iData[3] & ~iData[2] & ~iData[1] & iData[0]);
    assign oData[5] = (~iData[3] & ~iData[2] & ~iData[1] & iData[0]) | (~iData[3] & ~iData[2] & iData[1]) | (~iData[3] & iData[2] & iData[1] & iData[0]);
    assign oData[6] = (~iData[3] & ~iData[2] & ~iData[1]) | (~iData[3] & iData[2] & iData[1] & iData[0]);
endmodule
