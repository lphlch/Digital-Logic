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