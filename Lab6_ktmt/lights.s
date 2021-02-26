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
			movia	r11,	FLAG
			addi		r18, r0, 1
MAIN_LOOP:
			ldbio   	r12, 0(r11)
			bne		r12, r0, MAIN_LOOP
			LOOP:		ldbio   	r12, 0(r11)
					beq		r12, r0, LOOP
    			stwio   	r18, 0(r10)
			slli		r18, r18, 4
              br	MAIN_LOOP
.end
