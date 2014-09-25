//Roy Joo
//CSE=341
//Project-2
//Verilog Structural 
//50016076

module fullbitalu(f, cout, zero, set,  s1, s2,  sub, a, b, cin); // 32 bit version of alu made by cascading 32 1 bit alus. Operation code for add: 000. Or: 010. Add: 100. Subtract: 101. SLT: 111. For Slt only final result matters

output [31:0] f;
output cout, zero, set;
input s1, s2, sub, cin;
input [31: 0] a, b;
wire c [31:0];

or
	g1(x, cin, sub);
nor
	g2(zero, f[0], f[1] ,f[2], f[3], f[4], f[5], f[6], f[7], f[8], f[9], f[10], f[11], f[12], f[13], f[14], f[15], f[16], f[17], f[18], f[19], f[20], f[21], f[22], f[23], f[24], f[25], f[26], f[27], f[28], f[29], f[30], f[31]);

xor
	g3(set, f[31], cout);

bitalu f0(f[0], c[0], s1, s2, sub, a[0], b[0], x); 
bitalu f1(f[1], c[1], s1, s2, sub, a[1], b[1], c[0]);
bitalu f2(f[2], c[2], s1, s2, sub, a[2], b[2], c[1]);
bitalu f3(f[3], c[3], s1, s2, sub, a[3], b[3], c[2]);
bitalu f4(f[4], c[4], s1, s2, sub, a[4], b[4], c[3]);
bitalu f5(f[5], c[5], s1, s2, sub, a[5], b[5], c[4]);
bitalu f6(f[6], c[6], s1, s2, sub, a[6], b[6], c[5]);
bitalu f7(f[7], c[7], s1, s2, sub, a[7], b[7], c[6]);
bitalu f8(f[8], c[8], s1, s2, sub, a[8], b[8], c[7]);
bitalu f9(f[9], c[9], s1, s2, sub, a[9], b[9], c[8]);
bitalu f10(f[10], c[10], s1, s2, sub, a[10], b[10], c[9]);
bitalu f11(f[11], c[11], s1, s2, sub, a[11], b[11], c[10]);
bitalu f12(f[12], c[12], s1, s2, sub, a[12], b[12], c[11]);
bitalu f13(f[13], c[13], s1, s2, sub, a[13], b[13], c[12]);
bitalu f14(f[14], c[14], s1, s2, sub, a[14], b[14], c[13]);
bitalu f15(f[15], c[15], s1, s2, sub, a[15], b[15], c[14]);
bitalu f16(f[16], c[16], s1, s2, sub, a[16], b[16], c[15]);
bitalu f17(f[17], c[17], s1, s2, sub, a[17], b[17], c[16]);
bitalu f18(f[18], c[18], s1, s2, sub, a[18], b[18], c[17]);
bitalu f19(f[19], c[19], s1, s2, sub, a[19], b[19], c[18]);
bitalu f20(f[20], c[20], s1, s2, sub, a[20], b[20], c[19]);
bitalu f21(f[21], c[21], s1, s2, sub, a[21], b[21], c[20]);
bitalu f22(f[22], c[22], s1, s2, sub, a[22], b[22], c[21]);
bitalu f23(f[23], c[23], s1, s2, sub, a[23], b[23], c[22]);
bitalu f24(f[24], c[24], s1, s2, sub, a[24], b[24], c[23]);
bitalu f25(f[25], c[25], s1, s2, sub, a[25], b[25], c[24]);
bitalu f26(f[26], c[26], s1, s2, sub, a[26], b[26], c[25]);
bitalu f27(f[27], c[27], s1, s2, sub, a[27], b[27], c[26]);
bitalu f28(f[28], c[28], s1, s2, sub, a[28], b[28], c[27]);
bitalu f29(f[29], c[29], s1, s2, sub, a[29], b[29], c[28]);
bitalu f30(f[30], c[30], s1, s2, sub, a[30], b[30], c[29]);
bitalu f31(f[31], cout, s1, s2, sub, a[31], b[31], c[30]);


endmodule

module bitalu(f, cout, s1, s2, sub, a, b, c); // 1 bit alu

output f, cout;
input s1, s2, sub, a, b, c;

fulladder x1(f3, cout, sub, a, b ,c);
andgate x2(f1, a, b);
orgate x3(f2, a, b);
mux4x1 x5(f, f1, f2, f3, f3, s1, s2);

endmodule


module fulladder(s, cout, sub, a, b, c); // 1 bit fulladder returns sum and carry out if sub is 1 then turns into a subtractor by using 2's complement

output s, cout;
input sub, a, b, c; 


xor
	g1(w1, b, sub),
	g2(w2, a, w1),
	g3(s, w2, c);
and
	g4(w3, c, w1),
	g5(w4, c, a),
	g6(w5, a, w1);
or
	g7(cout, w3, w4, w5);

endmodule 

module mux4x1(f, a, b, c, d, s1, s2); // multiplexer that chooses which result to return depending on the op code s1 and s2

