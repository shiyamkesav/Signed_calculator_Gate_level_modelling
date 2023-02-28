`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    00:07:14 02/04/2023 
// Design Name: 
// Module Name:    four_bit_comparator 
// Project Name:  
//
//////////////////////////////////////////////////////////////////////////////////
module four_bit_comparator(HEL,a,b,rst); // a compared with b
input [3:0]a,b;
input rst;
output [2:0]HEL;
wire [3:0]w0,c;
wire w1,w2;

half_subtractor t0(w0[0],c[0],a[0],b[0],rst);        //                                  //
full_subtractor t1(w0[1],c[1],a[1],b[1],c[0],rst);   //          Four bit                //
full_subtractor t2(w0[2],c[2],a[2],b[2],c[1],rst);   //             subtractor           //
full_subtractor t3(w0[3],c[3],a[3],b[3],c[2],rst);   //                                  //
and t4(HEL[0],c[3],1);                                 //            a < b                 //
xor t5(w1,c[3],1);
nor t6(w2,w0[0],w0[1],w0[2],w0[3]);                  
and t7(HEL[2],rst,w1,~HEL[1]);                          //            a > b                 //
and t8(HEL[1],rst,w2);                                //            a = b                 // 

endmodule
