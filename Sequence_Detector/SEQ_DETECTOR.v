`timescale 1ns / 1ps

module SEQ_DETECTOR(x, clk, reset, z);
    input x, clk, reset;
    output reg z;
    parameter S0 = 0, S1 = 1, S2 = 2, S3 = 3;
    //S1 = initial, S2 = 0, S2 = 01, S3 = 011
    reg [0:1] PS, NS;
    always @(posedge clk or posedge reset)
        if (reset)  PS <= S0;
        //Next State becomes the Present State at every consecutive clock cycle
        else        PS <= NS;
    always @ (PS, x)
        case (PS)
            S0: begin
                z = x ? 0 : 0;
                NS = x ? S0 : S1;
                end
            S1: begin
                z = x ? 0: 0;
                NS = x ? S2 : S1;
                end
            S2: begin
                z = x ? 0 : 1;
                NS = x ? S3 : S1;
                end
            S3: begin
                z = x ? 0 : 1;
                NS = x ? S0 : S1;
                end
            endcase 
endmodule
