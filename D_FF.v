`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 28.06.2024 12:38:03
// Design Name: 
// Module Name: D_FF
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

//DFF with synchronous set and reset

module D_FF(
    input d, set,reset, clk,
    output reg q
    );
    
    // change condition to always @ (posedge clk or negedge set or negedge reset)
    // for asynchronous set and reset
    always @ (posedge clk)
    begin
        if (reset == 0)
            q <= 0;
        else if (set == 0)
            q <= 1;
        else
            q <= d;
    end
endmodule
