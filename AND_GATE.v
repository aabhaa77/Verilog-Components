`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05.06.2024 23:31:03
// Design Name: 
// Module Name: AND_GATE
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


module AND_GATE(a, b, c
    );
    input a, b;
    output c;
    wire t1;
    
    assign t1 = a & b;
    assign c = ~t1;
    
endmodule
