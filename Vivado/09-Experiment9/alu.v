module alu (
    input [31:0] a,
    input [31:0] b,
    input [3:0] aluc,
    output reg [31:0] r,
    output reg zero,
    output reg carry,
    output reg negative,
    output reg overflow
);
    wire[31:0] r_addu,r_add,r_subu,r_sub,r_and,r_or,r_xor,r_nor,r_lui,r_slt,r_sltu,r_sra,r_sll_sla,r_srl;
    wire c_sra,c_sll_sla,c_srl;
    assign r_addu=a+b;
    assign r_add=a+b;
    assign r_subu=a-b;
    assign r_sub=a-b;

    assign r_and=a&b;
    assign r_or=a|b;
    assign r_xor=a^b;
    assign r_nor=~(a|b);
    assign r_lui={b[15:0],16'b0};

    assign r_sltu=($unsigned(a))<($unsigned(b));
    assign r_slt=($signed(a))<($signed(b));
    
    assign c_sra=b[a[4:0]-1];
    assign r_sra=$signed(b)>>>a[4:0];
    assign c_sll_sla=b[32-a[4:0]];
    assign r_sll_sla=b<<a[4:0];
    assign c_srl=b[a[4:0]-1];
    assign r_srl=b>>a[4:0];

    always @(*) begin
        case (aluc)    
            4'b0000: begin  //ADDU
                r=r_addu;
                zero=r==0;
                carry=(r_addu<a || r_addu<b);
                negative=r[31];
            end
            4'b0010: begin  //ADD
                r=r_add;
                zero=r==0;
                negative=r[31];
                overflow=(a[31]==b[31] && r[31]!=a[31]);
            end
            4'b0001: begin  //SUBU
                r=r_subu;
                zero=r==0;
                carry=a<b;
                negative=r[31];
            end
            4'b0011: begin  //SUB
                r=r_sub;
                zero=r==0;
                negative=r[31];
                overflow=(a[31]!=b[31] && r[31]!=a[31]);
            end
            4'b0100: begin  //AND
                r=r_and;
                zero=r==0;
                negative=r[31];
            end
            4'b0101: begin  //OR
                r=r_or;
                zero=r==0;
                negative=r[31];
            end
            4'b0110: begin  //XOR
                r=r_xor;
                zero=r==0;
                negative=r[31];
            end
            4'b0111: begin  //NOR
                r=r_nor;
                zero=r==0;
                negative=r[31];
            end
            4'b1000: begin  //LUI
                r=r_lui;
                zero=r==0;
                negative=r[31];
            end
            4'b1001: begin  //LUI
                r=r_lui;
                zero=r==0;
                negative=r[31];
            end
            4'b1011: begin  //SLT
                r=r_slt;
                zero=a==b;
                negative=r_slt;
            end
            4'b1010: begin  //SLTU
                r=r_sltu;
                zero=a==b;
                carry=a<b;
                negative=r[31];
            end
            4'b1100: begin  //SRA
                r=r_sra;
                zero=r==0;
                carry=a[4:0]==0? 0 : c_sra;
                negative=r[31];
            end
            4'b1111: begin  //SLL/SLA
                r=r_sll_sla;
                zero=r==0;
                carry=a[4:0]==0? 0 : c_sll_sla;
                negative=r[31];
            end
            4'b1110: begin  //SLL/SLA
                r=r_sll_sla;
                zero=r==0;
                carry=a[4:0]==0? 0 : c_sll_sla;
                negative=r[31];
            end
            4'b1101: begin  //SRL
                r=r_srl;
                zero=r==0;
                carry=a[4:0]==0? 0 : c_srl;
                negative=r[31];
            end
            default: begin
            end
        endcase
    end
endmodule