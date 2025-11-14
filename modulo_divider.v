module modulo_divider(
    input clock, reset,
    output [3:0] out
);

    full_adder adder_1(
        .A(modulo_reg_1.Q),
        .B(1'b1),
        .Cin(1'b0)
    );

    d_flip_flop modulo_reg_1(
        .D(adder_1.sum),
        .clock(clock),
        .reset(reg_reset),
        .Q(out[0])
    );

    full_adder adder_2(
        .A(modulo_reg_2.Q),
        .B(1'b0),
        .Cin(adder_1.Cout)
    );

    d_flip_flop modulo_reg_2(
        .D(adder_2.sum),
        .clock(clock),
        .reset(reg_reset),
        .Q(out[1])
    );

    full_adder adder_3(
        .A(modulo_reg_3.Q),
        .B(1'b0),
        .Cin(adder_2.Cout)
    );

    d_flip_flop modulo_reg_3(
        .D(adder_3.sum),
        .clock(clock),
        .reset(reg_reset),
        .Q(out[2])
    );

    // Comparator

    wire equals_6;
    assign equals_6 = {modulo_reg_3.Q, modulo_reg_2.Q, modulo_reg_1.Q} == 3'b101;
    wire reg_reset;
    assign reg_reset = reset | equals_6;

    t_flip_flop modulo_output(
        .T(equals_6),
        .clock(clock),
        .reset(reset),
        .Q(out[3])
    );

endmodule