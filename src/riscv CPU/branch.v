<<<<<<< HEAD
module branch (input [31:0]rs1, input [31:0]rs2, input [2:0]f3, output should_branch);
	beq beq1(.a(rs1), .b(rs2), .out(beq));
	bne bne1(.a(rs1), .b(rs2), .out(bne));
	blt blt1(.a(rs1), .b(rs2), .out(blt));
	bge bge1(.a(rs1), .b(rs2), .out(bge));
	bltu bltu1(.a(rs1), .b(rs2), .out(bltu));
	bgeu bgeu1(.a(rs1), .b(rs2), .out(bgeu));
	branch_sel bs1(f3,{beq,bne,blt,bge,bltu,bgeu},should_branch);
=======
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
>>>>>>> 97f20d59488377a73c0d3e8dd8902b391d36addf
endmodule