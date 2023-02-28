`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:51:21 02/02/2023 
// Design Name: 
// Module Name:    twos_9_bit 
// Project Name:  
//
//////////////////////////////////////////////////////////////////////////////////
module twos_9_bit(s,a,en,rst);
input [8:0]a;
input en,rst;
output [9:0]s;
wire [18:0]w;

xor n1(w[0],a[0],en);
xor n2(w[1],a[1],en);
xor n3(w[2],a[2],en);
xor n4(w[3],a[3],en);
xor n5(w[4],a[4],en);
xor n6(w[5],a[5],en);
xor n7(w[6],a[6],en);
xor n8(w[7],a[7],en);
xor n9(w[8],a[8],en);

half_adder h1(s[0],w[9],w[0],en,rst);
half_adder h2(s[1],w[10],w[1],w[9],rst);
half_adder h3(s[2],w[11],w[2],w[10],rst);
half_adder h4(s[3],w[12],w[3],w[11],rst);
half_adder h5(s[4],w[13],w[4],w[12],rst);
half_adder h6(s[5],w[14],w[5],w[13],rst);
half_adder h7(s[6],w[15],w[6],w[14],rst);
half_adder h8(s[7],w[16],w[7],w[15],rst);
half_adder h9(s[8],w[17],w[8],w[16],rst);

xor h10(w[18],en,w[17]);
and (s[9],w[18],rst);

endmodule

