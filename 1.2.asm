#in chuoi nguoc
		.data
chuoi:	.space 	20
chuoidao:	.word	0:20
size:	.word	20
char:	.ascii	"\n"
	.text
main:	jal 	Nhap
	lb	$t0, char
	jal	TinhDoDai
	jal	InNguoc
	jal	Xuat
	J	exit
## In nguoc
InNguoc:
	la 	$t0, chuoi
	li 	$t1, 0	# i = 0
	la	$t3, chuoidao	
	add	$t2, $a1, 0
	LOOP1:	slt	$t4, $t2, $zero
		bne	$t4, $zero, next1
		move 	$a3, $t2
		add	$a3, $a3, $t0
		lb	$a3, 0($a3)	# lay chuoi[j]
		move	$t5, $t1
		add	$t5, $t5, $t3
		sb	$a3, 4($t5)
		add	$t1, $t1, 1
		add	$t2, $t2, -1
		J	LOOP1
	next1:	
		jr	$ra
########################################
Xuat:
	li	$v0, 4
	move	$a0, $t3
	add	$a0, $a0, 4
	syscall
	Jr	$ra
# nhap va tinh so ki tu chuoi
Nhap:	la	$a0, chuoi
	lw	$a1, size
	li	$v0, 8
	syscall	#nhap chuoi
	jr	$ra
#########################################
TinhDoDai:
	li	$a1, 0	# i = 0
	LOOP:	add	$t2, $a1, $a0
		lb	$t2, 0($t2)
		beq	$t2, $t0, next	# neu khong phai la dau \n thi i++
		add	$a1, $a1, 1
		J	LOOP
	next:
		jr	$ra
exit:
