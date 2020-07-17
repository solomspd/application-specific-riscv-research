`include "defines.v"
module control_unit (input [4:0]op, output reg branch, mem_read, mem_to_reg, mem_write, alu_src, reg_write, output reg [1:0]alu_op);

	always @(*) begin
		case (op)
			`OPCODE_Branch: begin
					branch = 1'b1;
					mem_read = 1'b0;
					mem_to_reg = 1'b0;
					mem_write = 1'b0;
					alu_src = 1'b0;
					reg_write = 1'b1;
					alu_op = 2'b01;
				end

			`OPCODE_Load: begin
					branch = 1'b0;
					mem_read = 1'b1;
					mem_to_reg = 1'b1;
					mem_write = 1'b0;
					alu_src = 1'b1;
					reg_write = 1'b1;
					alu_op = 2'b00;
				end

			`OPCODE_Store: begin
					branch = 1'b0;
					mem_read = 1'b1;
					mem_to_reg = 1'b1;
					mem_write = 1'b1;
					alu_src = 1'b1;
					reg_write = 1'b0;
					alu_op = 2'b00;
				end

			`OPCODE_JALR: begin
					branch = 1'b0;
					mem_read = 1'b0;
					mem_write = 1'b0;
					alu_src = 1'b1;
					reg_write = 1'b1;
					mem_to_reg = 1'b0;
					alu_op = 2'b00;
			end
			`OPCODE_JAL: begin
					branch = 1'b0;
					mem_read = 1'b0;
					mem_to_reg = 1'b0;
					mem_write = 1'b0;
					alu_src = 1'b1;
					reg_write = 1'b1;
					alu_op = 2'b00;
			end
			`OPCODE_Arith_I: begin
					branch = 1'b0;
					mem_read = 1'b0;
					mem_to_reg = 1'b0;
					mem_write = 1'b0;
					alu_src = 1'b1;
					reg_write = 1'b1;
					alu_op = 2'b11;
				end

			`OPCODE_Arith_R: begin
					branch = 1'b0;
					mem_read = 1'b0;
					mem_to_reg = 1'b0;
					mem_write = 1'b0;
					alu_src = 1'b0;
					reg_write = 1'b1;
					alu_op = 2'b10;
				end

			`OPCODE_AUIPC: begin
					branch = 1'b0;
					mem_read = 1'b0;
					mem_to_reg = 1'b0;
					mem_write = 1'b0;
					alu_src = 1'b1;
					reg_write = 1'b1;
					alu_op = 2'b00;
				end
			`OPCODE_LUI: begin
					branch = 1'b0;
					mem_read = 1'b0;
					mem_to_reg = 1'b0;
					mem_write = 1'b0;
					alu_src = 1'b1;
					reg_write = 1'b1;
					alu_op = 2'b00;
				end
		//	`OPCODE_SYSTEM:

			//`OPCODE_Custom:
			default: begin
                branch = 1'b0;
                mem_read = 1'b0;
                mem_to_reg = 1'b0;
                mem_write = 1'b0;
                alu_src = 1'b0;
                reg_write = 1'b0;
                alu_op = 2'b0;
			end
		endcase
	end

endmodule