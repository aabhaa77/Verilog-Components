`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 28.06.2024 18:36:13
// Design Name: 
// Module Name: MUX_2x1
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


module MUX_2x1(in, sel, out);
    input [1:0] in;
    input sel;
    output out;
    wire t1, t2, t3;
    
    assign t1 = ~sel;
    assign t2 = in[0] & t1;
    assign t3 = in[1] & sel;
    assign out = t2 | t3;
    
endmodule
