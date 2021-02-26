#Nguyen Kim Quoc 18521310
# xac dinh kieu cua ky tu nhap vao
	.data
Inva:		.asciiz	"invalid type"
Charso:		.asciiz	"so"
Charchu1:	.asciiz	"chu thuong"
Charchu2:	.asciiz	"chu hoa"
CharN:		.asciiz "\n"
	.text
main:	
	jal	Nhap
	slti	$t0, $a1, 0x30
	bne	$t0, $zero, Invalid
	slti	$t0, $a1, 0x3A
	bne	$t0, $zero, So
	slti	$t0, $a1, 0x41
	bne	$t0, $zero, Invalid
	slti	$t0, $a1, 0x5B
	bne	$t0, $zero, ChuHoa
	slti	$t0, $a1, 0x61
	bne	$t0, $zero, Invalid
	slti	$t0, $a1, 0x7B
	bne	$t0, $zero, ChuThuong
	J Invalid
Invalid:
	la	$a0, Inva
	jal	XuatString
	J exit
So:
	la	$a0, Charso
	jal	XuatString
	J exit
ChuThuong:
	la	$a0, Charchu1
	jal	XuatString
	J exit
ChuHoa:
	la	$a0, Charchu2
	jal	XuatString
	J exit
##############################################
XuatString:
	li	$v0, 4
	syscall
	jr	$ra
##############################################
Nhap:	li	$v0, 12
	syscall
	move	$a1, $v0
	la	$a0, CharN
	addi	$sp, $sp, -4
	sw	$ra, 0($sp)
	jal	XuatString
	lw	$ra, 0($sp)
	addi	$sp, $sp, 4
	jr	$ra	
exit:
	li	$v0, 10
	syscall
