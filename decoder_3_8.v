`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    00:34:59 02/03/2023 
// Design Name: 
// Module Name:    decoder_3_8 
// Project Name:  
//
//////////////////////////////////////////////////////////////////////////////////
module decoder_3_8(Y,I,rst);
input rst;
input [2:0]I;
output [7:0]Y;

and a0(Y[0],~I[2],~I[1],~I[0],rst);
and a1(Y[1],~I[2],~I[1],I[0],rst);
and a2(Y[2],~I[2],I[1],~I[0],rst);
and a3(Y[3],~I[2],I[1],I[0],rst);
and a4(Y[4],I[2],~I[1],~I[0],rst);
and a5(Y[5],I[2],~I[1],I[0],rst);
and a6(Y[6],I[2],I[1],~I[0],rst);
and a7(Y[7],I[2],I[1],I[0],rst);

endmodule
