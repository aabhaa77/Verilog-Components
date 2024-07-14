`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 27.06.2024 16:07:37
// Design Name: 
// Module Name: ADDER
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


module ADDER(a, b, sum, sign, zero, carry, parity, overflow);
    
    input [15:0] a;
    input [15:0] b;
    output [15:0] sum;
    output sign, zero, parity, carry, overflow;
    wire [3:0] c;
    
    ADDER_4BIT A0 (sum[3: 0], c[1], a[3: 0], b[3:0], 1'b0);
    ADDER_4BIT A1 (sum[7: 4], c[2], a[7: 4], b[7: 4], c[1]);
    ADDER_4BIT A2 (sum[11: 8], c[3], a[11: 8], b[11: 8], c[2]);
    ADDER_4BIT A3 (sum[15: 12], carry, a[15: 12], b[15: 12], c[3]);
    
    //assign {carry, sum} = a + b; //16 bit additon with concatenation so that extra bit equals carry
    assign sign = sum[15];
    assign zero = ~|sum;         //reduction nor operation, OR's all bits of sum and then takes a complement
    assign parity = ~^sum;       //parity equals 1 if there are even number of 1s therefore use reduced xnor operation
    assign overflow = (a[15] & b[15] & ~sum[15]) | (~a[15] & ~b[15] & sum[15]);
    
endmodule
