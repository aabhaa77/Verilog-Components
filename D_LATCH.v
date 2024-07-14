`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 28.06.2024 12:24:47
// Design Name: 
// Module Name: D_LATCH
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


module D_LATCH(
    input clk,
    input d,
    output reg q
    );
    //Sensitivity List
    always @ (d, clk)
    begin
        if (clk == 1)
            q <= d;
    end
    
endmodule
