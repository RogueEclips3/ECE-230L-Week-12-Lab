module top(
    input btnU, btnC,
    output [6:0] led
);

    // Ripple counter

    ripple_counter ripple_counter_inst(
        .clock(btnC),
        .reset(btnU),
        .out(led[2:0])
    );

    // Modulo Divider

    modulo_divider modulo_divider_inst(
        .clock(btnC),
        .reset(btnU),
        .out(led[6:3])
    );

endmodule