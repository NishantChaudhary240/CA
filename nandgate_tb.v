`include "nandgate.v"
module nandgate_tb;
reg a,b;
wire out;

nandgate nand_ins(a,b,out);
initial begin
    $dumpfile("nandgate_tb.vcd");
    $dumpvars(0,nandgate_tb);

    a=0;b=0;#10
    a=0;b=1;#10
    a=1;b=0;#10
    a=1;b=1;#10
    $finish;
end
endmodule