`include "norgate.v"
module norgate_tb;
reg a,b;
wire out;
norgate nor_ins(a,b,out);
initial begin
    $dumpfile("norgate_tb.vcd");
    $dumpvars(0,norgate_tb);
    a=0;b=0;#10
    a=0;b=1;#10
    a=1;b=0;#10
    a=1;b=1;#10
    $finish;
end
endmodule