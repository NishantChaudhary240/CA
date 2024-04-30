`include "notgate.v"

module notgate_tb;
    reg a;
    wire out;
    notgate not_inst(a,out);

    initial begin 
        $dumpfile("notgate_tb.vcd");
        $dumpvars(0,notgate_tb);
        a=0;
        #10
        a=1;
        #10
        $finish;
    end
endmodule