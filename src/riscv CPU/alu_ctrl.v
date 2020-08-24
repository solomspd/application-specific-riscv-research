`include "defines.v"
<<<<<<< HEAD
<<<<<<< HEAD

module alu_ctrl (input [1:0]alu_op, input [6:0]func7, input [2:0]func3, output [3:0]out);

always @(*) begin
	
	case (func3)

		2'b00: out = `ALU_ADD;
		2'b01: out = `ALU_SUB;
		2'b10: case (func3)
			`F3_ADD: case (func7)
				`F7_ADD: out = `ALU_ADD;
				`F7_SUB: out = `ALU_SUB;
			endcase
			`F3_SLL: out = `ALU_SLL;
			`F3_SLT: out = `ALU_SLT;
			`F3_SLTU: out = `ALU_SLTU;
			`F3_XOR: out = `ALU_XOR;
			`F3_SRL: case (func7)
				`F7_SRL: out = `ALU_SRL;
				`F7_SRA: out = `ALU_SRA;
			endcase
			`F3_OR: out = `ALU_OR;
			`F3_AND: out = `ALU_AND;
		endcase
		2'b11: case (func)
			`F3_ADD: out = `ALU_ADD;
			`F3_SLT: out = `ALU_SLT;
			`F3_SLTU: out = `ALU_SLTU;
			`F3_XOR: out = `ALU_XOR;
			`F4_OR: out = `ALU_OR;
			`F3_AND: out = `ALU_AND;
			`F3_SLL: out = `ALU_SLL;
			`F3_SRL: case (func7)
				`F7_SRLI: out = `ALU_SRL;
				`F7_SRAI: out = `ALU_SRA;
			endcase
		endcase

	endcase

=======

module alu_ctrl (input [1:0]alu_op, input [6:0]func7, input [2:0]func3, output reg [3:0]out);
=======

module alu_ctrl (input [1:0]alu_op, input [6:0]func7, input [2:0]func3, output reg [3:0]alufn);
>>>>>>> 97f20d59488377a73c0d3e8dd8902b391d36addf

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
				`F7_SRLI: alufn = `ALU_SRL;
				`F7_SRAI: alufn = `ALU_SRA;
				default: alufn = 0;
			endcase
		    default: alufn = 0;
		endcase
        default: alufn = 0;
	endcase

<<<<<<< HEAD
>>>>>>> Haitham
=======
>>>>>>> 97f20d59488377a73c0d3e8dd8902b391d36addf
end

endmodule