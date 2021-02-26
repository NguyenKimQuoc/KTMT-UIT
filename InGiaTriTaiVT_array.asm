#Nguyen Kim Quoc	18521310
# in gia tri tai vi tri trong mang
		.data
A:	.word	0:20
		.text
main:
	la	$s0, A
	li	$v0, 5	#nhap size mang
	syscall
	move 	$s1, $v0
	li	$s3, 0	#khoi tao index
LOOP:	#nhap mang
	slt	$t0, $s3, $s1
	beq	$t0, $zero, next
	sll	$t3, $s3, 2
	add	$t3, $t3, $s0
	li	$v0, 5
	syscall
	sw	$v0, 0($t3)
	addi	$s3, $s3, 1
	J	LOOP
next:
	li	$v0, 5	#nhap vi tri cua phan tu
	syscall	
	sll	$v0, $v0, 2
	add	$v0, $v0, $s0
	lw	$a0, 0($v0)
	li	$v0, 1
	syscall	#in ra gia tri tai vi tri do
	li	$v0, 10
	syscall
