#Nguyen Kim Quoc 18521310
# xac dinh kieu cua ky tu nhap vao
	.data
Inva:		.asciiz	"invalid type"
Charso:		.asciiz	"so"
Charchu1:	.asciiz	"chu thuong"
Charchu2:	.asciiz	"chu hoa"
	.text
main:	
	li	$v0, 12
	syscall	
	move	$a0, $v0
	slti	$t0, $a0, 0x30
	bne	$t0, $zero, Invalid
	slti	$t0, $a0, 0x3A
	bne	$t0, $zero, So
	slti	$t0, $a0, 0x41
	bne	$t0, $zero, Invalid
	slti	$t0, $a0, 0x5B
	bne	$t0, $zero, ChuHoa
	slti	$t0, $a0, 0x61
	bne	$t0, $zero, Invalid
	slti	$t0, $a0, 0x7B
	bne	$t0, $zero, ChuThuong
	J Invalid
Invalid:
	li	$v0, 4
	la	$a0, Inva
	syscall
	J exit
So:
	li	$v0, 4
	la	$a0, Charso
	syscall
	J exit
ChuThuong:
	li	$v0, 4
	la	$a0, Charchu1
	syscall
	J exit
ChuHoa:
	li	$v0, 4
	la	$a0, Charchu2
	syscall
	J exit
exit:
	li	$v0, 10
	syscall
