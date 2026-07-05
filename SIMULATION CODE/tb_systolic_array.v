`timescale 1ns / 1ps
`default_nettype none

module tb_systolic_array;

    localparam integer CLK_PERIOD_NS   = 10;
    localparam integer PIPELINE_LATENCY = 22;

    reg         clk;
    reg         rst;
    reg  [7:0]  A;
    reg  [7:0]  B;
    wire [15:0] Product;

    top dut (
        .clk     (clk),
        .rst     (rst),
        .A       (A),
        .B       (B),
        .Product (Product)
    );

    always #(CLK_PERIOD_NS / 2) clk = ~clk;

    task run_test;
        input [7:0] test_a;
        input [7:0] test_b;
        reg [15:0] expected;
        begin
            A = test_a;
            B = test_b;
            expected = test_a * test_b;

            repeat (PIPELINE_LATENCY) begin
                @(posedge clk);
            end

            #1;
            if (Product === expected) begin
                $display("PASS: A=%0d B=%0d Product=%0d Expected=%0d",
                         test_a, test_b, Product, expected);
            end else begin
                $display("FAIL: A=%0d B=%0d Product=%0d Expected=%0d",
                         test_a, test_b, Product, expected);
                $finish;
            end

            @(negedge clk);
        end
    endtask

    initial begin
        clk = 1'b0;
        rst = 1'b1;
        A   = 8'd0;
        B   = 8'd0;

        repeat (4) begin
            @(posedge clk);
        end

        rst = 1'b0;
        @(negedge clk);

        run_test(8'd5,   8'd3);
        run_test(8'd10,  8'd7);
        run_test(8'd15,  8'd15);
        run_test(8'd100, 8'd20);
        run_test(8'd255, 8'd255);
        run_test(8'd0,   8'd255);
        run_test(8'd255, 8'd0);
        run_test(8'd1,   8'd255);
        run_test(8'd170, 8'd85);

        $display("PASS: all test vectors completed successfully");
        $finish;
    end

endmodule

`default_nettype wire
