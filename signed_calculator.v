`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:14:33 02/02/2023 
// Design Name: 
// Module Name:    signed_calculator 
// Project Name:  Arithmatic and Logical calculator
//
///////////////////////////////////////////////////////////////////////////////////////////////////////////           
module signed_cal(op,rem,HEL,And,shift,Or,a,b,Sign,shift_value,shift_number,RorL,mode,rst);
input [3:0]a,b;
input [1:0]Sign,shift_value;
input rst,shift_number,RorL;
output [9:0]op;

wire [5:0]sum,diff;
wire [9:0]multi;
wire [5:0]quo;
output [3:0]rem,shift;
output [2:0]HEL;
output And,Or;

wire [3:0]w4,w5,w7,se;
wire [6:0]w1,w2,c;
wire [5:0]w6;
wire [8:0]w3;
wire [7:0]Y;
input[2:0]mode;

decoder_3_8 t0(Y,mode,rst);
xor(w1[6],Sign[1],Sign[0]);                               //////////////////////////////////////////////////////////
twos_complement t1(w1,a,Sign[0],rst);                     //       Twos complement of a and b                     //
twos_complement t2(w2,b,Sign[1],rst);                     //                                                      //
four_bit_adder t3(sum,w1,w2,Y[0]);                        //       Signed Adder mode(000)                         //
four_bit_subtractor t4(diff,w1,w2,Y[1]);                  //       Signed Subtractor mode(001)                    // 
four_bit_multi t5(w3,a,b,rst);                            //       Four bit Multiplier                            //
twos_9_bit t6(multi,w3,w1[6],Y[2]);                       //       Four bit signed Multiplier mode(010)           //
divider t7(w4,w5,a,b,Y[3]);                               //       Four bit Divider mode(011)                     //
                                                          //                                                      //
or t8(c[4],w5[0],w5[1],w5[2],w5[3]);                      //////////////////////////////////////////////////////////
and t9(w2[6],c[4],w1[6]);                                 //                                                      //
half_subtractor t10(w7[0],c[0],b[0],w5[0],Y[3]);          //                                                      //
full_subtractor t11(w7[1],c[1],b[1],w5[1],c[0],Y[3]);     //          Four bit       Sign[1]   Sign[0]  opertion  //
full_subtractor t12(w7[2],c[2],b[2],w5[2],c[1],Y[3]);     //          Signed            0         0      +a, +b   //
full_subtractor t13(w7[3],c[3],b[3],w5[3],c[2],Y[3]);     //          Divider           0         1      -a, +b   //
mux_2_1 t14(rem[0],w5[0],w7[0],w2[6]);                    //                            1         0      +a, -b   //
mux_2_1 t15(rem[1],w5[1],w7[1],w2[6]);                    //                            1         0      -a, -b   //
mux_2_1 t16(rem[2],w5[2],w7[2],w2[6]);                    //                                                      //
mux_2_1 t17(rem[3],w5[3],w7[3],w2[6]);                    //                                                      //
                                                          //                                                      //
twos_complement t18(w6,w4,w1[6],Y[3]);                    //                                                      // 
decremental_4_bit t19(quo,w6,w1[6],Y[3]);                 ////////////////////////////////////////////////////////// 
                                                          //                                                      //
four_bit_comparator t20(HEL,a,b,Y[4]);                    //  Four bit comparator(a compared with b)  mode(100)   //
logical_and t21(And,a,b,Y[5]);                            //  Logical and operation (a && b)mode(101)             //
logical_or t22(Or,a,b,Y[6]);                              //  Logical or operation (a || b)mode(110)              //
                                                          //////////////////////////////////////////////////////////
mux_2_1 t23(se[0],a[0],b[0],shift_number);                //    Universal Shifter                                 //
mux_2_1 t24(se[1],a[1],b[1],shift_number);                //                shift_number       RorL               //
mux_2_1 t25(se[2],a[2],b[2],shift_number);                //                0          a         0      Right     //
mux_2_1 t26(se[3],a[3],b[3],shift_number);                //                1          b         1      Left      //
Universal_shifter t27(shift,se,shift_value,RorL,Y[7]);	 //////////////////////////////////////////////////////////			

or t28(op[0],sum[0],diff[0],multi[0],quo[0]);
or t29(op[1],sum[1],diff[1],multi[1],quo[1]);
or t30(op[2],sum[2],diff[2],multi[2],quo[2]);
or t31(op[3],sum[3],diff[3],multi[3],quo[3]);
or t32(op[4],sum[4],diff[4],multi[4],quo[4]);
or t33(op[5],sum[5],diff[5],multi[5],quo[5]);
or t34(op[6],sum[5],diff[5],multi[6],quo[5]);
or t35(op[7],sum[5],diff[5],multi[7],quo[5]);
or t36(op[8],sum[5],diff[5],multi[8],quo[5]);
or t37(op[9],sum[5],diff[5],multi[9],quo[5]);										 
																	 
endmodule
