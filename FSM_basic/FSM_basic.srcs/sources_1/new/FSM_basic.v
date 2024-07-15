`timescale 1ns / 1ps

//Red, Green and Yellow lamps glow cyclically with a fixed time interval
module cyclic_lamp(clk, light);
    input clk;
    output reg [0:2] light;
    //3 States => 2 bits to represent them. S0 = 00, S1 = 01, S2 = 10
    parameter S0 = 0, S1 = 1, S2 = 2;
    parameter RED = 3'b011, GREEN = 3'b010, YELLOW = 3'b001;
    reg [0:1] state;
    always @ (posedge clk)
        case (state)
            S0: begin   //S0 means RED
                light <= GREEN;
                state <= S1;
            end
            S1: begin   //S1 means GREEN
                light <= YELLOW;
                state <= S2;
            end
            S2: begin   //S2 means YELLOW
                light <= RED;
                state <= S0;
            end
        default: begin
                light <= RED;
                state <= S0;
            end
        endcase
endmodule
