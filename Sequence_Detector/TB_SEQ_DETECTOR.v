`timescale 1ns / 1ps

module TB_SEQ_DETECTOR;
reg clk, x, reset;
wire z;
SEQ_DETECTOR SEQ (x, clk, reset, z);

initial
    begin
        clk = 1'b0;
        reset = 1'b1;
        #15 reset = 1'b0;
    end
    
    always #10 clk = ~clk;
    initial
        begin
            #17 x= 0; #20 x = 0; #20 x = 1; #20 x = 1;
            #20 x= 0; #20 x = 1; #20 x = 1; #20 x = 0;
            #20 x= 0; #20 x = 1; #20 x = 1; #20 x = 1;
            #20 $finish;
        end
endmodule
