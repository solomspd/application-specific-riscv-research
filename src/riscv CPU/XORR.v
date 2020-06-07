<<<<<<< HEAD
module XORR(input [31:0] a,b, output[31:0] o)
o = a^b;
=======
module XORR(a,b,o);
input [31:0]a;
input [31:0]b;
output [31:0]o;
assign o= a^b;
>>>>>>> Haitham
endmodule