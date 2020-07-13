`include "defines.v"

module alu_ctrl (input [1:0]alu_op, input [6:0]func7, input [2:0]func3, output reg [3:0]alufn);

always @(*) begin
	
	case (alu_op)

		2'b00: alufn = `ALU_ADD;
		2'b01: alufn = `ALU_SUB;
		2'b10: case (func3)
			`F3_ADD: case (func7)
				`F7_ADD: alufn = `ALU_ADD;
				`F7_SUB: alufn = `ALU_SUB;
				default: alufn = 0;
			endcase
			`F3_SLL: alufn = `ALU_SLL;
			`F3_SLT: alufn = `ALU_SLT;
			`F3_SLTU: alufn = `ALU_SLTU;
			`F3_XOR: alufn = `ALU_XOR;
			`F3_SRL: case (func7)
				`F7_SRL: alufn = `ALU_SRL;
				`F7_SRA: alufn = `ALU_SRA;
				default: alufn = 0;
			endcase
			`F3_OR: alufn = `ALU_OR;
			`F3_AND: alufn = `ALU_AND;
			default: alufn = 0;
		endcase
		2'b11: case (func3)
			`F3_ADD: alufn = `ALU_ADD;
			`F3_SLT: alufn = `ALU_SLT;
			`F3_SLTU: alufn = `ALU_SLTU;
			`F3_XOR: alufn = `ALU_XOR;
			`F3_OR: alufn = `ALU_OR;
			`F3_AND: alufn = `ALU_AND;
			`F3_SLL: alufn = `ALU_SLL;
			`F3_SRL: case (func7)
				`F7_SRL: alufn = `ALU_SRL;
				`F7_SRA: alufn = `ALU_SRA;
				default: alufn = 0;
			endcase
		    default: alufn = 0;
		endcase
        default: alufn = 0;
	endcase

end

endmodule