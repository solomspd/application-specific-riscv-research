`include "defines.v"

module alu_ctrl (input [1:0]alu_op, input [6:0]func7, input [2:0]func3, output reg [3:0]out);

always @(*) begin
	
	case (alu_op)

		2'b00: out = `ALU_ADD;
		2'b01: out = `ALU_SUB;
		2'b10: case (func3)
			`F3_ADD: case (func7)
				`F7_ADD: out = `ALU_ADD;
				`F7_SUB: out = `ALU_SUB;
				default: out = 0;
			endcase
			`F3_SLL: out = `ALU_SLL;
			`F3_SLT: out = `ALU_SLT;
			`F3_SLTU: out = `ALU_SLTU;
			`F3_XOR: out = `ALU_XOR;
			`F3_SRL: case (func7)
				`F7_SRL: out = `ALU_SRL;
				`F7_SRA: out = `ALU_SRA;
				default: out = 0;
			endcase
			`F3_OR: out = `ALU_OR;
			`F3_AND: out = `ALU_AND;
			default: out = 0;
		endcase
		2'b11: case (func3)
			`F3_ADD: out = `ALU_ADD;
			`F3_SLT: out = `ALU_SLT;
			`F3_SLTU: out = `ALU_SLTU;
			`F3_XOR: out = `ALU_XOR;
			`F3_OR: out = `ALU_OR;
			`F3_AND: out = `ALU_AND;
			`F3_SLL: out = `ALU_SLL;
			`F3_SRL: case (func7)
				`F7_SRLI: out = `ALU_SRL;
				`F7_SRAI: out = `ALU_SRA;
				default: out = 0;
			endcase
		    default: out = 0;
		endcase
        default: out = 0;
	endcase

end

endmodule