`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:22:54 01/31/2023 
// Design Name: 
// Module Name:    four_bit_subtractor 
// Project Name:  
//
//////////////////////////////////////////////////////////////////////////////////
module four_bit_subtractor(d,a,b,rst);
input [5:0]a,b;
input rst;
output [5:0]d;
wire [5:0]w;

half_subtractor s0(d[0],w[0],a[0],b[0],rst);
full_subtractor s1(d[1],w[1],a[1],b[1],w[0],rst);
full_subtractor s2(d[2],w[2],a[2],b[2],w[1],rst);
full_subtractor s3(d[3],w[3],a[3],b[3],w[2],rst);
full_subtractor s4(d[4],w[4],a[4],b[4],w[3],rst);
full_subtractor s5(d[5],w[5],a[5],b[5],w[4],rst);

endmodule
