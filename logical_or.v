`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    23:59:35 02/03/2023 
// Design Name: 
// Module Name:    logical_or 
// Project Name:  
//
//////////////////////////////////////////////////////////////////////////////////
module logical_or(Y,a,b,rst);
input [3:0]a,b;
input rst;
output Y;
wire [2:0]w;

or a0(w[0],a[0],a[1],a[2],a[3]);
or a1(w[1],b[0],b[1],b[2],b[3]);
or a2(w[2],w[1],w[0]);
and a3(Y,rst,w[2]);

endmodule
