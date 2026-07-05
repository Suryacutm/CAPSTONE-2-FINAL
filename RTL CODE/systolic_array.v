`timescale 1ns / 1ps
`default_nettype none

module systolic_array (
    input  wire        clk,
    input  wire        rst,
    input  wire [7:0]  A,
    input  wire [7:0]  B,
    output wire [15:0] Product
);

    wire [6:0] a_row0;
    wire [6:0] a_row1;
    wire [6:0] a_row2;
    wire [6:0] a_row3;
    wire [6:0] a_row4;
    wire [6:0] a_row5;
    wire [6:0] a_row6;
    wire [6:0] a_row7;

    wire [7:0] b_row0;
    wire [7:0] b_row1;
    wire [7:0] b_row2;
    wire [7:0] b_row3;
    wire [7:0] b_row4;
    wire [7:0] b_row5;
    wire [7:0] b_row6;

    wire [7:0] sum_row0;
    wire [7:0] sum_row1;
    wire [7:0] sum_row2;
    wire [7:0] sum_row3;
    wire [7:0] sum_row4;
    wire [7:0] sum_row5;
    wire [7:0] sum_row6;
    wire [7:0] sum_row7;

    wire [7:0] carry_row0;
    wire [7:0] carry_row1;
    wire [7:0] carry_row2;
    wire [7:0] carry_row3;
    wire [7:0] carry_row4;
    wire [7:0] carry_row5;
    wire [7:0] carry_row6;
    wire [7:0] carry_row7;

    pe u_pe_0_0 (
        .clk       (clk),
        .rst       (rst),
        .a_in      (A[0]),
        .b_in      (B[0]),
        .sum_in    (1'b0),
        .carry_in  (1'b0),
        .a_out     (a_row0[0]),
        .b_out     (b_row0[0]),
        .sum_out   (sum_row0[0]),
        .carry_out (carry_row0[0])
    );

    pe u_pe_0_1 (
        .clk       (clk),
        .rst       (rst),
        .a_in      (a_row0[0]),
        .b_in      (B[1]),
        .sum_in    (1'b0),
        .carry_in  (carry_row0[0]),
        .a_out     (a_row0[1]),
        .b_out     (b_row0[1]),
        .sum_out   (sum_row0[1]),
        .carry_out (carry_row0[1])
    );

    pe u_pe_0_2 (
        .clk       (clk),
        .rst       (rst),
        .a_in      (a_row0[1]),
        .b_in      (B[2]),
        .sum_in    (1'b0),
        .carry_in  (carry_row0[1]),
        .a_out     (a_row0[2]),
        .b_out     (b_row0[2]),
        .sum_out   (sum_row0[2]),
        .carry_out (carry_row0[2])
    );

    pe u_pe_0_3 (
        .clk       (clk),
        .rst       (rst),
        .a_in      (a_row0[2]),
        .b_in      (B[3]),
        .sum_in    (1'b0),
        .carry_in  (carry_row0[2]),
        .a_out     (a_row0[3]),
        .b_out     (b_row0[3]),
        .sum_out   (sum_row0[3]),
        .carry_out (carry_row0[3])
    );

    pe u_pe_0_4 (
        .clk       (clk),
        .rst       (rst),
        .a_in      (a_row0[3]),
        .b_in      (B[4]),
        .sum_in    (1'b0),
        .carry_in  (carry_row0[3]),
        .a_out     (a_row0[4]),
        .b_out     (b_row0[4]),
        .sum_out   (sum_row0[4]),
        .carry_out (carry_row0[4])
    );

    pe u_pe_0_5 (
        .clk       (clk),
        .rst       (rst),
        .a_in      (a_row0[4]),
        .b_in      (B[5]),
        .sum_in    (1'b0),
        .carry_in  (carry_row0[4]),
        .a_out     (a_row0[5]),
        .b_out     (b_row0[5]),
        .sum_out   (sum_row0[5]),
        .carry_out (carry_row0[5])
    );

    pe u_pe_0_6 (
        .clk       (clk),
        .rst       (rst),
        .a_in      (a_row0[5]),
        .b_in      (B[6]),
        .sum_in    (1'b0),
        .carry_in  (carry_row0[5]),
        .a_out     (a_row0[6]),
        .b_out     (b_row0[6]),
        .sum_out   (sum_row0[6]),
        .carry_out (carry_row0[6])
    );

    pe u_pe_0_7 (
        .clk       (clk),
        .rst       (rst),
        .a_in      (a_row0[6]),
        .b_in      (B[7]),
        .sum_in    (1'b0),
        .carry_in  (carry_row0[6]),
        .a_out     (),
        .b_out     (b_row0[7]),
        .sum_out   (sum_row0[7]),
        .carry_out (carry_row0[7])
    );

    pe u_pe_1_0 (
        .clk       (clk),
        .rst       (rst),
        .a_in      (A[1]),
        .b_in      (b_row0[0]),
        .sum_in    (sum_row0[1]),
        .carry_in  (1'b0),
        .a_out     (a_row1[0]),
        .b_out     (b_row1[0]),
        .sum_out   (sum_row1[0]),
        .carry_out (carry_row1[0])
    );

    pe u_pe_1_1 (
        .clk       (clk),
        .rst       (rst),
        .a_in      (a_row1[0]),
        .b_in      (b_row0[1]),
        .sum_in    (sum_row0[2]),
        .carry_in  (carry_row1[0]),
        .a_out     (a_row1[1]),
        .b_out     (b_row1[1]),
        .sum_out   (sum_row1[1]),
        .carry_out (carry_row1[1])
    );

    pe u_pe_1_2 (
        .clk       (clk),
        .rst       (rst),
        .a_in      (a_row1[1]),
        .b_in      (b_row0[2]),
        .sum_in    (sum_row0[3]),
        .carry_in  (carry_row1[1]),
        .a_out     (a_row1[2]),
        .b_out     (b_row1[2]),
        .sum_out   (sum_row1[2]),
        .carry_out (carry_row1[2])
    );

    pe u_pe_1_3 (
        .clk       (clk),
        .rst       (rst),
        .a_in      (a_row1[2]),
        .b_in      (b_row0[3]),
        .sum_in    (sum_row0[4]),
        .carry_in  (carry_row1[2]),
        .a_out     (a_row1[3]),
        .b_out     (b_row1[3]),
        .sum_out   (sum_row1[3]),
        .carry_out (carry_row1[3])
    );

    pe u_pe_1_4 (
        .clk       (clk),
        .rst       (rst),
        .a_in      (a_row1[3]),
        .b_in      (b_row0[4]),
        .sum_in    (sum_row0[5]),
        .carry_in  (carry_row1[3]),
        .a_out     (a_row1[4]),
        .b_out     (b_row1[4]),
        .sum_out   (sum_row1[4]),
        .carry_out (carry_row1[4])
    );

    pe u_pe_1_5 (
        .clk       (clk),
        .rst       (rst),
        .a_in      (a_row1[4]),
        .b_in      (b_row0[5]),
        .sum_in    (sum_row0[6]),
        .carry_in  (carry_row1[4]),
        .a_out     (a_row1[5]),
        .b_out     (b_row1[5]),
        .sum_out   (sum_row1[5]),
        .carry_out (carry_row1[5])
    );

    pe u_pe_1_6 (
        .clk       (clk),
        .rst       (rst),
        .a_in      (a_row1[5]),
        .b_in      (b_row0[6]),
        .sum_in    (sum_row0[7]),
        .carry_in  (carry_row1[5]),
        .a_out     (a_row1[6]),
        .b_out     (b_row1[6]),
        .sum_out   (sum_row1[6]),
        .carry_out (carry_row1[6])
    );

    pe u_pe_1_7 (
        .clk       (clk),
        .rst       (rst),
        .a_in      (a_row1[6]),
        .b_in      (b_row0[7]),
        .sum_in    (carry_row0[7]),
        .carry_in  (carry_row1[6]),
        .a_out     (),
        .b_out     (b_row1[7]),
        .sum_out   (sum_row1[7]),
        .carry_out (carry_row1[7])
    );

    pe u_pe_2_0 (
        .clk       (clk),
        .rst       (rst),
        .a_in      (A[2]),
        .b_in      (b_row1[0]),
        .sum_in    (sum_row1[1]),
        .carry_in  (1'b0),
        .a_out     (a_row2[0]),
        .b_out     (b_row2[0]),
        .sum_out   (sum_row2[0]),
        .carry_out (carry_row2[0])
    );

    pe u_pe_2_1 (
        .clk       (clk),
        .rst       (rst),
        .a_in      (a_row2[0]),
        .b_in      (b_row1[1]),
        .sum_in    (sum_row1[2]),
        .carry_in  (carry_row2[0]),
        .a_out     (a_row2[1]),
        .b_out     (b_row2[1]),
        .sum_out   (sum_row2[1]),
        .carry_out (carry_row2[1])
    );

    pe u_pe_2_2 (
        .clk       (clk),
        .rst       (rst),
        .a_in      (a_row2[1]),
        .b_in      (b_row1[2]),
        .sum_in    (sum_row1[3]),
        .carry_in  (carry_row2[1]),
        .a_out     (a_row2[2]),
        .b_out     (b_row2[2]),
        .sum_out   (sum_row2[2]),
        .carry_out (carry_row2[2])
    );

    pe u_pe_2_3 (
        .clk       (clk),
        .rst       (rst),
        .a_in      (a_row2[2]),
        .b_in      (b_row1[3]),
        .sum_in    (sum_row1[4]),
        .carry_in  (carry_row2[2]),
        .a_out     (a_row2[3]),
        .b_out     (b_row2[3]),
        .sum_out   (sum_row2[3]),
        .carry_out (carry_row2[3])
    );

    pe u_pe_2_4 (
        .clk       (clk),
        .rst       (rst),
        .a_in      (a_row2[3]),
        .b_in      (b_row1[4]),
        .sum_in    (sum_row1[5]),
        .carry_in  (carry_row2[3]),
        .a_out     (a_row2[4]),
        .b_out     (b_row2[4]),
        .sum_out   (sum_row2[4]),
        .carry_out (carry_row2[4])
    );

    pe u_pe_2_5 (
        .clk       (clk),
        .rst       (rst),
        .a_in      (a_row2[4]),
        .b_in      (b_row1[5]),
        .sum_in    (sum_row1[6]),
        .carry_in  (carry_row2[4]),
        .a_out     (a_row2[5]),
        .b_out     (b_row2[5]),
        .sum_out   (sum_row2[5]),
        .carry_out (carry_row2[5])
    );

    pe u_pe_2_6 (
        .clk       (clk),
        .rst       (rst),
        .a_in      (a_row2[5]),
        .b_in      (b_row1[6]),
        .sum_in    (sum_row1[7]),
        .carry_in  (carry_row2[5]),
        .a_out     (a_row2[6]),
        .b_out     (b_row2[6]),
        .sum_out   (sum_row2[6]),
        .carry_out (carry_row2[6])
    );

    pe u_pe_2_7 (
        .clk       (clk),
        .rst       (rst),
        .a_in      (a_row2[6]),
        .b_in      (b_row1[7]),
        .sum_in    (carry_row1[7]),
        .carry_in  (carry_row2[6]),
        .a_out     (),
        .b_out     (b_row2[7]),
        .sum_out   (sum_row2[7]),
        .carry_out (carry_row2[7])
    );

    pe u_pe_3_0 (
        .clk       (clk),
        .rst       (rst),
        .a_in      (A[3]),
        .b_in      (b_row2[0]),
        .sum_in    (sum_row2[1]),
        .carry_in  (1'b0),
        .a_out     (a_row3[0]),
        .b_out     (b_row3[0]),
        .sum_out   (sum_row3[0]),
        .carry_out (carry_row3[0])
    );

    pe u_pe_3_1 (
        .clk       (clk),
        .rst       (rst),
        .a_in      (a_row3[0]),
        .b_in      (b_row2[1]),
        .sum_in    (sum_row2[2]),
        .carry_in  (carry_row3[0]),
        .a_out     (a_row3[1]),
        .b_out     (b_row3[1]),
        .sum_out   (sum_row3[1]),
        .carry_out (carry_row3[1])
    );

    pe u_pe_3_2 (
        .clk       (clk),
        .rst       (rst),
        .a_in      (a_row3[1]),
        .b_in      (b_row2[2]),
        .sum_in    (sum_row2[3]),
        .carry_in  (carry_row3[1]),
        .a_out     (a_row3[2]),
        .b_out     (b_row3[2]),
        .sum_out   (sum_row3[2]),
        .carry_out (carry_row3[2])
    );

    pe u_pe_3_3 (
        .clk       (clk),
        .rst       (rst),
        .a_in      (a_row3[2]),
        .b_in      (b_row2[3]),
        .sum_in    (sum_row2[4]),
        .carry_in  (carry_row3[2]),
        .a_out     (a_row3[3]),
        .b_out     (b_row3[3]),
        .sum_out   (sum_row3[3]),
        .carry_out (carry_row3[3])
    );

    pe u_pe_3_4 (
        .clk       (clk),
        .rst       (rst),
        .a_in      (a_row3[3]),
        .b_in      (b_row2[4]),
        .sum_in    (sum_row2[5]),
        .carry_in  (carry_row3[3]),
        .a_out     (a_row3[4]),
        .b_out     (b_row3[4]),
        .sum_out   (sum_row3[4]),
        .carry_out (carry_row3[4])
    );

    pe u_pe_3_5 (
        .clk       (clk),
        .rst       (rst),
        .a_in      (a_row3[4]),
        .b_in      (b_row2[5]),
        .sum_in    (sum_row2[6]),
        .carry_in  (carry_row3[4]),
        .a_out     (a_row3[5]),
        .b_out     (b_row3[5]),
        .sum_out   (sum_row3[5]),
        .carry_out (carry_row3[5])
    );

    pe u_pe_3_6 (
        .clk       (clk),
        .rst       (rst),
        .a_in      (a_row3[5]),
        .b_in      (b_row2[6]),
        .sum_in    (sum_row2[7]),
        .carry_in  (carry_row3[5]),
        .a_out     (a_row3[6]),
        .b_out     (b_row3[6]),
        .sum_out   (sum_row3[6]),
        .carry_out (carry_row3[6])
    );

    pe u_pe_3_7 (
        .clk       (clk),
        .rst       (rst),
        .a_in      (a_row3[6]),
        .b_in      (b_row2[7]),
        .sum_in    (carry_row2[7]),
        .carry_in  (carry_row3[6]),
        .a_out     (),
        .b_out     (b_row3[7]),
        .sum_out   (sum_row3[7]),
        .carry_out (carry_row3[7])
    );

    pe u_pe_4_0 (
        .clk       (clk),
        .rst       (rst),
        .a_in      (A[4]),
        .b_in      (b_row3[0]),
        .sum_in    (sum_row3[1]),
        .carry_in  (1'b0),
        .a_out     (a_row4[0]),
        .b_out     (b_row4[0]),
        .sum_out   (sum_row4[0]),
        .carry_out (carry_row4[0])
    );

    pe u_pe_4_1 (
        .clk       (clk),
        .rst       (rst),
        .a_in      (a_row4[0]),
        .b_in      (b_row3[1]),
        .sum_in    (sum_row3[2]),
        .carry_in  (carry_row4[0]),
        .a_out     (a_row4[1]),
        .b_out     (b_row4[1]),
        .sum_out   (sum_row4[1]),
        .carry_out (carry_row4[1])
    );

    pe u_pe_4_2 (
        .clk       (clk),
        .rst       (rst),
        .a_in      (a_row4[1]),
        .b_in      (b_row3[2]),
        .sum_in    (sum_row3[3]),
        .carry_in  (carry_row4[1]),
        .a_out     (a_row4[2]),
        .b_out     (b_row4[2]),
        .sum_out   (sum_row4[2]),
        .carry_out (carry_row4[2])
    );

    pe u_pe_4_3 (
        .clk       (clk),
        .rst       (rst),
        .a_in      (a_row4[2]),
        .b_in      (b_row3[3]),
        .sum_in    (sum_row3[4]),
        .carry_in  (carry_row4[2]),
        .a_out     (a_row4[3]),
        .b_out     (b_row4[3]),
        .sum_out   (sum_row4[3]),
        .carry_out (carry_row4[3])
    );

    pe u_pe_4_4 (
        .clk       (clk),
        .rst       (rst),
        .a_in      (a_row4[3]),
        .b_in      (b_row3[4]),
        .sum_in    (sum_row3[5]),
        .carry_in  (carry_row4[3]),
        .a_out     (a_row4[4]),
        .b_out     (b_row4[4]),
        .sum_out   (sum_row4[4]),
        .carry_out (carry_row4[4])
    );

    pe u_pe_4_5 (
        .clk       (clk),
        .rst       (rst),
        .a_in      (a_row4[4]),
        .b_in      (b_row3[5]),
        .sum_in    (sum_row3[6]),
        .carry_in  (carry_row4[4]),
        .a_out     (a_row4[5]),
        .b_out     (b_row4[5]),
        .sum_out   (sum_row4[5]),
        .carry_out (carry_row4[5])
    );

    pe u_pe_4_6 (
        .clk       (clk),
        .rst       (rst),
        .a_in      (a_row4[5]),
        .b_in      (b_row3[6]),
        .sum_in    (sum_row3[7]),
        .carry_in  (carry_row4[5]),
        .a_out     (a_row4[6]),
        .b_out     (b_row4[6]),
        .sum_out   (sum_row4[6]),
        .carry_out (carry_row4[6])
    );

    pe u_pe_4_7 (
        .clk       (clk),
        .rst       (rst),
        .a_in      (a_row4[6]),
        .b_in      (b_row3[7]),
        .sum_in    (carry_row3[7]),
        .carry_in  (carry_row4[6]),
        .a_out     (),
        .b_out     (b_row4[7]),
        .sum_out   (sum_row4[7]),
        .carry_out (carry_row4[7])
    );

    pe u_pe_5_0 (
        .clk       (clk),
        .rst       (rst),
        .a_in      (A[5]),
        .b_in      (b_row4[0]),
        .sum_in    (sum_row4[1]),
        .carry_in  (1'b0),
        .a_out     (a_row5[0]),
        .b_out     (b_row5[0]),
        .sum_out   (sum_row5[0]),
        .carry_out (carry_row5[0])
    );

    pe u_pe_5_1 (
        .clk       (clk),
        .rst       (rst),
        .a_in      (a_row5[0]),
        .b_in      (b_row4[1]),
        .sum_in    (sum_row4[2]),
        .carry_in  (carry_row5[0]),
        .a_out     (a_row5[1]),
        .b_out     (b_row5[1]),
        .sum_out   (sum_row5[1]),
        .carry_out (carry_row5[1])
    );

    pe u_pe_5_2 (
        .clk       (clk),
        .rst       (rst),
        .a_in      (a_row5[1]),
        .b_in      (b_row4[2]),
        .sum_in    (sum_row4[3]),
        .carry_in  (carry_row5[1]),
        .a_out     (a_row5[2]),
        .b_out     (b_row5[2]),
        .sum_out   (sum_row5[2]),
        .carry_out (carry_row5[2])
    );

    pe u_pe_5_3 (
        .clk       (clk),
        .rst       (rst),
        .a_in      (a_row5[2]),
        .b_in      (b_row4[3]),
        .sum_in    (sum_row4[4]),
        .carry_in  (carry_row5[2]),
        .a_out     (a_row5[3]),
        .b_out     (b_row5[3]),
        .sum_out   (sum_row5[3]),
        .carry_out (carry_row5[3])
    );

    pe u_pe_5_4 (
        .clk       (clk),
        .rst       (rst),
        .a_in      (a_row5[3]),
        .b_in      (b_row4[4]),
        .sum_in    (sum_row4[5]),
        .carry_in  (carry_row5[3]),
        .a_out     (a_row5[4]),
        .b_out     (b_row5[4]),
        .sum_out   (sum_row5[4]),
        .carry_out (carry_row5[4])
    );

    pe u_pe_5_5 (
        .clk       (clk),
        .rst       (rst),
        .a_in      (a_row5[4]),
        .b_in      (b_row4[5]),
        .sum_in    (sum_row4[6]),
        .carry_in  (carry_row5[4]),
        .a_out     (a_row5[5]),
        .b_out     (b_row5[5]),
        .sum_out   (sum_row5[5]),
        .carry_out (carry_row5[5])
    );

    pe u_pe_5_6 (
        .clk       (clk),
        .rst       (rst),
        .a_in      (a_row5[5]),
        .b_in      (b_row4[6]),
        .sum_in    (sum_row4[7]),
        .carry_in  (carry_row5[5]),
        .a_out     (a_row5[6]),
        .b_out     (b_row5[6]),
        .sum_out   (sum_row5[6]),
        .carry_out (carry_row5[6])
    );

    pe u_pe_5_7 (
        .clk       (clk),
        .rst       (rst),
        .a_in      (a_row5[6]),
        .b_in      (b_row4[7]),
        .sum_in    (carry_row4[7]),
        .carry_in  (carry_row5[6]),
        .a_out     (),
        .b_out     (b_row5[7]),
        .sum_out   (sum_row5[7]),
        .carry_out (carry_row5[7])
    );

    pe u_pe_6_0 (
        .clk       (clk),
        .rst       (rst),
        .a_in      (A[6]),
        .b_in      (b_row5[0]),
        .sum_in    (sum_row5[1]),
        .carry_in  (1'b0),
        .a_out     (a_row6[0]),
        .b_out     (b_row6[0]),
        .sum_out   (sum_row6[0]),
        .carry_out (carry_row6[0])
    );

    pe u_pe_6_1 (
        .clk       (clk),
        .rst       (rst),
        .a_in      (a_row6[0]),
        .b_in      (b_row5[1]),
        .sum_in    (sum_row5[2]),
        .carry_in  (carry_row6[0]),
        .a_out     (a_row6[1]),
        .b_out     (b_row6[1]),
        .sum_out   (sum_row6[1]),
        .carry_out (carry_row6[1])
    );

    pe u_pe_6_2 (
        .clk       (clk),
        .rst       (rst),
        .a_in      (a_row6[1]),
        .b_in      (b_row5[2]),
        .sum_in    (sum_row5[3]),
        .carry_in  (carry_row6[1]),
        .a_out     (a_row6[2]),
        .b_out     (b_row6[2]),
        .sum_out   (sum_row6[2]),
        .carry_out (carry_row6[2])
    );

    pe u_pe_6_3 (
        .clk       (clk),
        .rst       (rst),
        .a_in      (a_row6[2]),
        .b_in      (b_row5[3]),
        .sum_in    (sum_row5[4]),
        .carry_in  (carry_row6[2]),
        .a_out     (a_row6[3]),
        .b_out     (b_row6[3]),
        .sum_out   (sum_row6[3]),
        .carry_out (carry_row6[3])
    );

    pe u_pe_6_4 (
        .clk       (clk),
        .rst       (rst),
        .a_in      (a_row6[3]),
        .b_in      (b_row5[4]),
        .sum_in    (sum_row5[5]),
        .carry_in  (carry_row6[3]),
        .a_out     (a_row6[4]),
        .b_out     (b_row6[4]),
        .sum_out   (sum_row6[4]),
        .carry_out (carry_row6[4])
    );

    pe u_pe_6_5 (
        .clk       (clk),
        .rst       (rst),
        .a_in      (a_row6[4]),
        .b_in      (b_row5[5]),
        .sum_in    (sum_row5[6]),
        .carry_in  (carry_row6[4]),
        .a_out     (a_row6[5]),
        .b_out     (b_row6[5]),
        .sum_out   (sum_row6[5]),
        .carry_out (carry_row6[5])
    );

    pe u_pe_6_6 (
        .clk       (clk),
        .rst       (rst),
        .a_in      (a_row6[5]),
        .b_in      (b_row5[6]),
        .sum_in    (sum_row5[7]),
        .carry_in  (carry_row6[5]),
        .a_out     (a_row6[6]),
        .b_out     (b_row6[6]),
        .sum_out   (sum_row6[6]),
        .carry_out (carry_row6[6])
    );

    pe u_pe_6_7 (
        .clk       (clk),
        .rst       (rst),
        .a_in      (a_row6[6]),
        .b_in      (b_row5[7]),
        .sum_in    (carry_row5[7]),
        .carry_in  (carry_row6[6]),
        .a_out     (),
        .b_out     (b_row6[7]),
        .sum_out   (sum_row6[7]),
        .carry_out (carry_row6[7])
    );

    pe u_pe_7_0 (
        .clk       (clk),
        .rst       (rst),
        .a_in      (A[7]),
        .b_in      (b_row6[0]),
        .sum_in    (sum_row6[1]),
        .carry_in  (1'b0),
        .a_out     (a_row7[0]),
        .b_out     (),
        .sum_out   (sum_row7[0]),
        .carry_out (carry_row7[0])
    );

    pe u_pe_7_1 (
        .clk       (clk),
        .rst       (rst),
        .a_in      (a_row7[0]),
        .b_in      (b_row6[1]),
        .sum_in    (sum_row6[2]),
        .carry_in  (carry_row7[0]),
        .a_out     (a_row7[1]),
        .b_out     (),
        .sum_out   (sum_row7[1]),
        .carry_out (carry_row7[1])
    );

    pe u_pe_7_2 (
        .clk       (clk),
        .rst       (rst),
        .a_in      (a_row7[1]),
        .b_in      (b_row6[2]),
        .sum_in    (sum_row6[3]),
        .carry_in  (carry_row7[1]),
        .a_out     (a_row7[2]),
        .b_out     (),
        .sum_out   (sum_row7[2]),
        .carry_out (carry_row7[2])
    );

    pe u_pe_7_3 (
        .clk       (clk),
        .rst       (rst),
        .a_in      (a_row7[2]),
        .b_in      (b_row6[3]),
        .sum_in    (sum_row6[4]),
        .carry_in  (carry_row7[2]),
        .a_out     (a_row7[3]),
        .b_out     (),
        .sum_out   (sum_row7[3]),
        .carry_out (carry_row7[3])
    );

    pe u_pe_7_4 (
        .clk       (clk),
        .rst       (rst),
        .a_in      (a_row7[3]),
        .b_in      (b_row6[4]),
        .sum_in    (sum_row6[5]),
        .carry_in  (carry_row7[3]),
        .a_out     (a_row7[4]),
        .b_out     (),
        .sum_out   (sum_row7[4]),
        .carry_out (carry_row7[4])
    );

    pe u_pe_7_5 (
        .clk       (clk),
        .rst       (rst),
        .a_in      (a_row7[4]),
        .b_in      (b_row6[5]),
        .sum_in    (sum_row6[6]),
        .carry_in  (carry_row7[4]),
        .a_out     (a_row7[5]),
        .b_out     (),
        .sum_out   (sum_row7[5]),
        .carry_out (carry_row7[5])
    );

    pe u_pe_7_6 (
        .clk       (clk),
        .rst       (rst),
        .a_in      (a_row7[5]),
        .b_in      (b_row6[6]),
        .sum_in    (sum_row6[7]),
        .carry_in  (carry_row7[5]),
        .a_out     (a_row7[6]),
        .b_out     (),
        .sum_out   (sum_row7[6]),
        .carry_out (carry_row7[6])
    );

    pe u_pe_7_7 (
        .clk       (clk),
        .rst       (rst),
        .a_in      (a_row7[6]),
        .b_in      (b_row6[7]),
        .sum_in    (carry_row6[7]),
        .carry_in  (carry_row7[6]),
        .a_out     (),
        .b_out     (),
        .sum_out   (sum_row7[7]),
        .carry_out (carry_row7[7])
    );

    assign Product[0]  = sum_row0[0];
    assign Product[1]  = sum_row1[0];
    assign Product[2]  = sum_row2[0];
    assign Product[3]  = sum_row3[0];
    assign Product[4]  = sum_row4[0];
    assign Product[5]  = sum_row5[0];
    assign Product[6]  = sum_row6[0];
    assign Product[7]  = sum_row7[0];
    assign Product[8]  = sum_row7[1];
    assign Product[9]  = sum_row7[2];
    assign Product[10] = sum_row7[3];
    assign Product[11] = sum_row7[4];
    assign Product[12] = sum_row7[5];
    assign Product[13] = sum_row7[6];
    assign Product[14] = sum_row7[7];
    assign Product[15] = carry_row7[7];

endmodule

`default_nettype wire
