module ztj (input clk,
            input rst,
            input y);
    reg[2:0] status;
    always @(posedge clk) begin
        if (rst) begin
            status <= 0;
        end
        else begin
            
            case (status)
                3'b000:begin
                    if (y == 0) status < = 3'b100;
                    if (y == 1) status < = 3'b001;
                end
                3'b001:begin
                    if (y == 0) status < = 3'b000;
                    if (y == 1) status < = 3'b011;
                end
                3'b011:begin
                    if (y == 0) status < = 3'b001;
                    if (y == 1) status < = 3'b010;
                end
                3'b010:begin
                    if (y == 0) status < = 3'b011;
                    if (y == 1) status < = 3'b110;
                end
                3'b110:begin
                    if (y == 0) status < = 3'b010;
                    if (y == 1) status < = 3'b111;
                end
                3'b111:begin
                    if (y == 0) status < = 3'b110;
                    if (y == 1) status < = 3'b101;
                end
                3'b101:begin
                    if (y == 0) status < = 3'b111;
                    if (y == 1) status < = 3'b100;
                end
                3'b100:begin
                    if (y == 0) status < = 3'b101;
                    if (y == 1) status < = 3'b000;
                end
                default: status <= status;
            endcase
            
        end
    end

endmodule
    
    
