`timescale 1ns/1ns
`include "FBaddsub.v"
module FBaddsub_tb();
    reg [3:0] A;
    reg [3:0] B;
    reg s;
    wire [3:0] S;
    wire Cout;
    FBaddsub test(A,B,s,S,Cout);
    initial 
        begin 
            $dumpfile("FBaddsub.vcd");
            $dumpvars(0,FBaddsub_tb);
            A = 4'b1010; B = 4'b1011; s = 1'b0; #10;
            A = 4'b1010; B = 4'b1011; s = 1'b1; #10;
            A = 4'b0110; B = 4'b0100; s = 1'b0; #10;
            A = 4'b0110; B = 4'b0100; s = 1'b1; #10;
            $display("Test complete");
        end
endmodule