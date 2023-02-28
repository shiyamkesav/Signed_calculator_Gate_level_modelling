`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:59:18 01/31/2023 
// Design Name: 
// Module Name:    twos_complement 
// Project Name:  
//
//////////////////////////////////////////////////////////////////////////////////
module twos_complement(s,a,en,rst);
input [3:0]a;
input en,rst;
output [5:0]s;
wire [10:0]w;

xor n1(w[0],a[0],en);
xor n2(w[1],a[1],en);
xor n3(w[2],a[2],en);
xor n4(w[3],a[3],en);
xor n5(w[4],0,en);

half_adder h1(s[0],w[5],w[0],en,rst);
half_adder h2(s[1],w[6],w[1],w[5],rst);
half_adder h3(s[2],w[7],w[2],w[6],rst);
half_adder h4(s[3],w[8],w[3],w[7],rst);
half_adder h5(s[4],w[9],w[4],w[8],rst);
xor h6(w[10],en,w[8]);
and (s[5],w[10],rst);

endmodule
