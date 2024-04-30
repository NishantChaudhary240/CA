module xor_gate(
    input wire a,
    input wire b,
    output reg y
);

always @* begin
    y = a ^ b; // XOR operation
end

endmodule
