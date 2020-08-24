`include "defines.v"
<<<<<<< HEAD
<<<<<<< HEAD
module branch_sel(input [2:0] f3, input [2:0] branches, output out);
always@(*) begin
case(sel)
=======
module branch_sel(input [2:0] f3, input [2:0] branches, output reg out);
=======
module branch_sel(input [2:0] f3, input [5:0] branches, output reg out);
>>>>>>> ef8cd691faf832fcef5c647ced3de50b65d85525
always@(*) begin
case(f3)
>>>>>>> Haitham
`BR_BEQ: out = branches[0];
`BR_BNE: out = branches[1];
`BR_BLT: out = branches[2];
`BR_BGE: out = branches[3];
`BR_BLTU: out = branches[4];
`BR_BGEU: out = branches[5];
default: out = 0;
<<<<<<< HEAD
end
=======
endcase
end
endmodule
>>>>>>> Haitham
