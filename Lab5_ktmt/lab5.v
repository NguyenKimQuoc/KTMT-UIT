module lab5(CLOCK_50, KEY);
input CLOCK_50;
input [0:0] KEY;
lab5_qys u0 (
        .clk_clk       (CLOCK_50),       //   clk.clk
        .reset_reset_n (KEY)  // reset.reset_n
    );
endmodule