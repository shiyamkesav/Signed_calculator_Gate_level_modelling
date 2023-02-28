`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    01:39:09 02/03/2023 
// Design Name: 
// Module Name:    Decremental_4_bit 
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
module decremental_4_bit(Y,a,en,rst);
input [5:0]a;
input rst,en;
output [5:0]Y;
wire [5:0]w,w1;

half_subtractor s0(w1[0],w[0],a[0],1,rst);
half_subtractor s1(w1[1],w[1],a[1],w[0],rst);
half_subtractor s2(w1[2],w[2],a[2],w[1],rst);
half_subtractor s3(w1[3],w[3],a[3],w[2],rst);
half_subtractor s4(w1[4],w[4],a[4],w[3],rst);
half_subtractor s5(w1[5],w[5],a[5],w[4],rst);

mux_2_1 s6(Y[0],a[0],w1[0],en);
mux_2_1 s7(Y[1],a[1],w1[1],en);
mux_2_1 s8(Y[2],a[2],w1[2],en);
mux_2_1 s9(Y[3],a[3],w1[3],en);
mux_2_1 s10(Y[4],a[4],w1[4],en);
mux_2_1 s11(Y[5],a[5],w1[5],en);

endmodule
