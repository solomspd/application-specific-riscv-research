module control_unit (input [4:0]op, output reg branch, mem_read, mem_to_reg, alu_op, mem_write, alu_src, reg_write, output reg [1:0]alu_op);

	always @(*) begin
		case (op)
			`OPCODE_Branch: begin
					branch = 1'b1;
					mem_read = 1'b0;
					mem_write = 1'b0;
					alu_src = 1'b0;
					reg_write = 1'b1;
				end

			`OPCODE_Load: begin
					branch = 1'b0;
					mem_read = 1'b1;
					mem_write = 1'b0;
					alu_src = 1'b1;
					reg_wrtie = 1'b1;
				end

			`OPCODE_Store: begin
					branch = 1'b0;
					mem_read = 1'b1;
					mem_write = 1'b0;
					alu_src = 1'b1;
					reg_write = 1'b0;
				end

			`OPCODE_JALR:

			`OPCODE_Arith_I: begin
					branch = 1'b0;
					mem_read = 1'b0;
					mem_wrtie = 1'b0;
					alu_src = 1'b1;
					reg_wrtie = 1'b1;
				end

			`OPCODE_Arith_R: begin
					branch = 1'b0;
					mem_read = 1'b0;
					mem_write = 1'b0;
					alu_src = 1'b0;
					reg_wrtie = 1'b1;
				end

			`OPCODE_AUIPC:

			`OPCODE_LUI:

			`OPCODE_SYSTEM:

			`OPCODE_Custom:
		endcase
	end

endmodule