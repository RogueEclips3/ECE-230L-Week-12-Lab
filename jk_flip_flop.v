module jk_flip_flop(
    input J, K, clock, reset,
    output Q, NotQ
);

    assign D = (J && ~Q) || (~K && Q);

    d_flip_flop d_flip_flop_inst(
        .D(D),
        .clock(clock),
        .reset(reset),
        .Q(Q),
        .NotQ(NotQ)
    );


endmodule