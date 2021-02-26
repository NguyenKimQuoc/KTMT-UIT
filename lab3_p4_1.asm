	.data
a:	.word	0	# int a
b:	.word	0	# int b
c: 	.word	0	# int c
d:	.word	0	# int d
	.text
main:	addi	$a0, $zero, 6
	sw	$a0, a		# a = 6
	addi	$a1, $zero, 5
	sw	$a1, b		# b = 5
	lw	$a0, a
	lw	$a1, b
	sub	$a2, $a0, $a1	
	sw	$a2, c		# c = a - b
	add	$a3, $a0, $a1
	sw	$a3, d		# d = a + b
