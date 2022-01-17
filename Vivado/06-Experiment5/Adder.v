module Adder (input [7:0] iData_a,
              input [7:0] iData_b,
              input iC,
              output [7:0] oData,
              output oData_C);
    wire C1,C2,C3,C4,C5,C6,C7;

    FA add0(iData_a[0],iData_b[0],iC,oData[0],C1);
    FA add1(iData_a[1],iData_b[1],C1,oData[1],C2);
    FA add2(iData_a[2],iData_b[2],C2,oData[2],C3);
    FA add3(iData_a[3],iData_b[3],C3,oData[3],C4);
    FA add4(iData_a[4],iData_b[4],C4,oData[4],C5);
    FA add5(iData_a[5],iData_b[5],C5,oData[5],C6);
    FA add6(iData_a[6],iData_b[6],C6,oData[6],C7);
    FA add7(iData_a[7],iData_b[7],C7,oData[7],oData_C);
endmodule

module FA (
    input iA,
    input iB,
    input iC,
    output oS,
    output oC
    );
    wire aAndb,aXorb,cAndxor;
    and and1(aAndb,iA,iB);
    xor xor1(aXorb,iA,iB);
    and and2(cAndxor,iC,aXorb);
    or or1(oC,aAndb,cAndxor);
    xor xor2(oS,iC,aXorb);
endmodule
