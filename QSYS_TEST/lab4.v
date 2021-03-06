module lab4(CLOCK_50, KEY, SW, LEDR);
input CLOCK_50;
input [0:0] KEY;
input [7:0] SW;
output [7:0] LEDR;

lab4_qsys u0 (
        .clk_clk                        (CLOCK_50),                        //                     clk.clk
        .reset_reset_n                  (KEY),                  //                   reset.reset_n
        .sw_external_connection_export  (SW),  //  sw_external_connection.export
        .led_external_connection_export (LEDR)  // led_external_connection.export
    );
endmodule