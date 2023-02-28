`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    23:48:22 01/30/2023 
// Design Name: 
// Module Name:    four_bit_adder 
// Project Name:  
//
//////////////////////////////////////////////////////////////////////////////////
module four_bit_adder(s,a,b,rst);
input [5:0]a,b;
input rst;
output [5:0]s;
wire [5:0]w;

half_adder (s[0],w[0],a[0],b[0],rst);
full_adder f1(s[1],w[1],a[1],b[1],w[0],rst);
full_adder f2(s[2],w[2],a[2],b[2],w[1],rst);
full_adder f3(s[3],w[3],a[3],b[3],w[2],rst);
full_adder f4(s[4],w[4],a[4],b[4],w[3],rst);
full_adder f5(s[5],w[5],a[5],b[5],w[4],rst);

endmodule
