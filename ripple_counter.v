module ripple_counter(
    input clk,
    input rst,
    output [2:0] q
);

    // Three T-flip-flops cascaded
    // T input is always 1 (toggle on every clock)
    tff stage0(
        .clk(clk),
        .rst(rst),
        .t(1'b1),
        .q(q[0])
    );

    tff stage1(
        .clk(q[0]),  // Clocked by previous stage
        .rst(rst),
        .t(1'b1),
        .q(q[1])
    );

    tff stage2(
        .clk(q[1]),  // Clocked by previous stage
        .rst(rst),
        .t(1'b1),
        .q(q[2])
    );

endmodule