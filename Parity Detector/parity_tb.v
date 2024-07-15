`timescale 1ns / 1ps

module Parity_TB;
    reg clk, x;
    wire z;
    Parity_Detector PAR (x, clk, z);
    initial
        begin
            clk = 1'b0;
        end   
    always #10 clk = ~clk;
    
    initial
        begin
            #3 x = 0; #20 x = 1; #20 x = 1; #20 x = 1;
            #20 x = 0; #20 x = 1; #20 x = 1; #20 x = 0;
            #10 $finish;
        end      
endmodule
