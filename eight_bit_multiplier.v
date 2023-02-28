`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:50:33 02/02/2023 
// Design Name: 
// Module Name:    eight_bit_multiplier 
// Project Name: 
//
//////////////////////////////////////////////////////////////////////////////////
module four_bit_multi(mul,a,b,rst);
input [3:0]a,b;
output [8:0]mul;
input rst;
wire [3:0]w1,w2,w3,w4;
wire [10:0]w0;
wire [5:0]s;

and n0(w1[0],a[0],b[0]);
and n1(w1[1],a[1],b[0]);
and n2(w1[2],a[2],b[0]);
and n3(w1[3],a[3],b[0]);

and n4(w2[0],a[0],b[1]);
and n5(w2[1],a[1],b[1]);
and n6(w2[2],a[2],b[1]);
and n7(w2[3],a[3],b[1]);

and n8(w3[0],a[0],b[2]);
and n9(w3[1],a[1],b[2]);
and n10(w3[2],a[2],b[2]);
and n11(w3[3],a[3],b[2]);

and n12(w4[0],a[0],b[3]);
and n13(w4[1],a[1],b[3]);
and n14(w4[2],a[2],b[3]);
and n15(w4[3],a[3],b[3]);

and h0(mul[0],w1[0],rst);
half_adder h1(mul[1],w0[0],w1[1],w2[0],rst);
full_adder h2(s[0],w0[1],w1[2],w2[1],w0[0],rst);
full_adder h3(s[1],w0[2],w1[3],w2[2],w0[1],rst);
half_adder h4(s[2],w0[3],w0[2],w2[3],rst);

half_adder h5(mul[2],w0[4],s[0],w3[0],rst);
full_adder h6(s[3],w0[5],s[1],w3[1],w0[4],rst);
full_adder h7(s[4],w0[6],s[2],w3[2],w0[5],rst);
full_adder h8(s[5],w0[7],w0[6],w3[3],w0[3],rst);

half_adder h9(mul[3],w0[8],s[3],w4[0],rst);
full_adder h10(mul[4],w0[9],s[4],w4[1],w0[8],rst);
full_adder h11(mul[5],w0[10],s[5],w4[2],w0[9],rst);
full_adder h12(mul[6],mul[7],w0[10],w4[3],w0[7],rst);

and h13(mul[8],0,rst);

endmodule
