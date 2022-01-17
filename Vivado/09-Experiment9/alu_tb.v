`timescale 1ns/1ns
module alu_tb ();
    reg[31:0] a,b;
    reg [3:0] aluc;
    wire [31:0] result;
    wire zero,carry,negative,overflow;

    alu uut(a,b,aluc,result,zero,carry,negative,overflow);
    initial begin
        a=0;
        b=0;
        aluc=0;
        repeat(16) begin
            #10 aluc=aluc+1;
        end
        #10
        a=32'hffffffff;
        b=32'h80000000;
        repeat(16) begin
            #5 aluc=aluc+1;
        end
        #10
        a=32'h00000008;
        b=32'hffffffff;
        repeat(16) begin
            #5 aluc=aluc+1;
        end
        #10
        a=32'h00000010;
        b=32'h80000000;
        repeat(16) begin
            #5 aluc=aluc+1;
        end
        #10
        a=32;   // 0b00000000000000000000000000100000
        b=64;   // 0b00000000000000000000000001000000
        repeat(16) begin
            #5 aluc=aluc+1;
        end
        #10
        a=-32;  // 0b11111111111111111111111111111000
        b=32;   // 0b00000000000000000000000000100000
        repeat(16) begin
            #5 aluc=aluc+1;
        end
        #10
        a=-32;  // 0b11111111111111111111111111111000
        b=64;   // 0b00000000000000000000000001000000
        repeat(16) begin
            #5 aluc=aluc+1;
        end
        #10
        a=32;   // 0b00000000000000000000000000100000
        b=-64;  // 0b11111111111111111111111111111000
        repeat(16) begin
            #5 aluc=aluc+1;
        end
        #10
        a=32'b11111111111111111111111111111111;
        b=32'b01111111111111111111111111111111;
        repeat(16) begin
            #5 aluc=aluc+1;
        end
        #10
        a=32'b00000000000000000000000000001111; //15
        b=32'b10000000000000000000000000000000; //-very big
        repeat(16) begin
            #5 aluc=aluc+1;
        end
        #10
        a=32'b01111111111111111111111111111111;
        b=1;
        repeat(16) begin
            #5 aluc=aluc+1;
        end
        #10
        a=0;
        b=32'b00000000000000000000000000000001;
        repeat(16) begin
            #5 aluc=aluc+1;
        end

    end
endmodule