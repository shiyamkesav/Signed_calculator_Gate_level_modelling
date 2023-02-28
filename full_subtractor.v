`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    23:32:33 01/30/2023 
// Design Name: 
// Module Name:    full_subtractor 
// Project Name: 
//
//////////////////////////////////////////////////////////////////////////////////
module full_subtractor(diff,borrow,a,b,bin,rst);
input a,b,bin,rst;
output diff,borrow;
wire [4:0]w;
half_subtractor n1(w[0],w[1],a,b,rst);
half_subtractor n2(w[2],w[3],w[0],bin,rst);
or (w[4],w[3],w[1]);

and m1(diff,w[2],rst);
and m2(borrow,w[4],rst);
endmodule
