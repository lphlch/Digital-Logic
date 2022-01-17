module ztj (input clk,
            input rst,
            input k);
    reg[1:0] status;
    parameter S0 = 2'b00,S1 = 2'b01,S2 = 2'b10,S3 = 2'b11 ;
    always @(posedge clk) begin
        
        if (rst) begin
            status <= S0;
        end
        else begin
            case (status)
                S0: begin
                    if (k == 1) status< = S0;
                    if (k == 0) status< = S1;
                end
                S1: begin
                    if (k == 1) status< = S2;
                    if (k == 0) status< = S1;
                end
                S2: begin
                    if (k == 1) status< = S2;
                    if (k == 0) status< = S3;
                end
                S3: begin
                    if (k == 1) status< = S0;
                    if (k == 0) status< = S3;
                end
                default: state <= state;
            endcase
        end
        
    end
endmodule
