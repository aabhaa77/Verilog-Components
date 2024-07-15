`timescale 1ns / 1ps

module test_cyclic_lamp;
    reg clk;wire [0:2] light;
    
    cyclic_lamp LAMP (clk, light);
    always #10 clk = ~clk;
    initial
        begin
            clk = 1'b0;
            #200 $finish;
        end
endmodule
