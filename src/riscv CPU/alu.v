module alu (input [31:0]a, input [31:0]b, input [4:0]shamt,	output reg [31:0]out, output cf, output zf, output vf, output sf, input [3:0]alufn);

    wire [31:0] add, sub, op_b;
    wire cfa, cfs;
    
    assign op_b = (~b);
    
    assign {cf, add} = alufn[0] ? (a + op_b + 1'b1) : (a + b);
    
    assign zf = (add == 0);
    assign sf = add[31];
    assign vf = (a[31] ^ (op_b[31]) ^ add[31] ^ cf);
    
    wire[31:0] sh;
    shifter shifter0(.a(a), .shamt(shamt), .type(alufn[1:0]),  .r(sh));
    
    always @ * begin
        out = 0;
        (* parallel_case *)
        case (alufn)
            // arithmetic
            4'b00_00 : out = add;
            4'b00_01 : out = add;
            4'b00_11 : out = b;
            // logic
            4'b01_00:  out = a | b;
            4'b01_01:  out = a & b;
            4'b01_11:  out = a ^ b;
            // shift
            4'b10_00:  out=sh;
            4'b10_01:  out=sh;
            4'b10_10:  out=sh;
            // slt & sltu
            4'b11_01:  out = {31'b0,(sf != vf)}; 
            4'b11_11:  out = {31'b0,(~cf)};            	
        endcase
    end
endmodule