# Lab 11 - Counters and Dividers

By Joshua Richmond and Dylan Duljkovic

## Lab Summary

In this lab, we implemented two types of counters in Verilog: a modulo divider and a ripple counter. The modulo divider uses a series of D flip-flops to store a value and increments said value every clock cycle using full adders. Once the stored value reaches a specified amount, its output is inverted and the stored value is set to 0. The ripple counter is much simpler - it is simply a bunch of T flip-flops in parallel. Each T flip-flop in the line divides the frequency of the counter by two.

## Lab Questions

### 1 - Why does the Modulo Counter actually divide clocks by 2 \* Count?

Frequency is taken to be the amount of time between the positive edge of one cycle and the positive edge of the next cycle. The modulo divider inverts the output every time it reaches its specified count, and as such it must reach its specified count _twice_ for it to count as a full cycle. For example, if a modulo divider has a count of 2,000,000, it must count to 2,000,000 twice to fully cycle its output, resulting in a total cycle length of 4,000,000.

### 2 - Why does the ring counter's output go to all 1s on the first clock cycle?

This is because all of the T flip-flops are in series. On the very first cycle, the first T flip-flop is flipped from a 0 to a 1. The output of the first T flip-flop then travels to the next T flip-flop, which also flips from a 0 to a 1, and so on.

### 3 - What width of ring counter would you use to get to an output of ~1KHz?

That entirely depends on the frequency of the clock that the circuit uses. In general, each T flip-flop in the counter divides the frequency by two. Turning that into an equation, we get that $f_c/2^n=f_t$, where $f_c$ is the frequency of the clock, $n$ is the length of the counter, and $f_t$ is the target frequency. We can rewrite this to get $n=\log_2(f_c/f_t)$. For example, if we wanted to find the width of a ripple counter that would result in an output of 1KHz with a clock frequency of 2MHz, we would get $\log_2(2,000,000/1,000)\approx10.96$. This will pretty rarely result in a precise integer value of $n$, so picking the closest integer (in this case 11) is probably the best choice.
