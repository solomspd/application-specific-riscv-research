`include "defines.v"
module branch (input [31:0]rs1, input [31:0]rs2, input can_branch, input [2:0]f3, output reg will_branch);
    reg should_branch;
	always @(*) begin
		case (f3)
			`BR_BEQ: should_branch <= (rs1 == rs2);
			`BR_BNE: should_branch <= (rs1 != rs2);
			`BR_BLT: should_branch <= ($signed(rs1) < $signed(rs2));
			`BR_BGE: should_branch <= ($signed(rs1) >= $signed(rs2));
			`BR_BLTU: should_branch <= (rs1 < rs2);
			`BR_BGEU: should_branch <= (rs1 >= rs2);
			default: should_branch <= 1'b0;
		endcase
		will_branch = can_branch & should_branch;
	end
endmodule