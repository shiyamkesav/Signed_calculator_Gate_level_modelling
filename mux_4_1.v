`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    21:53:48 02/02/2023 
// Design Name: 
// Module Name:    mux_4_1 
// Project Name: 
//
//////////////////////////////////////////////////////////////////////////////////
module mux_4_1(Y,I0,I1,I2,I3,sel);
input I0,I1,I2,I3;
input [1:0]sel;
output Y;
wire [1:0]w;

mux_2_1 m0(w[0],I0,I1,sel[0]);
mux_2_1 m1(w[1],I2,I3,sel[0]);
mux_2_1 m2(Y,w[0],w[1],sel[1]);

endmodule
