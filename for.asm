#Nguyen Kim Quoc	18521310
#	for
		.data
A:	.word	0:20
B:	.word	0:20
chara:	.asciiz	"nhap a\n"
charb:	.asciiz	"nhap b\n"
		.text
main:
	la	$s1, A
	la	$s2, B
	li	$s0, 2
	li	$v0, 4
	la	$a0, chara
	syscall
	li	$v0, 5
	syscall
	move 	$a1, $v0
	li	$s3, 0	#khai bao index
LOOP:
	slt	$t2, $s3, $a1
	beq	$t2, $zero, next
	sll	$t3, $s3, 2
	add	$t3, $t3, $s1
	li	$v0, 5
	syscall
	sw	$v0, 0($t3)
	addi	$s3, $s3, 1
	J 	LOOP
next:	li	$s3, 0
	li	$v0, 4
	la	$a0, charb
	syscall
	li 	$v0, 5
	syscall
	move	$a1, $v0
LOOP1:
	slt	$t2, $s3, $a1
	beq	$t2, $zero, next1
	sll	$t3, $s3, 2
	add	$t3, $t3, $s2
	li	$v0, 5
	syscall
	sw	$v0, 0($t3)
	addi	$s3, $s3, 1
	J 	LOOP1	
next1:
	slti	$t2, $s0, 10
	beq	$t2, $zero, exit
	addi	$a2, $s0, -2
	sll	$a2, $a2, 2
	add	$a2, $a2, $s1
	lw	$a2, 0($a2)	#tai len A[i-2]
	sll	$a2, $a2, 2
	add	$a2, $a2, $s2
	lw	$a2, 0($a2)	#tai len B[A[i-2]]
	sll	$a3, $s0, 2
	add	$a3, $a3, $s1
	sw	$a2, 0($a3)
	add	$s0, $s0,1
	J 	next1
exit:
	li	$v0, 10
	syscall
