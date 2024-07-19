`timescale 1ns / 1ps

module MUL_test;
    reg [15: 0] data_in;
    reg clk, start;
    wire done;
    
    MUL_datapath DP (eqz, LdA, LdB, LdP, clrP, decB, data_in, clk);
    controller CON (LdA, LdB, LdP, clrP, decB, done, clk, eqz, start);
    
    initial
        begin
            clk = 1'b0;
            #3 start = 1'b1;
            #1000 $finish;
        end
    
    always #5 clk = ~clk;
    
    initial
        begin
            #17 data_in = 17;
            #10 data_in = 5;
        end
    initial
        begin
            $monitor ($time, " %d  %b   %16b", DP.Y, done, DP.Bout);
        end

endmodule
