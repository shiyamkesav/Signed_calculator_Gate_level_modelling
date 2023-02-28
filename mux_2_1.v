`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    21:46:51 02/02/2023 
// Design Name: 
// Module Name:    mux_2_1 
// Project Name:  
//
//////////////////////////////////////////////////////////////////////////////////
module mux_2_1(Y,I0,I1,sel);
input sel,I0,I1;
output Y;
wire [1:0]w;

and n1(w[0],I0,~sel);
and n2(w[1],I1,sel);
or n3(Y,w[0],w[1]);

endmodule
