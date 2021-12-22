module Seg8(input iClk,
            input iReset_n,
            input [2:0] iControl_Speed,
            input [2:0] iControl_Freq,
            output reg [7:0] oSeg,
            output reg [7:0] oAn);
    
    wire [2:0] s;
    reg [3:0] digit;
    wire [7:0] aen;
    reg [19:0] clkdiv;
    
    /* 
     //////////////gfedcba.////////////////////////////////////////////           a
     0:oSeg = 8'b10000001;												   __
     1:oSeg = 8'b11110011;												f/	  /b
     2:oSeg = 8'b01001001;												  g                                                                  __
     3:oSeg = 8'b01100001;										 	 e /   /c
     4:oSeg = 8'b00110011;										       __
     5:oSeg = 8'b00100101;                                            d
     6:oSeg = 8'b00000101;
     7:oSeg = 8'b11110001;
     8:oSeg = 8'b00000001;
     9:oSeg = 8'b00100001;
     L:oSeg = 8'b10001111;
     H:oSeg = 8'b00010011;
 */
    
    parameter i = 5000;
    reg[20:0] counter;
    reg O_CLK;
    
    always @(posedge iClk) begin
        if (!iReset_n) begin
            counter <= 0;
            O_CLK   <= 0;
        end
        else if (counter < i/2-1) begin
            counter <= counter + 1;
            O_CLK   <= O_CLK;
        end
        else begin
            counter <= 0;
            O_CLK   <= ~O_CLK;
        end
    end
    
    reg[3:0] position;
    always @(posedge O_CLK) begin
        if (!iReset_n) begin
            position <= 0;
            oSeg     <= 8'b11111111;
        end
        else begin
            
            
            if (position> 7) begin
                position <= 0;
            end
            else begin
                position <= position + 1;
            end
            case (position)
                0:begin
                    case (iControl_Speed)
                        1,3: oSeg         <= 8'b00100101; //5
                        0,2,4,5,6,7: oSeg <= 8'b10000001; //0
                        default: oSeg     <= 8'b11111111;
                    endcase
                end
                1:begin
                    case (iControl_Speed)
                        2,5: oSeg     <= 8'b00100101; //5
                        1: oSeg     <= 8'b01001001; //2
                        0,4,6,7: oSeg <= 8'b10000001; //0
                        3:oSeg <= 8'b11110001; //7
                        default: oSeg <= 8'b11111111;
                    endcase
                end
                2:begin
                    case (iControl_Speed)
                        6: oSeg       <= 8'b01001000; //2.
                        7: oSeg       <= 8'b01100000; //3.
                        4,5,0: oSeg <= 8'b11110010; //1.
                        1,2,3: oSeg     <= 8'b10000000; //0.
                        default: oSeg <= 8'b11111111;
                    endcase
                end
                6:begin
                    case (iControl_Freq)
                        0,4:oSeg      <= 8'b10000001; //0
                        1,7: oSeg     <= 8'b01100001; //3
                        2,6: oSeg     <= 8'b01001001; //2
                        3,5: oSeg     <= 8'b11110011; //1
                        default: oSeg <= 8'b11111111;
                    endcase
                end
                7:begin
                    case (iControl_Freq)
                        1,2,3:oSeg    <= 8'b10001111; //-
                        5,6,7: oSeg   <= 8'b00010011; //+
                        default: oSeg <= 8'b11111111;
                    endcase
                end
                default: oSeg <= 8'b11111111;
            endcase
            
            /*
             case (iControl_Speed)
             1: begin
             case (position)
             0: oSeg       <= 8'b00100101; //5
             1: oSeg       <= 8'b01001001; //2
             2: oSeg       <= 8'b10000000; //0.
             6: oSeg       <= oSeg;
             7: oSeg       <= oSeg;
             default: oSeg <= 8'b11111111;
             endcase
             end
             2:begin
             case (position)
             0: oSeg       <= 8'b10000001; //0
             1: oSeg       <= 8'b00100101; //5
             2: oSeg       <= 8'b10000000; //0.
             6: oSeg       <= oSeg;
             7: oSeg       <= oSeg;
             default: oSeg <= 8'b11111111;
             endcase
             end
             3:begin
             case (position)
             0: oSeg       <= 8'b10000001; //0
             1: oSeg       <= 8'b10000001; //0
             2: oSeg       <= 8'b11110010; //1.
             6: oSeg       <= oSeg;
             7: oSeg       <= oSeg;
             default: oSeg <= 8'b11111111;
             endcase
             end
             4:begin
             case (position)
             0: oSeg       <= 8'b00100101; //5
             1: oSeg       <= 8'b01001001; //2
             2: oSeg       <= 8'b11110010; //1.
             6: oSeg       <= oSeg;
             7: oSeg       <= oSeg;
             default: oSeg <= 8'b11111111;
             endcase
             end
             5:begin
             case (position)
             0: oSeg       <= 8'b10000001; //0
             1: oSeg       <= 8'b00100101; //5
             2: oSeg       <= 8'b11110010; //1.
             6: oSeg       <= oSeg;
             7: oSeg       <= oSeg;
             default: oSeg <= 8'b11111111;
             endcase
             end
             6:begin
             case (position)
             0: oSeg       <= 8'b10000001; //0
             1: oSeg       <= 8'b10000001; //0
             2: oSeg       <= 8'b01001001; //2.
             6: oSeg       <= oSeg;
             7: oSeg       <= oSeg;
             default: oSeg <= 8'b11111111;
             endcase
             end
             7:begin
             case (position)
             0: oSeg       <= 8'b10000001; //0
             1: oSeg       <= 8'b10000001; //0
             2: oSeg       <= 8'b01100000; //3.
             6: oSeg       <= oSeg;
             7: oSeg       <= oSeg;
             default: oSeg <= 8'b11111111;
             endcase
             end
             default: begin
             case (position)
             0: oSeg       <= 8'b10000001; //0
             1: oSeg       <= 8'b10000001; //0
             2: oSeg       <= 8'b11110010; //1.
             6: oSeg       <= oSeg;
             7: oSeg       <= oSeg;
             default: oSeg <= 8'b11111111;
             endcase
             end
             endcase
             
             case (iControl_Freq)
             1: begin
             case (position)
             6: oSeg       <= 8'b10001111; //-
             7: oSeg       <= 8'b01100001; //3
             default: oSeg <= oSeg;
             endcase
             end
             2: begin
             case (position)
             6: oSeg       <= 8'b10001111; //-
             7: oSeg       <= 8'b01001001; //2
             default: oSeg <= oSeg;
             endcase
             end
             3: begin
             case (position)
             6: oSeg       <= 8'b10001111; //-
             7: oSeg       <= 8'b11110011; //1
             default: oSeg <= oSeg;
             endcase
             end
             4: begin
             case (position)
             6: oSeg       <= 0; //
             7: oSeg       <= 8'b10000001; //0
             default: oSeg <= oSeg;
             endcase
             end
             5: begin
             case (position)
             6: oSeg       <= 8'b00010011; //+
             7: oSeg       <= 8'b11110011; //1
             default: oSeg <= oSeg;
             endcase
             end
             6: begin
             case (position)
             6: oSeg       <= 8'b00010011; //+
             7: oSeg       <= 8'b01001001; //2
             default: oSeg <= oSeg;
             endcase
             end
             7: begin
             case (position)
             6: oSeg       <= 8'b00010011; //+
             7: oSeg       <= 8'b01100001; //3
             default: oSeg <= oSeg;
             endcase
             end
             default: begin
             case (position)
             6: oSeg       <= 0; //
             7: oSeg       <= 8'b10000001; //0
             default: oSeg <= oSeg;
             endcase
             end
             endcase */
        end
    end
    
    always @(*) begin
        if (!iReset_n) begin
            oAn <= 8'b11111111;
        end
        else begin
            oAn           <= 8'b11111111;
            oAn[(position+7)%8] <= 0;
        end
    end
endmodule
