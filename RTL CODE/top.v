`timescale 1ns / 1ps
`default_nettype none

module top (
    input  wire        clk,
    input  wire        rst,
    input  wire [7:0]  A,
    input  wire [7:0]  B,
    output wire [15:0] Product
);

    systolic_array u_systolic_array (
        .clk     (clk),
        .rst     (rst),
        .A       (A),
        .B       (B),
        .Product (Product)
    );

endmodule

`default_nettype wire
