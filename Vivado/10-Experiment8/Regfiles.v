module Regfiles (input clk,
                 input rst,
                 input we,
                 input [4:0] raddr1,
                 input [4:0] raddr2,
                 input [4:0] waddr,
                 input [31:0] wdata,
                 output [31:0] rdata1,
                 output [31:0] rdata2);
    wire[31:0] decAddress;
    wire[31:0] regOutData[31:0];
    decoder dec(waddr,we,decAddress);

    pcreg reg0(clk, rst, decAddress[0], wdata, regOutData[0]);
    pcreg reg1(clk, rst, decAddress[1], wdata, regOutData[1]);
    pcreg reg2(clk, rst, decAddress[2], wdata, regOutData[2]);
    pcreg reg3(clk, rst, decAddress[3], wdata, regOutData[3]);
    pcreg reg4(clk, rst, decAddress[4], wdata, regOutData[4]);
    pcreg reg5(clk, rst, decAddress[5], wdata, regOutData[5]);
    pcreg reg6(clk, rst, decAddress[6], wdata, regOutData[6]);
    pcreg reg7(clk, rst, decAddress[7], wdata, regOutData[7]);
    pcreg reg8(clk, rst, decAddress[8], wdata, regOutData[8]);
    pcreg reg9(clk, rst, decAddress[9], wdata, regOutData[9]);
    pcreg reg10(clk, rst, decAddress[10], wdata, regOutData[10]);
    pcreg reg11(clk, rst, decAddress[11], wdata, regOutData[11]);
    pcreg reg12(clk, rst, decAddress[12], wdata, regOutData[12]);
    pcreg reg13(clk, rst, decAddress[13], wdata, regOutData[13]);
    pcreg reg14(clk, rst, decAddress[14], wdata, regOutData[14]);
    pcreg reg15(clk, rst, decAddress[15], wdata, regOutData[15]);
    pcreg reg16(clk, rst, decAddress[16], wdata, regOutData[16]);
    pcreg reg17(clk, rst, decAddress[17], wdata, regOutData[17]);
    pcreg reg18(clk, rst, decAddress[18], wdata, regOutData[18]);
    pcreg reg19(clk, rst, decAddress[19], wdata, regOutData[19]);
    pcreg reg20(clk, rst, decAddress[20], wdata, regOutData[20]);
    pcreg reg21(clk, rst, decAddress[21], wdata, regOutData[21]);
    pcreg reg22(clk, rst, decAddress[22], wdata, regOutData[22]);
    pcreg reg23(clk, rst, decAddress[23], wdata, regOutData[23]);
    pcreg reg24(clk, rst, decAddress[24], wdata, regOutData[24]);
    pcreg reg25(clk, rst, decAddress[25], wdata, regOutData[25]);
    pcreg reg26(clk, rst, decAddress[26], wdata, regOutData[26]);
    pcreg reg27(clk, rst, decAddress[27], wdata, regOutData[27]);
    pcreg reg28(clk, rst, decAddress[28], wdata, regOutData[28]);
    pcreg reg29(clk, rst, decAddress[29], wdata, regOutData[29]);
    pcreg reg30(clk, rst, decAddress[30], wdata, regOutData[30]);
    pcreg reg31(clk, rst, decAddress[31], wdata, regOutData[31]);

    wire re;
    assign re=~we;
    selector321 sel1(regOutData[0],regOutData[1],regOutData[2],regOutData[3],regOutData[4],regOutData[5],regOutData[6],regOutData[7],regOutData[8],regOutData[9],regOutData[10],regOutData[11],regOutData[12],regOutData[13],regOutData[14],regOutData[15],regOutData[16],regOutData[17],regOutData[18],regOutData[19],regOutData[20],regOutData[21],regOutData[22],regOutData[23],regOutData[24],regOutData[25],regOutData[26],regOutData[27],regOutData[28],regOutData[29],regOutData[30],regOutData[31],raddr1,re,rdata1);
    selector321 sel2(regOutData[0],regOutData[1],regOutData[2],regOutData[3],regOutData[4],regOutData[5],regOutData[6],regOutData[7],regOutData[8],regOutData[9],regOutData[10],regOutData[11],regOutData[12],regOutData[13],regOutData[14],regOutData[15],regOutData[16],regOutData[17],regOutData[18],regOutData[19],regOutData[20],regOutData[21],regOutData[22],regOutData[23],regOutData[24],regOutData[25],regOutData[26],regOutData[27],regOutData[28],regOutData[29],regOutData[30],regOutData[31],raddr2,re,rdata2);
endmodule
    
module decoder(
    input [4:0] iData,
    input iEna,
    output reg [31:0] oData
    );
    
    always @(*) begin
        if(iEna) begin
            oData        = 0;
            oData[iData] = 1;
        end
        else begin
            oData=32'bz;
        end
    end
    
endmodule

module selector321(
    input [31:0] iC0,
    input [31:0] iC1,
    input [31:0] iC2,
    input [31:0] iC3,
    input [31:0] iC4,
    input [31:0] iC5,
    input [31:0] iC6,
    input [31:0] iC7,
    input [31:0] iC8,
    input [31:0] iC9,
    input [31:0] iC10,
    input [31:0] iC11,
    input [31:0] iC12,
    input [31:0] iC13,
    input [31:0] iC14,
    input [31:0] iC15,
    input [31:0] iC16,
    input [31:0] iC17,
    input [31:0] iC18,
    input [31:0] iC19,
    input [31:0] iC20,
    input [31:0] iC21,
    input [31:0] iC22,
    input [31:0] iC23,
    input [31:0] iC24,
    input [31:0] iC25,
    input [31:0] iC26,
    input [31:0] iC27,
    input [31:0] iC28,
    input [31:0] iC29,
    input [31:0] iC30,
    input [31:0] iC31,
    input [4:0] addr,
    input ena,
    output reg [31:0] oZ);
    always @(*) begin
        if(ena) begin
            case (addr)
            1: oZ=iC1;
            2: oZ=iC2;
            3: oZ=iC3;
            4: oZ=iC4;
            5: oZ=iC5;
            6: oZ=iC6;
            7: oZ=iC7;
            8: oZ=iC8;
            9: oZ=iC9;
            10: oZ=iC10;
            11: oZ=iC11;
            12: oZ=iC12;
            13: oZ=iC13;
            14: oZ=iC14;
            15: oZ=iC15;
            16: oZ=iC16;
            17: oZ=iC17;
            18: oZ=iC18;
            19: oZ=iC19;
            20: oZ=iC20;
            21: oZ=iC21;
            22: oZ=iC22;
            23: oZ=iC23;
            24: oZ=iC24;
            25: oZ=iC25;
            26: oZ=iC26;
            27: oZ=iC27;
            28: oZ=iC28;
            29: oZ=iC29;
            30: oZ=iC30;
            31: oZ=iC31;  
        endcase
        end
        else begin
            oZ=32'bz;
        end
    end
endmodule

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