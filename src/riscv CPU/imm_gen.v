`include "defines.v"

module imm_gen (input [31:0]inst, output reg [31:0]imm_out);

	always @(*) begin
		case (inst[`IR_opcode])
			`OPCODE_Arith_I   : 	imm_out = { {21{inst[31]}}, inst[30:25], inst[24:21], inst[20] };
			`OPCODE_Store     :     imm_out = { {21{inst[31]}}, inst[30:25], inst[11:8], inst[7] };
			`OPCODE_LUI       :     imm_out = { inst[31], inst[30:20], inst[19:12], 12'b0 };
			`OPCODE_AUIPC     :     imm_out = { inst[31], inst[30:20], inst[19:12], 12'b0 };
			`OPCODE_JAL       : 	imm_out = { {12{inst[31]}}, inst[19:12], inst[20], inst[30:25], inst[24:21], 1'b0 };
			`OPCODE_JALR      : 	imm_out = { {21{inst[31]}}, inst[30:25], inst[24:21], inst[20] };
			`OPCODE_Branch    : 	imm_out = { {20{inst[31]}}, inst[7], inst[30:25], inst[11:8], 1'b0};
			default           : 	imm_out = { {21{inst[31]}}, inst[30:25], inst[24:21], inst[20] }; // IMM_I
		endcase 
	end


endmodule