`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    21:27:19 02/02/2023 
// Design Name: 
// Module Name:    divider 
// Project Name: 
//
//////////////////////////////////////////////////////////////////////////////////
module divider(quo,rem,a,b,rst);    //  a/b operation
input [3:0]a,b;
input rst;
output [3:0]quo,rem;
wire [3:0]w0,w1,w2,w3,w4,w5;
wire [2:0]mux1,mux2,mux3;
wire [2:0]c0,c1,c2,c3;

four_bit_twos s1(w0,b,rst);                 // 2's complement of b

half_adder s2(w1[0],c0[0],w0[0],a[3],rst);
full_adder s3(w1[1],c0[1],w0[1],0,c0[0],rst);      
full_adder s4(w1[2],c0[2],w0[2],0,c0[1],rst);
full_adder s5(w1[3],quo[3],w0[3],0,c0[2],rst);

mux_2_1 m1(mux1[2],0,w1[0],quo[3]);
mux_2_1 m2(mux1[1],0,w1[1],quo[3]);
mux_2_1 m3(mux1[0],a[3],w1[2],quo[3]);

half_adder s6(w2[0],c1[0],w0[0],a[2],rst);
full_adder s7(w2[1],c1[1],w0[1],mux1[0],c1[0],rst);
full_adder s8(w2[2],c1[2],w0[2],mux1[1],c1[1],rst);
full_adder s9(w2[3],quo[2],w0[3],mux1[2],c1[2],rst);

mux_2_1 m4(mux2[0],a[2],w2[0],quo[2]);
mux_2_1 m5(mux2[1],mux1[0],w2[1],quo[2]);
mux_2_1 m6(mux2[2],mux1[1],w2[2],quo[2]);

half_adder s10(w3[0],c2[0],w0[0],a[1],rst);
full_adder s11(w3[1],c2[1],w0[1],mux2[0],c2[0],rst);
full_adder s12(w3[2],c2[2],w0[2],mux2[1],c2[1],rst);
full_adder s13(w3[3],quo[1],w0[3],mux2[2],c2[2],rst);

mux_2_1 m7(mux3[0],a[1],w3[0],quo[1]);
mux_2_1 m8(mux3[1],mux2[0],w3[1],quo[1]);
mux_2_1 m9(mux3[2],mux2[1],w3[2],quo[1]);

half_adder s14(w4[0],c3[0],w0[0],a[0],rst);
full_adder s15(w4[1],c3[1],w0[1],mux3[0],c3[0],rst);
full_adder s16(w4[2],c3[2],w0[2],mux3[1],c3[1],rst);
full_adder s17(w4[3],quo[0],w0[3],mux3[2],c3[2],rst);

mux_2_1 m10(w5[0],a[0],w4[0],quo[0]);
mux_2_1 m11(w5[1],mux3[0],w4[1],quo[0]);
mux_2_1 m12(w5[2],mux3[1],w4[2],quo[0]);
mux_2_1 m13(w5[3],mux3[2],w4[3],quo[0]);

and a0(rem[0],rst,w5[0]);
and a1(rem[1],rst,w5[1]);
and a2(rem[2],rst,w5[2]);
and a3(rem[3],rst,w5[3]);

endmodule
