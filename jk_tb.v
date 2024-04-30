`include "jk.v"
module jk_tb;

reg j, k, c;
wire q, qc;

// Instantiate JK flip-flop module
jk jk_inst (
    .j(j),
    .k(k),
    .c(c),
    .q(q),
    .qc(qc)
);

initial begin 
    c = 0;
    forever #1 c = ~c;
end

initial begin
    $dumpfile("jk_tb.vcd");
    $dumpvars(0, jk_tb);
    j = 1'b1;
    k = 1'b0;
    #4;
    $finish;
end

always #2 j = ~j;
always #1 k = ~k;

endmodule
