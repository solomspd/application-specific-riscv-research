module branch (input [31:0]rs1, input [31:0]rs2, input [31:0]imm_out, input [2:0]f3, output should_branch);
	beq beq1(.a(rs1), .b(rs2),.xored((rs1)^(rs2)) , .out(beq));
	bne bne1(.a(rs1), .b(rs2),.xored((rs1)^(rs2)) , .out(bne));
	blt blt1(.a(rs1), .b(rs2), .out(blt));
	bge bge1(.a(rs1), .b(rs2), .out(bge));
	bltu bltu1(.a(rs1), .b(rs2), .out(bltu));
	bgeu bgeu1(.a(rs1), .b(rs2), .out(bgeu));
	branch_sel bs1(f3,{beq,bne,blt,bge,bltu,bgeu},should_branch);
endmodule