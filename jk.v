module jk (
    input j, k, c,
    output reg q,
    output qc
);

assign qc = ~q;

always @(posedge c) begin
    if (j == 0 && k == 0)
        q <= q;
    else if (j == 0 && k == 1)
        q <= 0;
    else if (j == 1 && k == 0)
        q <= 1;
    else if (j == 1 && k == 1)
        q <= ~q;
end

endmodule
