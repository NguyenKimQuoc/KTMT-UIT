#Nguyen Kim Quoc	18521310
		.data
A:	.word	0:20
		.text
main:
	la	$s0, A
	jal	NhapInt	#nhap size mang
	move 	$a0, $v0
	jal	NhapAndSum
	jal	FindAndPrint
	j 	exit
################################################
NhapAndSum:
	addi	$sp, $sp, -4
	sw	$ra, 0($sp)
	li	$a1, 0	#khoi tao index
	li	$v1, 0
	LOOP:	#nhap mang
		slt	$t0, $a1, $a0
		beq	$t0, $zero, next
		sll	$t3, $a1, 2
		add	$t3, $t3, $s0
		jal	NhapInt
		sw	$v0, 0($t3)	# Nhap a[i]
		addi	$a1, $a1, 1
		J	LOOP
	next:	
		lw	$ra, 0($sp)
		addi	$sp, $sp, 4
		jr	$ra
##################################################
NhapInt:
	li	$v0, 5
	syscall
	jr	$ra
##################################################
XuatInt:
	li	$v0, 1
	syscall
	jr	$ra
FindAndPrint:
	addi	$sp, $sp, -4
	sw	$ra, 0($sp)
	jal	NhapInt	#nhap vi tri cua phan tu	
	sll	$v0, $v0, 2
	add	$v0, $v0, $s0
	lw	$a0, 0($v0)
	jal	XuatInt	#in ra gia tri tai vi tri do
	lw	$ra, 0($sp)
		addi	$sp, $sp, 4
	jr	$ra
exit:	
	li	$v0, 10
	syscall
