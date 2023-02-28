`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    22:57:07 01/30/2023 
// Design Name: 
// Module Name:    full_adder 
// Project Name: 
//
//////////////////////////////////////////////////////////////////////////////////
module full_adder(sum,carry,a,b,cin,rst);
input a,b,cin,rst;
output sum,carry;
wire [4:0]w;

half_adder n1(w[0],w[1],a,b,rst);
half_adder n2(w[2],w[3],cin,w[0],rst);
or (w[4],w[1],w[3]);

and m1(sum,w[2],rst);
and m2(carry,w[4],rst);
endmodule
