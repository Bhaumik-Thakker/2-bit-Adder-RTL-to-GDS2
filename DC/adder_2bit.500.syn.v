/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Ultra(TM) in wire load mode
// Version   : V-2023.12-SP5-1
// Date      : Sun Mar 30 18:42:45 2025
/////////////////////////////////////////////////////////////


module adder_2bit ( clk, a, b, sum, cout );
  input [1:0] a;
  input [1:0] b;
  output [1:0] sum;
  input clk;
  output cout;
  wire   n9, n10, n11, n12, n13, n14, n15, n16, n17, n18, n19;

  DFFHQNx1_ASAP7_75t_R cout_reg ( .D(n10), .CLK(clk), .QN(cout) );
  DFFHQNx1_ASAP7_75t_R sum_reg_1_ ( .D(n9), .CLK(clk), .QN(sum[1]) );
  DFFHQNx1_ASAP7_75t_R sum_reg_0_ ( .D(n11), .CLK(clk), .QN(sum[0]) );
  OAI21xp33_ASAP7_75t_R U14 ( .A1(b[0]), .A2(a[0]), .B(n12), .Y(n11) );
  NAND2xp5_ASAP7_75t_R U15 ( .A(b[0]), .B(a[0]), .Y(n12) );
  NAND3xp33_ASAP7_75t_R U16 ( .A(b[0]), .B(a[0]), .C(b[1]), .Y(n14) );
  NAND3xp33_ASAP7_75t_R U17 ( .A(b[0]), .B(a[0]), .C(a[1]), .Y(n13) );
  NAND2xp5_ASAP7_75t_R U18 ( .A(n14), .B(n13), .Y(n15) );
  OAI22xp5_ASAP7_75t_R U19 ( .A1(a[1]), .A2(n15), .B1(b[1]), .B2(n15), .Y(n10)
         );
  INVxp33_ASAP7_75t_R U20 ( .A(b[1]), .Y(n17) );
  INVxp33_ASAP7_75t_R U21 ( .A(a[1]), .Y(n16) );
  AOI22xp5_ASAP7_75t_R U22 ( .A1(a[1]), .A2(b[1]), .B1(n17), .B2(n16), .Y(n19)
         );
  NAND3xp33_ASAP7_75t_R U23 ( .A(b[0]), .B(a[0]), .C(n19), .Y(n18) );
  A2O1A1Ixp33_ASAP7_75t_R U24 ( .A1(a[0]), .A2(b[0]), .B(n19), .C(n18), .Y(n9)
         );
endmodule

