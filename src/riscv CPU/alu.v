`include "defines.v"

module alu (input [31:0]a, input [31:0]b, input [4:0]shamt,	output reg [31:0]out, output cf, input [3:0]alufn);

    wire [31:0] add, sub, op_b;
    wire cfa, cfs;
    wire zf, sf, vf;
    
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
            `ALU_ADD : out = add;
            `ALU_SUB : out = add;
            `ALU_PASS : out = b;
            // logic
            `ALU_OR:  out = a | b;
            `ALU_AND:  out = a & b;
            `ALU_XOR:  out = a ^ b;
            // shift
            `ALU_SRL:  out=sh;
            `ALU_SRA:  out=sh;
            `ALU_SLL:  out=sh;
            // slt & sltu
            `ALU_SLT:  out = {31'b0,(sf != vf)};
            `ALU_SLTU:  out = {31'b0,(~cf)};
        endcase
    end
endmodule