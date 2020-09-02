module datapath (input clk, input rst);
wire [31:0] inst;
wire reg_write;
wire [1:0] alu_op;
wire [31:0] rs1;
wire [31:0] rs2;
wire [3:0] alufn;
wire [31:0] alu_out;
wire [31:0] pc_out;
wire [31:0] imm_out;
inst_mem  inst_mem0 ( .addr(pc_out),  .inst(inst));
control_unit  control_unit1 ( .op(inst[`IR_opcode]),  .alu_op(alu_op));
reg_file  reg_file2 ( .clk(clk),  .rst(rst),  .src1(inst[`IR_rs1]),  .src2(inst[`IR_rs2]),  .reg_write(reg_write),  .write_data(alu_out),  .rs2(rs2));
alu_ctrl  alu_ctrl3 ( .alu_op(alu_op),  .func7(inst[`IR_funct7]),  .func3(inst[`IR_funct3]),  .alufn(alufn));
alu  alu4 ( .a(rs1), .b(alu_src? ['imm_out']: rs2) .alufn(alu_out),  .alu_out(alu_out));
pc  pc5 ( .clk(clk),  .rst(rst),  .in(pc_out+4),  .pc_out(pc_out));
imm_gen  imm_gen6 ( .inst(inst),  .imm_out(imm_out));
endmodule