module fulladder(a,b,c,carry,sum);
input a,b,c;
output carry,sum;

assign sum = a ^ b ^ c;
assign carry = (a & b) | (b & c) | (a & c);

endmodule
