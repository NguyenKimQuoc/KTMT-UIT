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
			movia   r3,	FLAG
			addi 	r2, r0, 1
			addi 	r5, r0, 0
MAIN_LOOP:
			ldwio		r4, 0(r3)
			beq		r4, r2, MAIN_LOOP:

			IF:
				ldwio		r4, 0(r3)
				beq		r4, r5, IF
			
    			ldwio   	r16, 0(r8)
    			stwio   	r16, 0(r9)
    			add		r17, r17, r16
    			stwio   	r17, 0(r10)
              br	MAIN_LOOP
.end
