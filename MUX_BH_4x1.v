`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 28.06.2024 15:46:03
// Design Name: 
// Module Name: MUX_BH_4x1
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


module MUX_BH_4x1(in, sel, out);
    input [3:0] in;
    input [1:0] sel;
    output out;
    
    assign out = in[sel];
endmodule
