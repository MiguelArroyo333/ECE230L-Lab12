module modulo_counter(
    input clk,
    input rst,
    output [2:0] state,
    output out
);

    wire [2:0] next_count;
    reg [2:0] count;
    wire reset_count;
    reg output_reg;

    // Check if count equals 6 (binary: 110)
    assign reset_count = (count == 3'b110);

    // 3-bit adder chain to increment counter
    wire cout0, cout1;
    wire [2:0] adder_out;
    
    // Add 1 to current count
    full_adder fa0(
        .a(count[0]),
        .b(1'b1),        // Adding 1
        .cin(1'b0),
        .sum(adder_out[0]),
        .cout(cout0)
    );

    full_adder fa1(
        .a(count[1]),
        .b(1'b0),
        .cin(cout0),
        .sum(adder_out[1]),
        .cout(cout1)
    );

    full_adder fa2(
        .a(count[2]),
        .b(1'b0),
        .cin(cout1),
        .sum(adder_out[2]),
        .cout()          // Unused carry out
    );

    // Mux to select between incremented count and reset (0)
    assign next_count = reset_count ? 3'b000 : adder_out;

    // Counter logic
    always @(posedge clk or posedge rst) begin
        if (rst) begin
            count <= 3'b000;
            output_reg <= 1'b0;
        end else begin
            // Check if count equals 6 *before* updating the count register
            if (count == 3'b101) begin
                output_reg <= ~output_reg; // Toggle output in sync with the reset condition
                count <= 3'b000;          // Explicitly handle the reset here
            end else begin
                count <= next_count;      // Otherwise, increment the counter
            end
        end
    end

    // Expose counter state and output
    assign state = count;
    assign out = output_reg;

endmodule
