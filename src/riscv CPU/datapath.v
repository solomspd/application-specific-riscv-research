`include "defines.v"

module datapath (input clk, input rst);

	wire [31:0]pc_out;

	wire [31:0]inst;

	wire [31:0]imm_out;

	wire mem_read, mem_to_reg, mem_write, alu_src, reg_write, should_jump;
	wire [1:0]alu_op;

	wire [31:0]rs1;
	wire [31:0]rs2;

	wire will_branch;

    wire [3:0]alufn;
	wire [31:0]alu_out;
	
	wire [31:0]data_out;
		
	register pc (.clk(clk), .rst(rst), .in((will_branch & should_jump) ? pc_out + (imm_out) : should_jump ? alu_out : pc_out + 4), .out(pc_out));
	
	inst_mem inst_mem0 (.addr(pc_out), .inst(inst));
	imm_gen imm_gen0 (.inst(inst), .imm_out(imm_out));
	
	control_unit control_unit0 (.op(inst[`IR_opcode]), .can_branch(can_branch), .mem_read(mem_read), .mem_to_reg(mem_to_reg), .should_jump(should_jump), .alu_op(alu_op), .mem_write(mem_write), .alu_src(alu_src), .reg_write(reg_write));

	reg_file reg_file0 (.clk(clk), .rst(rst), .src1(inst[`IR_rs1]), .src2(inst[`IR_rs2]), .dest(inst[`IR_rd]), .reg_write(reg_write), .write_data(mem_to_reg ? data_out : should_jump ? pc_out+4: alu_out), .rs1(rs1), .rs2(rs2));

    alu_ctrl clu_ctrol0 (.alu_op(alu_op), .func7(inst[`IR_funct7]), .func3(inst[`IR_funct3]), .alufn(alufn));   
    
	alu alu0 (.a(rs1), .b(alu_src ? imm_out : rs2), .shamt(inst[`IR_shamt]), .alu_out(alu_out), .alufn(alufn));
	
	branch branch1 (.rs1(rs1), .rs2(rs2), .f3(inst[`IR_funct3]), .will_branch(will_branch));
	
	data_mem data_mem0 (.clk(clk), .addr(alu_out), .write_data(rs2), .mem_write(mem_write), .mem_read(mem_read), .func3(inst[`IR_funct3]), .data_out(data_out));

endmodule