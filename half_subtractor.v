`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    23:20:43 01/30/2023 
// Design Name: 
// Module Name:    half_subtractor 
// Project Name: 
//
//////////////////////////////////////////////////////////////////////////////////
module half_subtractor(diff,borrow,a,b,rst);
input a,b,rst;
output diff,borrow;
wire [1:0]w; 

xor (w[0],a,b);
and n1(w[1],~a,b);

and n2(diff,w[0],rst);
and n3(borrow,w[1],rst);
endmodule
