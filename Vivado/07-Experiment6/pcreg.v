module pcreg (input clk,
              input rst,
              input ena,
              input[31:0] data_in,
              output reg[31:0] data_out);
    
    always @(posedge clk or posedge rst) begin
        if (rst == 1) begin
            data_out = 0;
        end
        else
            if (ena == 1) begin
                data_out = data_in;
            end
    end
endmodule