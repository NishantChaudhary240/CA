`include "xor_gate.v"  // Include the Verilog file containing the XOR gate module

module tb_xor_gate;

    reg a, b;          // Input signals
    wire y_expected;   // Expected output from the XOR gate
    wire y_actual;     // Actual output from the XOR gate

    // Instantiate the XOR gate module
    xor_gate xor_inst (
        .a(a),
        .b(b),
        .y(y_actual)
    );

    initial begin
        // Stimulus generation
        // Apply test vectors to inputs a and b
        // Compare expected and actual outputs
        // End simulation
        $dumpfile("tb_xor_gate.vcd");
        $dumpvars(0, tb_xor_gate);
        
        a = 0; b = 0; // Test case 1
        #10;
        a = 0; b = 1; // Test case 2
        #10;
        a = 1; b = 0; // Test case 3
        #10;
        a = 1; b = 1; // Test case 4
        #10;
        
        $finish;
    end

endmodule
