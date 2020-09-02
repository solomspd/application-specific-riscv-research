`include "defines.v"
module control_unit (input [6:0]op, output reg can_branch, mem_read, mem_to_reg, mem_write, alu_src, reg_write, should_jump, output reg [1:0]alu_op);

	always @(*) begin
		case (op)
			`OPCODE_Branch: begin
					can_branch = 1'b1;
					mem_read = 1'b0;
					mem_to_reg = 1'b0;
					mem_write = 1'b0;
					alu_src = 1'b0;
					reg_write = 1'b1;
					alu_op = 2'b01;
					should_jump = 1'b0;
				end

			`OPCODE_Load: begin
					can_branch = 1'b0;
					mem_read = 1'b1;
					mem_to_reg = 1'b1;
					mem_write = 1'b0;
					alu_src = 1'b1;
					reg_write = 1'b1;
					alu_op = 2'b00;
					should_jump = 1'b0;
				end

			`OPCODE_Store: begin
					can_branch = 1'b0;
					mem_read = 1'b1;
					mem_to_reg = 1'b1;
					mem_write = 1'b1;
					alu_src = 1'b1;
					reg_write = 1'b0;
					alu_op = 2'b00;
					should_jump = 1'b0;
				end

			`OPCODE_JALR: begin
					can_branch = 1'b0;
					mem_read = 1'b0;
					mem_to_reg = 1'b0;
					mem_write = 1'b0;
					alu_src = 1'b1;
					reg_write = 1'b1;
					alu_op = 2'b00;
					should_jump = 1'b1;
			end
			`OPCODE_JAL: begin
					can_branch = 1'b0;
					mem_read = 1'b0;
					mem_to_reg = 1'b0;
					mem_write = 1'b0;
					alu_src = 1'b1;
					reg_write = 1'b1;
					alu_op = 2'b00;
					should_jump = 1'b1;
			end
			`OPCODE_Arith_I: begin
					can_branch = 1'b0;
					mem_read = 1'b0;
					mem_to_reg = 1'b0;
					mem_write = 1'b0;
					alu_src = 1'b1;
					reg_write = 1'b1;
					alu_op = 2'b11;
					should_jump = 1'b0;
				end

			`OPCODE_Arith_R: begin
					can_branch = 1'b0;
					mem_read = 1'b0;
					mem_to_reg = 1'b0;
					mem_write = 1'b0;
					alu_src = 1'b0;
					reg_write = 1'b1;
					alu_op = 2'b10;
					should_jump = 1'b0;
				end

			`OPCODE_AUIPC: begin
					can_branch = 1'b0;
					mem_read = 1'b0;
					mem_to_reg = 1'b0;
					mem_write = 1'b0;
					alu_src = 1'b1;
					reg_write = 1'b1;
					alu_op = 2'b00;
					should_jump = 1'b1;
				end
			`OPCODE_LUI: begin
					can_branch = 1'b0;
					mem_read = 1'b0;
					mem_to_reg = 1'b0;
					mem_write = 1'b0;
					alu_src = 1'b1;
					reg_write = 1'b1;
					alu_op = 2'b00;
					should_jump = 1'b0;
				end
		//	`OPCODE_SYSTEM:

			//`OPCODE_Custom:
			default: begin
                can_branch = 1'b0;
                mem_read = 1'b0;
                mem_to_reg = 1'b0;
                mem_write = 1'b0;
                alu_src = 1'b0;
                reg_write = 1'b0;
                alu_op = 2'b0;
                should_jump = 1'b0;
			end
		endcase
	end

endmodule