`timescale 1ns / 1ps
`default_nettype none

module pe (
    input  wire clk,
    input  wire rst,
    input  wire a_in,
    input  wire b_in,
    input  wire sum_in,
    input  wire carry_in,
    output reg  a_out,
    output reg  b_out,
    output reg  sum_out,
    output reg  carry_out
);

    wire       partial_product;
    wire [1:0] adder_result;

    assign partial_product = a_in & b_in;
    assign adder_result    = {1'b0, sum_in} +
                             {1'b0, partial_product} +
                             {1'b0, carry_in};

    always @(posedge clk) begin
        if (rst) begin
            a_out     <= 1'b0;
            b_out     <= 1'b0;
            sum_out   <= 1'b0;
            carry_out <= 1'b0;
        end else begin
            a_out     <= a_in;
            b_out     <= b_in;
            sum_out   <= adder_result[0];
            carry_out <= adder_result[1];
        end
    end

endmodule

`default_nettype wire
