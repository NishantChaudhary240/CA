module pipe(
    input [N-1:0] a, b, c, d,
    input clk,
    output reg [N-1:0] f
);

parameter N=10;

reg [N-1:0] l12_x1, l12_x2, l12_d, l23_x3, l23_d;

always @(posedge clk) begin
    l12_x1 <= a + b;
    l12_x2 <= c - d;
    l12_d <= d;
end

always @(posedge clk) begin
    l23_x3 <= l12_x1 + l12_x2;
    l23_d <= l12_d;
end

always @(posedge clk) begin
    f <= l23_x3 + l23_d;
end

endmodule
