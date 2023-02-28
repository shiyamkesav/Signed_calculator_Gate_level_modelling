`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    22:49:10 01/30/2023 
// Design Name: 
// Module Name:    half_adder 
// Project Name: 
//
//////////////////////////////////////////////////////////////////////////////////
module half_adder(sum,carry,a,b,rst);
input a,b,rst;
output sum,carry;
wire [1:0]w;

xor (w[0],a,b);
and n1(w[1],a,b);

and n2(sum,rst,w[0]);
and n3(carry,rst,w[1]);

endmodule
