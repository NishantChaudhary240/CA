`include "multiplexer.v"
module multiplexer_tb;
reg a,b,c,d,s0,s1;
wire y;

multiplexer mux_ins(a,b,c,d,s0,s1,y);
initial begin
    $dumpfile("multiplexer_tb.vcd");
    $dumpvars(0,multiplexer_tb);

    s0=0; s1=0; a=1; #10
    s0=0; s1=1; b=1; #10
    s0=1; s1=0; c=1; #10
    s0=1; s1=1; d=1; #10
    $finish;
end
endmodule