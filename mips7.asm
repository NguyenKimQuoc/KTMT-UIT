	.data
so:	.word	0
	.text
main:
	jal	NhapSo
	move	$a0, $v0
	jal	NhapSo
	move	$a1, $v0
	jal	Max
	move	$a0, $v1
	jal	XuatSo
	j	exit
####################################
NhapSo:
	li	$v0, 5
	syscall	
	jr	$ra
####################################
Max:
	slt	$t0, $a0, $a1
	bne	$t0, $zero, else
	move	$v1, $a0
	jr	$ra
	else:
		move	$v1, $a0
		jr	$ra
####################################
XuatSo:
	li	$v0, 1
	syscall
exit: