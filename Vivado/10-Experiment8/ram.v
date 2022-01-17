module ram (input clk,
            input ena,
            input wena,
            input [4:0] addr,
            input [31:0] data_in,
            output reg [31:0] data_out);
    
    reg [31:0] ram_data [31:0];

    integer i;
    initial begin
        for ( i = 0;i <= 31;i = i+1 )
            ram_data[i] <= 0;
    end
    
    always @(posedge clk) begin
        if (ena) begin
            if (wena) begin
                ram_data[addr] <= data_in;
            end
        end
        else begin
            data_out <= 32'bz;
        end
        
    end
    always @(*) begin
        if (ena && wena == 0) begin
            data_out <= ram_data[addr];
        end
    end
endmodule
