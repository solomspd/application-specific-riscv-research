module inst_mem (input [31:0]addr, output [31:0]inst);

	reg [7:0] mem [1023:0];
	//assign inst_out = rst? 32'b0: {mem[addr], mem[addr+1], mem[addr+2], mem[addr+3]};

<<<<<<< HEAD
	assign inst_out = {mem[addr], mem[addr+1], mem[addr+2], mem[addr+3]};

	initial begin
    mem[0] = 8'h00; //000000000001_00000_000_00110_0010011  
    mem[1] = 8'h10; 
    mem[2] = 8'h03; 
    mem[3] = 8'h13; 
    mem[4] = 8'h00; 
    mem[5] = 8'h63; 
    mem[6] = 8'h03; 
    mem[7] = 8'h33; 
    mem[8] = 8'h3f; 
    mem[9] = 8'he3; 
    mem[10] = 8'h03; 
    mem[11] = 8'h13; 
    mem[12] = 8'he0; 
    mem[13] = 8'h03; 
    mem[14] = 8'h03; 
    mem[15] = 8'h93; 
    mem[16] = 8'h40; 
    mem[17] = 8'h73; 
    mem[18] = 8'h0e; 
    mem[19] = 8'h33; 
    mem[20] = 8'h00; 
    mem[21] = 8'h0e; 
    mem[22] = 8'h7e; 
    mem[23] = 8'h33; 
    mem[24] = 8'h00; 
    mem[25] = 8'h73; 
    mem[26] = 8'h6e; 
    mem[27] = 8'h33; 
    mem[28] = 8'h00; 
    mem[29] = 8'h1e; 
    mem[30] = 8'h7e; 
    mem[31] = 8'h13; 
    mem[32] = 8'h00; 
    mem[33] = 8'h0e; 
    mem[34] = 8'h6e; 
    mem[35] = 8'h13; 
    mem[36] = 8'h00; 
    mem[37] = 8'h2e; 
    mem[38] = 8'h4e; 
    mem[39] = 8'h13; 
    mem[40] = 8'hb0; 
    mem[41] = 8'hee; 
    mem[42] = 8'h2e; 
    mem[43] = 8'h13; 
    mem[44] = 8'h00; 
    mem[45] = 8'h7e; 
    mem[46] = 8'h2e; 
    mem[47] = 8'h33; 
    mem[48] = 8'h01; 
    mem[49] = 8'hc0; 
    mem[50] = 8'h22; 
    mem[51] = 8'h23; 
    mem[52] = 8'h7f; 
    mem[53] = 8'hfe; 
    mem[54] = 8'h0e; 
    mem[55] = 8'h13; 
    mem[56] = 8'h01; 
    mem[57] = 8'hc0; 
    mem[58] = 8'h14; 
    mem[59] = 8'h23; 
    mem[60] = 8'h01; 
    mem[61] = 8'hc0; 
    mem[62] = 8'h05; 
    mem[63] = 8'h23; 
    mem[64] = 8'h00; 
    mem[65] = 8'h00; 
    mem[66] = 8'h2e; 
    mem[67] = 8'h03; 
    mem[68] = 8'h00; 
    mem[69] = 8'h00; 
    mem[70] = 8'h1e; 
    mem[71] = 8'h03; 
    mem[72] = 8'h00; 
    mem[73] = 8'h00; 
    mem[74] = 8'h0e; 
    mem[75] = 8'h03; 
    mem[76] = 8'h00; 
    mem[77] = 8'h00; 
    mem[78] = 8'h5e; 
    mem[79] = 8'h03; 
    mem[80] = 8'h00; 
    mem[81] = 8'h00; 
    mem[82] = 8'h4e; 
    mem[83] = 8'h03; 
    mem[84] = 8'h00; 
    mem[85] = 8'h20; 
    mem[86] = 8'h0e; 
    mem[87] = 8'h13; 
    mem[88] = 8'h00; 
    mem[89] = 8'h10; 
    mem[90] = 8'h0e; 
    mem[91] = 8'h93; 
    mem[92] = 8'h01; 
    mem[93] = 8'hde; 
    mem[94] = 8'h5e; 
    mem[95] = 8'h33; 
    mem[96] = 8'h00; 
    mem[97] = 8'h20; 
    mem[98] = 8'h0e; 
    mem[99] = 8'h93; 
    mem[100] = 8'h01; 
    mem[101] = 8'hde; 
    mem[102] = 8'h1e; 
    mem[103] = 8'h33; 
    mem[104] = 8'h41; 
    mem[105] = 8'hde; 
    mem[106] = 8'hde; 
    mem[107] = 8'h33; 
    mem[108] = 8'h40; 
    mem[109] = 8'h00; 
    mem[110] = 8'h0e; 
    mem[111] = 8'h13; 
    mem[112] = 8'h20; 
    mem[113] = 8'h00; 
    mem[114] = 8'h0e; 
    mem[115] = 8'h93; 
    mem[116] = 8'h01; 
    mem[117] = 8'hde; 
    mem[118] = 8'h4e; 
    mem[119] = 8'h33; 
    mem[120] = 8'h01; 
    mem[121] = 8'hde; 
    mem[122] = 8'h2e; 
    mem[123] = 8'h33; 
    mem[124] = 8'h01; 
    mem[125] = 8'hce; 
    mem[126] = 8'hae; 
    mem[127] = 8'h33; 
    mem[128] = 8'h00; 
    mem[129] = 8'h1e; 
    mem[130] = 8'hde; 
    mem[131] = 8'h13; 
    mem[132] = 8'h00; 
    mem[133] = 8'h2e; 
    mem[134] = 8'h1e; 
    mem[135] = 8'h13; 
    mem[136] = 8'h40; 
    mem[137] = 8'hfe; 
    mem[138] = 8'h5e; 
    mem[139] = 8'h13; 


    
=======
	assign inst = {mem[addr+3], mem[addr+2], mem[addr+1], mem[addr]};

	initial begin
>>>>>>> solom

	end

endmodule