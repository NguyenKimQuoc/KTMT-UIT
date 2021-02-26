#Nguyen Kim Quoc	18521310
		.data
A:	.word	0:100
	.text
main:
	la	$s3, A
	li	$v0, 5
	syscall
	move 	$a0, $v0	#size cua mang A
	li	$a1, 0	#khai bao index
LOOP:
	slt	$t2, $a1, $a0
	beq	$t2, $zero, next
	sll	$t3, $a1, 2
	add	$t3, $t3, $s3
	li	$v0, 5
	syscall
	sw	$v0, 0($t3)
	addi	$a1, $a1, 1
	J 	LOOP
next:
	slt	$t0, $s0, $s1	#	if(i<j)
	beq	$t0, $zero, else	
	sll	$t1, $s0, 2
	add	$t1, $t1, $s3
	sw	$s0, 0($t1)	#A[i] = i
	J	exit
else:
	sll	$t1, $s0, 2
	add	$t1, $t1, $s3
	sw	$s1, 0($t1)	#A[i] = j
exit:
	li	$v0, 10
	syscall