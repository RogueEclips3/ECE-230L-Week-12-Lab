module t_flip_flop(
    input T, clock, reset,
    output Q, NotQ
);

    jk_flip_flop jk_flip_flop_inst(
        .J(T),
        .K(T),
        .clock(clock),
        .reset(reset),
        .Q(Q),
        .NotQ(NotQ)
    );

endmodule