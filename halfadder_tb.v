`include "halfadder.v"
module halfadder_tb;
reg a,b;
wire sum,carry;
half_adder ha_ins(a,b,sum,carry);

initial begin
    $dumpfile("halfadder_tb.vcd");
    $dumpvars(0,halfadder_tb);

    a=0;b=0;#10
    a=0;b=1;#10
    a=1;b=0;#10
    a=1;b=1;#10
    $finish;
end
endmodule