output f;
input a, b, c, d, s1, s2;

and
	
	g1(w1, a, s1not, s2not),
	g2(w2, b, s1not, s2),
	g3(w3, c, s1, s2not),
	g4(w4, d, s1, s2);

or

	g5(f, w1, w2, w3, w4);

not
	g6(s1not, s1),
	g7(s2not, s2);

endmodule


module andgate(f, a, b); // result when operation is 00

output f;
input a, b;

and 
	g1(f, a, b);

endmodule

module orgate(f, a, b); // result when oepration is 01

output f;
input a, b;

or
	g1(f, a, b);

endmodule





`timescale 1ns/1ns 
module testbench(); 
 wire signed [31:0] a,b,f; 
 wire cin ,cout, zero, set, sub, s1, s2; 
 testfullalu  test (f, cout, zero, set, s1, s2, sub, a, b, cin); 
 fullbitalu alu (f,cout, zero, set, s1, s2, sub, a, b, cin); 

endmodule 
 
module testfullalu (f, cout, zero, set, s1, s2, sub, a, b, cin); 
 input signed [31:0] f; 
 input cout, zero, set; 
 output [31:0] a,b; 
 output cin, s1, s2, sub; 
 reg [31:0] a,b; 
 reg cin, s1, s2, sub; 
 initial 
 begin 
 $monitor($time,,"a=%d, b=%d, cin=%b, s1=%b, s2=%b, sub=%b, f=%d,cout=%b, set=%b, zero=%b",a,b,cin,s1,s2,sub,f,cout,set,zero);
 $display($time,,"a=%d, b=%d, cin=%b, s1=%b, s2=%b, sub=%b, f=%d,cout=%b, set=%b, zero=%b",a,b,cin,s1,s2,sub,f,cout,set,zero); 
 #1 a=2; b=3; cin=0; s1=0 ; s2=0 ; sub=0 ;
 #1 a=1; b=7; cin=0; s1=0 ; s2=0 ; sub=0 ; 
 #1 a=2 ; b=2 ; cin=0 ; s1=1 ; s2=0 ; sub=0 ; 
 #1 a=3 ; b=3 ; cin=0 ; s1=1 ; s2=0 ; sub=0 ; 
 #1 a=4 ; b=5 ; cin=0 ; s1=0 ; s2=1 ; sub=0 ; 
 #1 a=3 ; b=3 ; cin=0 ; s1=1 ; s2=0 ; sub=0 ; 
 #1 a=4 ; b=3 ; cin=0 ; s1=1 ; s2=0 ; sub=0 ; 
 #1 a=1 ; b=1 ; cin=0 ; s1=1 ; s2=0 ; sub=1 ; 
 #1 a=3 ; b=3 ; cin=0 ; s1=1 ; s2=0 ; sub=1 ; 
 #1 a=4 ; b=3 ; cin=0 ; s1=1 ; s2=0 ; sub=1 ; 
 #1 a=4 ; b=3 ; cin=0 ; s1=1 ; s2=1 ; sub=1 ; 
 #1 a=5 ; b=4 ; cin=0 ; s1=1 ; s2=0 ; sub=0 ; 
 #1 a=5 ; b=4 ; cin=0 ; s1=1 ; s2=0 ; sub=0 ; 
 #1 a=5 ; b=4 ; cin=0 ; s1=0 ; s2=0 ; sub=0 ; 
 #1 a=5 ; b=4 ; cin=0 ; s1=0 ; s2=0 ; sub=0 ; 
 #1 a=5 ; b=4 ; cin=0 ; s1=1 ; s2=1 ; sub=1 ; 
 #1 a=5 ; b=4 ; cin=0 ; s1=0 ; s2=1 ; sub=0 ; 
 #1 a=5 ; b=4 ; cin=0 ; s1=0 ; s2=1 ; sub=0 ; 
 #1 a=10235 ; b=1123 ; cin=0 ; s1=1 ; s2=1 ; sub=1 ; 
 #1 a=6666 ; b=423 ; cin=0 ; s1=0 ; s2=1 ; sub=0 ; 
 #1 a=5555 ; b=423 ; cin=0 ; s1=1 ; s2=1 ; sub=1 ; 
 #1 a=100 ; b=423 ; cin=0 ; s1=1 ; s2=0 ; sub=0 ; 
 #1 a=5 ; b=46 ; cin=0 ; s1=1 ; s2=0 ; sub=0 ; 
 #1 a=5 ; b=45; cin=0 ; s1=1 ; s2=0 ; sub=0 ; 
 #1 a=5 ; b=4 ; cin=0 ; s1=1 ; s2=1 ; sub=1 ; 
 #1 a=2 ; b=7 ; cin=1 ; s1=1 ; s2=1 ; sub=1 ; 
 #1 a=2 ; b=6 ; cin=1 ; s1=1 ; s2=1 ; sub=1 ; 
 #1 a=2 ; b=1 ; cin=1 ; s1=0 ; s2=0 ; sub=0 ; 
 #1 a=2 ; b=2 ; cin=1 ; s1=0 ; s2=0 ; sub=0 ; 
 #1 a=2 ; b=6 ; cin=1 ; s1=0 ; s2=0 ; sub=0 ; 
 #1 a=6 ; b=0 ; cin=1 ; s1=1 ; s2=1 ; sub=1 ; 
 #1 a=0 ; b=0 ; cin=0 ; s1=1 ; s2=1 ; sub=1 ; 
 #1 a=1 ; b=0 ; cin=1 ; s1=1 ; s2=1 ; sub=1 ; 
 #1 a=90 ; b=0 ; cin=0 ; s1=1 ; s2=1 ; sub=1 ; 
 #1 a=90 ; b=90 ; cin=0 ; s1=1 ; s2=0 ; sub=0 ; 
 #1 a=8 ; b=1 ; cin=0 ; s1=1 ; s2=0 ; sub=0 ; 
 #1 a=2 ; b=5 ; cin=0 ; s1=1 ; s2=0 ; sub=0 ; 
 #1 a=2 ; b=5 ; cin=0 ; s1=1 ; s2=0 ; sub=0 ; 
 #1 a=17 ; b=17 ; cin=0 ; s1=1 ; s2=0 ; sub=0 ; 
 #1 a=2 ; b=2 ; cin=0 ; s1=0 ; s2=1 ; sub=0 ; 
 #1 a=11 ; b=11 ; cin=0 ; s1=0 ; s2=1 ; sub=0 ; 
 #1 a=5 ; b=1 ; cin=0 ; s1=0 ; s2=1 ; sub=0 ; 
 #1 a=2 ; b=1 ; cin=0 ; s1=0 ; s2=1 ; sub=0 ; 
 #1 a=66 ; b=42 ; cin=0 ; s1=1 ; s2=1 ; sub=1 ; 
 #1 a=52 ; b=16 ; cin=0 ; s1=1 ; s2=1 ; sub=1 ; 
 #1 a=222 ; b=12 ; cin=0 ; s1=0 ; s2=0 ; sub=0 ; 
 #1 a=1 ; b=1 ; cin=0 ; s1=0 ; s2=0 ; sub=0 ; 
 #1 a=8 ; b=4 ; cin=0 ; s1=1 ; s2=1 ; sub=1 ; 
 #1 a=8 ; b=1 ; cin=0 ; s1=0 ; s2=0 ; sub=0 ; 
 #1 a=22 ; b=11 ; cin=0 ; s1=0 ; s2=0 ; sub=0 ; 
 #1 a=3 ; b=4 ; cin=0 ; s1=0 ; s2=0 ; sub=0 ; 
 #1 a=2 ; b=4 ; cin=0 ; s1=0 ; s2=0 ; sub=0 ; 
 #1 a=1 ; b=4 ; cin=0 ; s1=1 ; s2=0 ; sub=0 ; 
 #1 a=10 ; b=2 ; cin=0 ; s1=1 ; s2=0 ; sub=0 ; 
 #1 a=12 ; b=4 ; cin=0 ; s1=1 ; s2=0 ; sub=0 ; 
 #1 a=51 ; b=41 ; cin=0 ; s1=1 ; s2=0 ; sub=0 ; 
 #1 a=10 ; b=10 ; cin=0 ; s1=1 ; s2=0 ; sub=0 ; 
 #1 a=2 ; b=2 ; cin=0 ; s1=1 ; s2=0 ; sub=0 ; 
 #1 a=100 ; b=100 ; cin=0 ; s1=1 ; s2=0 ; sub=0 ; 
 #1 a=8 ; b=3 ; cin=0 ; s1=1 ; s2=0 ; sub=0 ; 
 #1 a=1 ; b=2 ; cin=0 ; s1=1 ; s2=0 ; sub=0 ; 
 #1 a=7 ; b=7 ; cin=0 ; s1=1 ; s2=0 ; sub=0 ; 
 #1 a=155 ; b=452 ; cin=0 ; s1=1 ; s2=0 ; sub=0 ; 
 #1 a=25 ; b=12 ; cin=0 ; s1=1 ; s2=0 ; sub=0 ; 
 #1 a=151 ; b=42 ; cin=0 ; s1=1 ; s2=1 ; sub=1 ; 
 #1 a=23 ; b=4 ; cin=0 ; s1=1 ; s2=1 ; sub=1 ; 
 #1 a=55 ; b=67 ; cin=0 ; s1=1 ; s2=1 ; sub=1 ; 
 #1 a=5 ; b=5 ; cin=0 ; s1=1 ; s2=1 ; sub=1 ; 
 #1 a=10 ; b=5 ; cin=0 ; s1=1 ; s2=1 ; sub=1 ; 
 #1 // Required for iverilog to show final values 
 $display($time,,"a=%d, b=%d, c=%b, s1=%b, s2=%b, sub=%b, f=%d,cout=%b, set=%b, zero=%b",a,b,cin,s1,s2,sub,f,cout,set,zero); 
 
 end 
endmodule 












