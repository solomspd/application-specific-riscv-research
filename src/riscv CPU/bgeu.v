 module bgeu(
    input [31:0] a,
    input [31:0] b,
    output out
    );
wire [31:0] add;
wire [31:0] bNot = ~b;
assign {out,add} = a+bNot;
endmodule