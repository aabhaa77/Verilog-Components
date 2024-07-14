`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 28.06.2024 15:49:45
// Design Name: 
// Module Name: MUX_16x1_w_4x1
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


module MUX_16x1_w_4x1(in, sel, out);
    input[15:0] in;
    input[3:0] sel;
    output out;
    
    wire[3:0] t;
    
    MUX_BH_4x1 M0 (in[3:0], sel[1:0], t[0]);
    MUX_BH_4x1 M1 (in[7:4], sel[1:0], t[1]);
    MUX_BH_4x1 M2 (in[11:8], sel[1:0], t[2]);
    MUX_BH_4x1 M3 (in[15:12], sel[1:0], t[3]);
    MUX_BH_4x1 M4 (t, sel[3:2], out);
   
endmodule