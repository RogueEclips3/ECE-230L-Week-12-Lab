module ripple_counter(
    input clock, reset,
    output [2:0] out
);

    t_flip_flop ripple_1(
        .T(~reset),
        .reset(reset),
        .clock(clock),
        .Q(out[0])
    );

    t_flip_flop ripple_2(
        .T(~reset),
        .reset(reset),
        .clock(ripple_1.Q),
        .Q(out[1])
    );

    t_flip_flop ripple_3(
        .T(~reset),
        .reset(reset),
        .clock(ripple_2.Q),
        .Q(out[2])
    );

endmodule