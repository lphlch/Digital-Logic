module Divider (input I_CLK,
                input rst,
                output reg O_CLK);
    
    parameter i = 20;
    reg[3:0] counter;

    initial begin
        O_CLK=0;
        counter=0;
    end

    always @(posedge I_CLK) begin
        if (rst) begin
            counter <= 0;
            O_CLK <= 0;
        end
        else if (counter < i/2-1) begin
            counter <= counter + 1;
            O_CLK <= O_CLK;
        end
        else begin
            counter <= 0;
            O_CLK <= ~O_CLK;
        end
    end
endmodule