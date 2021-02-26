#in do dai chuoi
	.data
chuoi:	.space	20
size:	.word	20
char:	.ascii	"\n"
	.text
main:
	la	$a0, chuoi
	lw	$a1, size
	li	$v0, 8
	syscall	#nhap chuoi
	#li	$a2, 0
	lb	$t0, char
	move	$t1, $a0
	li	$s2, 0	# i = 0
LOOP:	add	$t2, $s2, $a0
	lb	$t2, 0($t2)
	beq	$t2, $t0, next	# neu khong phai la dau \n thi i++
	add	$s2, $s2, 1
	J	LOOP
next:
	li	$v0, 1
	move 	$a0, $s2
	syscall		#in ra so y tu
	li	$v0, 10
	syscall
