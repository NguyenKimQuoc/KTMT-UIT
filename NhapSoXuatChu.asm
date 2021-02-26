# nh?p vào là nguyên d??ng, tên c?a t?ng ch? s? ???c in ra và cách nhau m?t kho?ng tr?ng
	.data
int:	.space 20
size:	.word 20
char:	.ascii	"\n"
Zero:	.asciiz	"Zero "
One:	.asciiz	"One "
Two:	.asciiz	"Two "
Three:	.asciiz	"Three "
Four:	.asciiz	"Four "
Five:	.asciiz	"Five "
Six:	.asciiz	"Six "
Seven:	.asciiz	"Seven "
Eight:	.asciiz	"Eight "
Nine:	.asciiz	"Nine "
Inva:	.asciiz "Invalid Entry "
	.text
main:
	jal	NhapChuoiSo
	move	$s1, $a0
	lb	$t0, char
	jal	DemKiTu
	jal	PhanLoai
#####################################
NhapChuoiSo:
	li	$v0, 8
	la	$a0, int
	lw 	$a1, size
	syscall
	jr	$ra
#####################################
PhanLoai:
	addi	$sp, $sp, -4
	sw	$ra, 0($sp)
	move	$a2, $v1
	li	$t4, 0	# index
	la	$t5, int
	LOOP1:	slt	$t2, $t4, $a2
		beq	$t2, $zero, exit
		add	$t6, $t4, $s1
		lb	$t6, 0($t6)
		li	$t1, 0x30
		beq	$t6, $t1, zero
		li	$t1, 0x31
		beq	$t6, $t1, one
		li	$t1, 0x32
		beq	$t6, $t1, two
		li	$t1, 0x33
		beq	$t6, $t1, three
		li	$t1, 0x34
		beq	$t6, $t1, four
		li	$t1, 0x35
		beq	$t6, $t1, five
		li	$t1, 0x36
		beq	$t6, $t1, six
		li	$t1, 0x37
		beq	$t6, $t1, seven
		li	$t1, 0x38
		beq	$t6, $t1, eight
		li	$t1, 0x39
		beq	$t6, $t1, nine
		J	LOOP1
	Invalid:
		la	$a0, Inva
		jal	XuatString
		li	$v0, 10
		syscall
	zero:
		la	$a0, Zero
		jal	XuatString
		add	$t4, $t4, 1
		J LOOP1
	one:
		la	$a0, One
		jal	XuatString
		add	$t4, $t4, 1
		J LOOP1
	two:
		la	$a0, Two
		jal	XuatString
		add	$t4, $t4, 1
		J LOOP1
	three:
		la	$a0, Three
		jal	XuatString
		add	$t4, $t4, 1
		J LOOP1	
	four:
		la	$a0, Four
		jal	XuatString
		add	$t4, $t4, 1
		J LOOP1
	five:
		la	$a0, Five
		jal	XuatString
		add	$t4, $t4, 1
		J LOOP1
	six:
		la	$a0, Six
		jal	XuatString
		add	$t4, $t4, 1
		J LOOP1
	seven:
		la	$a0, Seven
		jal	XuatString
		add	$t4, $t4, 1
		J LOOP1
	eight:
		la	$a0, Eight
		jal	XuatString
		add	$t4, $t4, 1
		J LOOP1
	nine:
		la	$a0, Nine
		jal	XuatString
		add	$t4, $t4, 1	
		J LOOP1
	lw	$ra, 0($sp)
	addi	$sp, $sp, 4
	jr	$ra
#######################################################
XuatString:
	li	$v0, 4
	syscall
	jr	$ra
#######################################################
DemKiTu:
	li	$t3, 0	# i = 0 // do dai cua chuoi
	LOOP:	add	$t2, $t3, $a0
		lb	$t2, 0($t2)
		beq	$t2, $t0, next	# neu khong phai la dau \n thi i++
		slti	$s2, $t2, 0x30
		bne	$s2, $zero, Invalid
		slti	$s2, $t2, 0x40
		beq	$s2, $zero, Invalid
		add	$t3, $t3, 1
		J	LOOP
	next:	move	$v1, $t3
	jr	$ra
exit:	li	$v0, 10
	syscall
	
