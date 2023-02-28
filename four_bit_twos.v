`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    22:17:01 02/02/2023 
// Design Name: 
// Module Name:    four_bit_twos 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module four_bit_twos(Y,a,rst);
input [3:0]a;
input rst;
output [3:0]Y;
wire [3:0]w;

half_adder h1(Y[0],w[0],~a[0],1,rst);
half_adder h2(Y[1],w[1],~a[1],w[0],rst);
half_adder h3(Y[2],w[2],~a[2],w[1],rst);
half_adder h4(Y[3],w[3],~a[3],w[2],rst);

endmodule
