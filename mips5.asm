#Nguyen Kim Quoc	18521310
		.data
A:	.word	0:20
		.text
main:
	la	$s0, A
	li	$v0, 5
	syscall
	move 	$s1, $v0
	li	$s3, 1	#khai bao index
	li	$v0, 5	#tao gia tri dau tien cua mang
	syscall
	move 	$a0, $v0	#min
	sw	$a0, A
	move 	$a1, $v0	#max
LOOP:	#nhap mang
	slt	$t0, $s3, $s1
	beq	$t0, $zero, next
	sll	$t3, $s3, 2
	add	$t3, $t3, $s0
	li	$v0, 5
	syscall
	sw	$v0, 0($t3)
	addi	$s3, $s3, 1
	slt	$t0, $v0, $a0	#kiem tra xem gia tri vua nhap co nho hon min
	bne	$t0, $zero, min
inLoopmin:	
	slt	$t0, $a1, $v0	#kiem tra xem gia tri vua nhap co lon hon max
	bne	$t0, $zero, max
inLoopmax:
	J 	LOOP
min:
	move	$a0, $v0
	J	inLoopmin
max:
	move	$a1, $v0
	J	inLoopmax
next:
	li	$v0, 1	#in ra man hinh a0(min)
	syscall
	move 	$a0, $a1
	li	$v0, 1	#in ra man hinh	a1(max)
	syscall
	li	$v0, 10
	syscall