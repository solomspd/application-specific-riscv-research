 module beq(
    input [31:0] a,
    input [31:0] b,
    output out
    );
assign out = ((a^b)==0);
endmodule