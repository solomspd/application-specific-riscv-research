`include "defines.v"

module alu (input [31:0]a, input [31:0]b, input [4:0]shamt,	output reg [31:0]out, output cf, input [3:0]alufn);

    always @ * begin
        out = 0;
        (* parallel_case *)
        case (alufn)
            // arithmetic
            `ALU_ADD : out = a + b;
            `ALU_SUB : out = a - b;
            `ALU_PASS : out = b;
            // logic
            `ALU_OR:  out = a | b;
            `ALU_AND:  out = a & b;
            `ALU_XOR:  out = a ^ b;
            // shift
            `ALU_SRL:  out = a >> b[4:0];
            `ALU_SRA:  out = a >>> b[4:0];
            `ALU_SLL:  out = a << b[4:0];
            // slt & sltu
            `ALU_SLT:  out = {31'b0,($signed(a) > $signed(b))};
            `ALU_SLTU:  out = {31'b0,(a > b)};
        endcase
    end
endmodule