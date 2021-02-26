#Nguyen Kim Quoc	18521310	
	.data
	.text
main:
	jal	NhapSo
	move	$a2, $v0	#gia tri 1
	jal	NhapSo
	move	$a1, $v0	#gia tri 2
	jal	Cong
	jal	XuatSo
	jal	Tru
	jal	XuatSo
	jal	Nhan
	jal	XuatSo
	jal	Chia
	jal	XuatSo
NhapSo:
	li	$v0, 5
	syscall	
	jr	$ra
XuatSo:
	move	$a0, $v1
	li 	$v0, 1
	syscall
Cong:	add	$v1, $a2, $a1
	jr	$ra
Tru:	sub	$v1, $a2, $a1
	jr	$ra
Nhan:	multu	$a2, $a1	#gia tri 1 * gia tri 2
	mflo	$v1
	jr	$ra
Chia:	div	$v1, $a2, $a1
	jr	$ra
exit:
	li	$v0, 10
	syscall	
