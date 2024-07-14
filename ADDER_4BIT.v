`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 29.06.2024 10:52:27
// Design Name: 
// Module Name: ADDER_4BIT
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


module ADDER_4BIT(sum, carry, x, y, cin);
    input [3: 0] x, y;
    input cin;
    output [3: 0] sum;
    output carry;
    
    assign {carry, sum} = x + y + cin;
    
endmodule
