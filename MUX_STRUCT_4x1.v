`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 28.06.2024 16:12:12
// Design Name: 
// Module Name: MUX_STRUCT_4x1
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


module MUX_STRUCT_4x1(in, sel, out);
    input [3:0] in;
    input[1:0] sel;
    output out;
    wire[1:0] t;
    
    MUX_2x1 M0 (in[1:0], sel[0], t[0]);
    MUX_2x1 M1 (in[3:2], sel[0], t[1]);
    MUX_2x1 M2 (t, sel[1], out);
    
endmodule
