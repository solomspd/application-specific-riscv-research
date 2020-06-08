`include "defines.v"
module branch_sel(input [2:0] f3, input [5:0] branches, output reg out);
always@(*) begin
case(f3)
`BR_BEQ: out = branches[0];
`BR_BNE: out = branches[1];
`BR_BLT: out = branches[2];
`BR_BGE: out = branches[3];
`BR_BLTU: out = branches[4];
`BR_BGEU: out = branches[5];
default: out = 0;
endcase
end
endmodule
