`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 28.06.2024 15:18:59
// Design Name: 
// Module Name: MUX_BH_16x1
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


module MUX_BH_16x1(
    input[15:0] in,
    input[3:0] sel,
    output out
    );
    
    //in is a 16 bit array, select line is used as index
    assign out = in[sel];
endmodule
