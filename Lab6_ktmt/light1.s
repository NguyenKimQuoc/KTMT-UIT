.include "nios_macros.s"		
.equ	NEW_NUMBER,	0x00011030
.equ	GREEN_LEDS,	0x00011020
.equ	RED_LEDS  ,	0x00011010
.equ	FLAG,		0x00011000	
.text
.global _start
_start:
			add		r17, r0, r0	
			movia	r8,  	NEW_NUMBER	
			movia	r9,  	GREEN_LEDS	
			movia	r10, 	RED_LEDS	
			movia	r11, 	FLAG		
			addi	r7, r0, 1
MAIN_LOOP:
			ldwio		r15, 0(r11)	
			beq		r15, r0, MAIN_LOOP	
			beq		r15, r7, Test
		 
Test:			ldwio		r15, 0(r11)	
			beq		r15, r7, Test	
			ldwio   	r16, 0(r8)	
    			stwio   	r16, 0(r9)	
    			add	r17, r17, r16	
    			stwio   	r17, 0(r10)	
              		br	MAIN_LOOP		
.end