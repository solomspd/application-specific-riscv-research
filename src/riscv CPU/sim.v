`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/08/2020 04:10:48 AM
// Design Name: 
// Module Name: sim
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module sim();

reg clk;
reg rst;

datapath datapath0(clk, rst);

initial begin
    clk=0;
    forever #10 clk=~clk;
end

initial begin
    rst=1;
    #15
    rst=0;

 end
endmodule
