module tb_cla_32bit;

reg [31:0] A, B;
reg Cin;
wire [31:0] S;
wire Cout;

cla_32bit uut (
.A(A),
.B(B),
.Cin(Cin),
.S(S),
.Cout(Cout)
);

initial begin
$dumpfile("dump.vcd");
$dumpvars(0, tb_cla_32bit);

// Test 1: Simple Addition (5 + 10 = 15)
A = 32'h00000005; B = 32'h0000000A; Cin = 0; #10;

// Test 2: Carry Propagation across blocks
A = 32'h0FFFFFFF; B = 32'h00000001; Cin = 0; #10;

// Test 3: Carry-out at MSB
A = 32'hFFFFFFFF; B = 32'h00000001; Cin = 0; #10;

// Test 4: General Addition
A = 32'h12345678; B = 32'h87654321; Cin = 1; #10;

$finish;
end

endmodule