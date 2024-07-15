`timescale 1ns / 1ps

//Takes Serial Input, and outputs parity of bit seen so far
//High if ODD number of 1s are seen, Low if EVEN number of 1s seen
module Parity_Detector(x, clk, z);
    input x, clk;
    output reg z;
    reg even_odd;  //indicates machine state
    
    parameter EVEN = 0, ODD = 1;
    //Synthesis tool generates a latch for the output even_odd
    always @ (posedge clk)
        case (even_odd)
            EVEN: begin
                //z <= x ? 1 : 0;       generates latch for z
                even_odd <= x ? ODD : EVEN;
                end
            ODD: begin
                //z <= x ? 0 : 1;
                even_odd <= x ? EVEN : ODD;
                end
            default: even_odd <= EVEN;
        endcase
     //Combinational circuit generated for z
     always @ (even_odd)
        case (even_odd)
            EVEN: z = 0;
            ODD: z = 1;
            default z = 0;
        endcase
endmodule
