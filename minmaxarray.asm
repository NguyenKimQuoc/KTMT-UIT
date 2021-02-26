#Nguyen Kim Quoc	18521310
# tim min max cua mang
		.data
A:	.word	0:20
		.text
main:
	la	$s0, A
	jal	NhapSo
	move 	$a2, $v0
	jal	NhapMang
	move	$a0, $v0	# MIN
	jal	XuatSo
	move	$a0, $v1	# MAX
	jal	XuatSo
	j	exit
#########################################
NhapMang:
	addi	$sp, $sp, -4
	sw	$ra, 0($sp)
	li	$t1, 1	#khai bao index
	jal	NhapSo	#tao gia tri dau tien cua mang
	move 	$a0, $v0	#min
	sw	$a0, A
	move 	$a1, $v0	#max
	LOOP:	#nhap mang
		slt	$t0, $t1, $a2
		beq	$t0, $zero, next
		sll	$t3, $t1, 2
		add	$t3, $t3, $s0
		jal	NhapSo
		sw	$v0, 0($t3)
		addi	$t1, $t1, 1
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
		move	$v0, $a0	#in ra man hinh a0(min)
		move 	$v1, $a1	#in ra man hinh	a1(max)
	lw	$ra, 0($sp)
	addi	$sp, $sp, 4
	jr	$ra
#######################################
NhapSo:
	li	$v0, 5
	syscall
	jr	$ra
########################################
XuatSo:
	li	$v0, 1
	syscall
	jr	$ra
exit: