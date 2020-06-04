 module bne(
    input [31:0] a,
    input [31:0] b,
    input [31:0] xored,
    output out
    );
assign out = (xored!=0);
endmodule