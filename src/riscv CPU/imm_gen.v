`include "defines.v"

module imm_gen (input [31:0]inst_in, output reg [31:0]Imm);

	always @(*) begin
		case (inst_in[`IR_opcode])
			`OPCODE_Arith_I   : 	Imm = { {21{inst_in[31]}}, inst_in[30:25], inst_in[24:21], inst_in[20] };
			`OPCODE_Store     :     Imm = { {21{inst_in[31]}}, inst_in[30:25], inst_in[11:8], inst_in[7] };
			`OPCODE_LUI       :     Imm = { inst_in[31], inst_in[30:20], inst_in[19:12], 12'b0 };
			`OPCODE_AUIPC     :     Imm = { inst_in[31], inst_in[30:20], inst_in[19:12], 12'b0 };
			`OPCODE_JAL       : 	Imm = { {12{inst_in[31]}}, inst_in[19:12], inst_in[20], inst_in[30:25], inst_in[24:21], 1'b0 };
			`OPCODE_JALR      : 	Imm = { {21{inst_in[31]}}, inst_in[30:25], inst_in[24:21], inst_in[20] };
			`OPCODE_Branch    : 	Imm = { {20{inst_in[31]}}, inst_in[7], inst_in[30:25], inst_in[11:8], 1'b0};
			default           : 	Imm = { {21{inst_in[31]}}, inst_in[30:25], inst_in[24:21], inst_in[20] }; // IMM_I
		endcase 
	end


endmodule