`include "defines.v"

module datapath (input clk, input rst);

	wire should_branch;

	wire [31:0]pc_out;
	wire [31:0]pc_in;
	reg pc (clk, rst, pc_in, pc_out);
	assign pc_in =  & should_branch ? pc_out + (imm_out) : pc_out + 4;
	
	wire [31:0]inst;
	inst_mem inst_mem0 (.addr(pc_out), .inst_out(inst));
	wire should_jump;
	assign should_jump = inst[6:2]==`OPCODE_JALR | inst[6:2]==`OPCODE_JAL;
	wire branch_jump = cu_branch | should_jump;
	wire [31:0]imm_out;
	imm_gen imm_gen0 (.inst_in(inst), .imm(imm_out));

	wire cu_branch, mem_read, mem_to_reg, mem_write, alu_src, reg_write;
	wire [1:0]alu_op;
	control_unit control_unit0 (.op(inst[`IR_opcode]), .branch(cu_branch), .mem_read(mem_read), .mem_to_reg(mem_to_reg), .alu_op(alu_op), .mem_write(mem_write), .alu_src(alu_src), .reg_wrtie(reg_write), .alu_op(alu_op));

	wire [31:0]rs1;
	wire [31:0]rs2;
	reg_file reg_file0 (.clk(clk), .rst(rst), .src1(inst[`IR_rs1]), .src2(inst[5] ? rs2 : inst[`IR_rs2]), .dest(`IR_rd), .reg_write(reg_write), .write_data(mem_to_reg ? data_mem_out : alu_out), .read1(rs1), .read2(rs2));

	wire overflow, is_zero, is_neg, vf;
	wire [31:0]alu_out;
	wire beq,bne,bge,blt,bltu,bgeu;
	alu alu0 (.a(rs1), .b(alu_src ? imm_out : rs2), .shamt(inst[`IR_shamt]), .out(alu_out), .cf(overflow), .zf(is_zero), .vf(vf), .sf(is_neg), .alufn(alu_op));
	branch brnch1(.rs1(rs1), .rs2(rs2), .imm_out(imm_out), .f3(inst[`IR_funct3]), .should_branch(should_branch));
	wire [31:0]data_mem_out;
	data_mem data_mem0 (.clk(clk), .addr(alu_out), .write_data(rs2), .mem_write(mem_write), .mem_read(mem_read), .func3(inst[`IR_funct3]), .data_out(data_mem_out));

endmodule