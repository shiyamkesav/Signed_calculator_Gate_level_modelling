`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    22:06:19 02/05/2023 
// Design Name: 
// Module Name:    Universal_shifter 
// Project Name:  
//
//////////////////////////////////////////////////////////////////////////////////
module Universal_shifter(shift,a,s,R0_L1,rst);
input [3:0]a;
input [1:0]s;
input rst,R0_L1;
output [3:0]shift;
wire [11:0]w0;

mux_4_1 m1(w0[0],a[0],a[3],a[2],a[1],s);   //////////////////////////////////////
mux_4_1 m2(w0[1],a[1],a[0],a[3],a[2],s);   //                                  //
mux_4_1 m3(w0[2],a[2],a[1],a[0],a[3],s);   //            Right Shift           //
mux_4_1 m4(w0[3],a[3],a[2],a[1],a[0],s);   //                                  //
                                           //////////////////////////////////////
mux_4_1 m5(w0[4],a[0],a[1],a[2],a[3],s);   //                                  //
mux_4_1 m6(w0[5],a[1],a[2],a[3],a[0],s);   //              Left                //
mux_4_1 m7(w0[6],a[2],a[3],a[0],a[1],s);   //              Shift               //
mux_4_1 m8(w0[7],a[3],a[0],a[1],a[2],s);   //                                  //
                                           //////////////////////////////////////
mux_2_1 m9(w0[8],w0[1],w0[5],R0_L1);       //                                  //
mux_2_1 m10(w0[9],w0[2],w0[6],R0_L1);      //        Shift Selection           //               
mux_2_1 m11(w0[10],w0[3],w0[7],R0_L1);     //                                  //
mux_2_1 m12(w0[11],w0[4],w0[8],R0_L1);     //////////////////////////////////////

and m13(shift[0],rst,w0[8]);
and m14(shift[1],rst,w0[9]);
and m15(shift[2],rst,w0[10]);
and m16(shift[3],rst,w0[11]);

endmodule
