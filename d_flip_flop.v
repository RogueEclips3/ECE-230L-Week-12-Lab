module d_flip_flop(
    input D, clock, reset,
    output reg Q,
    output NotQ
);

    initial begin
        Q <= 1'b0;
    end

    always @(posedge clock) begin
        if (reset)
            Q <= 1'b0;
        else
            Q <= D;
    end

    assign NotQ = ~Q;

endmodule