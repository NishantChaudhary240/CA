 module FBaddsub(A,B,s,S,Cout);
    input [3:0]A;
    input [3:0]B;
    input s;
    output [3:0]S;
    output Cout;
    wire [2:0]C;

    fa f1(A[0],s^B[0],s,S[0],C[0]);
    fa f2(A[1],s^B[1],s,S[1],C[1]);
    fa f3(A[2],s^B[2],s,S[2],C[2]);
    fa f4(A[3],s^B[3],s,S[3],Cout);

endmodule

module fa(a,b,cin,s,cout);
    input a,b,cin
    output s,cout;
    assign s = a^b^cin;
    assign cout =a&b|a&cin|b&cin;
endmodule