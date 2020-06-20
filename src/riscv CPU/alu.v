`include "defines.v"

module alu (input [31:0]a, input [31:0]b, input [4:0]shamt,	output reg [31:0]alu_out, input [3:0]alufn);

    always @ * begin
        alu_out = 0;
        (* parallel_case *)
        case (alufn)
            // arithmetic
            `ALU_ADD : alu_out = a + b;
            `ALU_SUB : alu_out = a - b;
            `ALU_PASS : alu_out = b;
            // logic
            `ALU_OR:  alu_out = a | b;
            `ALU_AND:  alu_out = a & b;
            `ALU_XOR:  alu_out = a ^ b;
            // shift
            `ALU_SRL:  alu_out = a >> b[4:0];
            `ALU_SRA:  alu_out = a >>> b[4:0];
            `ALU_SLL:  alu_out = a << b[4:0];
            // slt & sltu
            `ALU_SLT:  alu_out = {31'b0,($signed(a) > $signed(b))};
            `ALU_SLTU:  alu_out = {31'b0,(a > b)};
        endcase
    end
endmodule