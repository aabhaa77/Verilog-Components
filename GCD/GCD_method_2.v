`timescale 1ns / 1ps

module PIPO (d_out, d_in, ld, clk);
    input [15:0] d_in;
    input ld, clk;
    output reg[15:0] d_out;
    always @ (posedge clk)
        if (ld) d_out <= d_in;
endmodule

module SUB (d_out, in1, in2);
    input [15: 0] in1, in2;
    output reg [15:0] d_out;
    always @ (*)
        d_out = in2 - in1;
endmodule

module COMPARE (lt, gt, eq, data1, data2);
    input [15: 0] data1, data2;
    output lt, gt, eq;
    assign lt = data1 < data2;
    assign gt = data2 < data1;
    assign eq = data1 == data2;
endmodule

module MUX (out, in0, in1, sel);
    input [15:0] in0, in1;
    input sel;
    output [15: 0] out;
    assign out = sel ? in1 : in0;
endmodule

module GCD_datapath (lt, gt, eq, ldA, ldB, sel1, sel2, sel_in, data_in, clk);
    input ldA, ldB, sel1, sel2, sel_in, clk;
    input [15:0] data_in;
    output gt, lt, eq;
    wire[15: 0] Aout, Bout, X, Y, Bus, Subout;
    //assign Bus = data_in;
    PIPO A (Aout, Bus, ldA, clk);
    PIPO B (Bout, Bus, ldB, clk);
    MUX MUX_in1 (X, Aout, Bout, sel1);
    MUX MUX_in2 (Y, Aout, Bout, sel2);
    MUX MUX_load (Bus, Subout, data_in, sel_in);
    SUB SB (Subout, X, Y);
    COMPARE CMP (lt, gt, eq, Aout, Bout);
endmodule

module controller (ldA, ldB, sel1, sel2, sel_in, done, clk, lt, gt, eq, start);
    input clk, lt, gt, eq, start;
    output reg ldA, ldB, sel1, sel2, sel_in, done;
    reg [2:0] state, next_state;
    parameter S0 = 3'b000, S1 = 3'b001, S2 = 3'b010, S3 = 3'b011, S4 = 3'b100, S5 = 3'b101;
  
    initial
        begin
            state = S0;
        end
    //Method 2: uses different variables for Present and Next State and 2 always blocks
    always @ (posedge clk)
        begin
            state <= next_state;
        end
    
    always @ (*)
        begin
        //sel_in = 0; ldA = 0; ldB = 0; sel1 = 0; sel2 = 0; done = 0;      
        case (state)
            S0: if (start) begin sel_in = 1; ldA = 1; ldB = 0; done = 0; next_state = S1; end
                else next_state = S0;
            S1: begin sel_in = 1; ldA = 0; ldB = 1; next_state = S2; end
            S2: #1 if (eq) begin done = 1; next_state = S5; end
                else if (lt) begin
                                sel1 = 0; sel2 = 1; sel_in = 0; next_state = S3;
                                #1 ldA = 0; ldB = 1;
                             end
                else if (gt) begin
                                sel1 = 1; sel2 = 0; sel_in = 0; next_state = S4;
                                #1 ldA = 1; ldB = 0;
                             end
            S3: #1 if (eq) begin done = 1; next_state = S5; end
                else if (lt) begin
                                sel1 = 0; sel2 = 1; sel_in = 0; next_state = S3;
                                #1 ldA = 0; ldB = 1;
                             end
                else if (gt) begin
                                sel1 = 1; sel2 = 0; sel_in = 0; next_state = S4;
                                #1 ldA = 1; ldB = 0;
                             end
             S4: #1 if (eq) begin done = 1; next_state = S5; end
                else if (lt) begin
                                sel1 = 0; sel2 = 1; sel_in = 0; next_state = S3;
                                #1 ldA = 0; ldB = 1;
                             end
                else if (gt) begin
                                sel1 = 1; sel2 = 0; sel_in = 0; next_state = S4;
                                #1 ldA = 1; ldB = 0;
                             end
            S5: #1 begin
                    done = 1; sel1 = 0; sel2 = 0; ldA = 0; ldB = 0; next_state = S5;
                    end
            default: begin ldA = 0; ldB = 0; next_state = S0; end
        endcase
        end

 endmodule  
