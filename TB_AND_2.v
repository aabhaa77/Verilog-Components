`timescale 1ns / 1ps

module TB_AND_2(
    );
    reg a, b;
    wire c;
    
    AND_GATE A1(a, b, c);
    
    initial
    begin
        a = 1; b = 0;
        #100; a = 0; b = 0;
        #100; a = 1; b = 1;
        #100; a = 0; b = 1;
        #100; a = 1; b = 1;
    end
endmodule
