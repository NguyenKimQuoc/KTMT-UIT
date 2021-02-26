//module Lab6_ktmt (CLOCK_50, SW, KEY, LEDR, LEDG);
//input CLOCK_50;
//input [7:0] SW;
//input [0:0] KEY;
//output [7:0] LEDG;
//output [15:0] LEDR;
//	Lab6_qsys u0 (
//        .clk_clk                               (CLOCK_50),                               //                            clk.clk
//        .reset_reset_n                         (KEY),                         //                          reset.reset_n
//        .new_number_external_connection_export (SW), // new_number_external_connection.export
//        .green_led_external_connection_export  (LEDG),  //  green_led_external_connection.export
//        .red_led_external_connection_export    (LEDR)     //    red_led_external_connection.export
//    );
//endmodule
module Lab6_ktmt (CLOCK_50,KEY,SW,LEDR,LEDG,HEX0,HEX1,HEX2,HEX3);
// Inputs
input		CLOCK_50;
input		[3:0]	KEY;
input		[17:0]	SW;
// Outputs
output		[17:0]	LEDR;
output		[7:0]	LEDG;
output		[6:0]	HEX0;
output		[6:0]	HEX1;
output		[6:0]	HEX2;
output		[6:0]	HEX3;
wire		[15:0]	SUM;
assign LEDR[15:0] = SUM;
//nios_system the_nios_system  (
//	.clk (CLOCK_50),
//	.reset_n (KEY[0]),
//	.in_port_to_the_new_number	(SW[7:0]),
//	.in_port_to_the_Flag (KEY[1]),
//	.out_port_from_the_green_led (LEDG[7:0]),
//	.out_port_from_the_red_led (SUM)
//);
    Lab6_qsys u0 (
        .clk_clk                               (CLOCK_50),                               //                            clk.clk
        .reset_reset_n                         (KEY[0]),                         //                          reset.reset_n
        .new_number_external_connection_export (SW[7:0]), // new_number_external_connection.export
        .green_led_external_connection_export  (LEDG[7:0]),  //  green_led_external_connection.export
        .red_led_external_connection_export    (SUM),    //    red_led_external_connection.export
        .flag_external_connection_export       (KEY[1])        //       flag_external_connection.export
    );
Hexadecimal_To_Seven_Segment Digit0 (
		.hex_number	(SUM[3:0]),
	   .seven_seg_display	(HEX0)
);
Hexadecimal_To_Seven_Segment Digit1 (
		.hex_number	(SUM[7:4]),
		.seven_seg_display	(HEX1)
);
Hexadecimal_To_Seven_Segment Digit2 (
	             .hex_number          (SUM[11:8]),
                .seven_seg_display (HEX2)
);
Hexadecimal_To_Seven_Segment Digit3 (
	            .hex_number           (SUM[15:12]),
	            .seven_seg_display  (HEX3)
);
      endmodule

    module Hexadecimal_To_Seven_Segment (hex_number, seven_seg_display);
// Inputs
input		[3:0]	hex_number;
// Outputs
output		[6:0]	seven_seg_display;
assign seven_seg_display =
		({7{(hex_number == 4'h0)}} & 7'b1000000) |
		({7{(hex_number == 4'h1)}} & 7'b1111001) |
		({7{(hex_number == 4'h2)}} & 7'b0100100) |
		({7{(hex_number == 4'h3)}} & 7'b0110000) |
		({7{(hex_number == 4'h4)}} & 7'b0011001) |
		({7{(hex_number == 4'h5)}} & 7'b0010010) |
		({7{(hex_number == 4'h6)}} & 7'b0000010) |
		({7{(hex_number == 4'h7)}} & 7'b1111000) |
		({7{(hex_number == 4'h8)}} & 7'b0000000) |
		({7{(hex_number == 4'h9)}} & 7'b0010000) |
		({7{(hex_number == 4'hA)}} & 7'b0001000) |
		({7{(hex_number == 4'hB)}} & 7'b0000011) |
		({7{(hex_number == 4'hC)}} & 7'b1000110) |
		({7{(hex_number == 4'hD)}} & 7'b0100001) |
		({7{(hex_number == 4'hE)}} & 7'b0000110) |
		({7{(hex_number == 4'hF)}} & 7'b0001110); 
endmodule
