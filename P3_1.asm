	.data
char:	.asciiz	"The factorial is "
	.text
main:	li	$v0, 5
	syscall
	move	$a0, $v0
	jal	fact		# g?i hàm con fact
	la	$a0, char
	li	$v0, 4
	syscall
	li	$v0, 1
	mflo	$a0
	syscall
	j	exit
fact:	slti	$t0, $a0, 1	# n < 1 ?
	bne	$t0, $zero, else	# n < 1 ?  jump to else : next
	addi	$a0, $a0, -1	# n = n - 1
	addi	$sp, $sp, -4
	sw	$ra, 0($sp)	# l?u ??a ch? c?a $ra tr??c ?ó vào stack
	jal	fact		# ?? quy v?i n = n - 1
	addi	$a0, $a0, 1	# quay l?i giá tr? n c?a hàm ?? quy tr??c ?ó
	mult	$v0, $a0	# giá tr? c?a ?? quy n - 1 X v?i n
	mflo	$v0
	lw	$ra, 0($sp)
	addi	$sp, $sp, 4
	jr	$ra		# quay tr? l?i s? lý nh?ng l?nh còn l?i sau l?i g?i ?? quy
else:
	li	$v0, 1
	jr	$ra		# hoàn t?t ?? quy và quay l?i hàm ?? quy tr??c ?ó
exit:
