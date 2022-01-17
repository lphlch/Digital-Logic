module selector41(
    input [3:0] iC0,
    input [3:0] iC1,
    input [3:0] iC2,
    input [3:0] iC3,
    input iS1,
    input iS0,
    output [3:0] oZ
);
wire [3:0]iS14,iS04;
assign iS14={{3{iS1}},iS1};
assign iS04={{3{iS0}},iS0};

    assign oZ=(iC0 & ~iS04 & ~iS14) |( iC1 & ~iS14 & iS04) |( iC2 & iS14 & ~iS04) | (iC3 & iS14 &iS04);
endmodule