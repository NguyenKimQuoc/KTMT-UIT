.include "nios_macros.s"
.text
.equ TEST_NUM, 0xFFFFFFFF
.equ FLAT, 0x01
.global _start
_start:
movia r7, TEST_NUM
movia r5, FLAT
mov r4, r7
STRING_COUNTER:
	mov r2, r0
STRING_COUNTER_LOOP:
	beq r4, r0, END_STRING_COUNTER
	and r1, r4, r5
	beq r1, r0, CONTINUE_LOOP
	addi r2, r2, 1
	srli r4, r4, 1
	br STRING_COUNTER_LOOP
CONTINUE_LOOP:
	srli r4, r4, 1
	br STRING_COUNTER_LOOP
END_STRING_COUNTER:
	mov r16, r2
	add r17, r16, r0
	addi r18, r0, 5
LOOP_tru6:
	addi r24, r0, 6
	blt r17, r24, CN 
	addi r17, r17, -6
	bgt r17, r18, LOOP_tru6
CN:
	addi r19, r0, 1
	addi r20, r0, 2
	addi r21, r0, 3
	addi r22, r0, 4
	addi r23, r0, 5
	beq r17, r19, mot
	beq r17, r20, hai
	beq r17, r21, ba
	beq r17, r22, hai
	beq r17, r23, mot

mot:
	add r17, r0, r19
	br END
hai:
	add r17, r0, r20
	br END
ba:
	add r17, r0, r21
	br END
END:
	br END
	.end
