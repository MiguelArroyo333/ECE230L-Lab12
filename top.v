
module top(
    input btnC,           // Clock input
    input btnU,           // Reset input
    output [6:0] led      // LED outputs
);

    wire [2:0] rc_state;  // Ripple counter state
    wire [2:0] mc_state;  // Modulo counter state
    wire mc_out;          // Modulo counter output

    // Instantiate the ripple counter (divides by 8)
    ripple_counter rc(
        .clk(btnC),
        .rst(btnU),
        .q(rc_state)
    );

    // Instantiate the modulo counter (divides by 12, counts to 6)
    modulo_counter mc(
        .clk(btnC),
        .rst(btnU),
        .state(mc_state),
        .out(mc_out)
    );

    // Assign outputs to LEDs
    assign led[2:0] = rc_state;  // Ripple counter stages
    assign led[5:3] = mc_state;  // Modulo counter state
    assign led[6] = mc_out;      // Modulo counter output

endmodule
