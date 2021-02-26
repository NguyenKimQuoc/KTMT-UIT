#Nguyen Kim Quoc	18521310	
# tong, hieu, tich, thuong
	.data
	.text
main:
	li	$v0, 5
	syscall
	move	$a2, $v0	#gia tri 1
	li 	$v0, 5
	syscall
	move	$a1, $v0	#gia tri 2
	#add	$a0, $a2, $a1	# gia tri 1 + gia tri 2
	#li 	$v0, 1
	#syscall
	#sub	$a0, $a2, $a1	#gia tri 1 - gia tri 2
	#li 	$v0, 1
	#syscall
	mult	$a2, $a1	#gia tri 1 * gia tri 2
	mflo	$a0
	li 	$v0, 1 
	syscall
	#div	$a0, $a2, $a1	#gia tri 1 / gia tri 2
	#li 	$v0, 1
	#syscall
exit:
	li	$v0, 10
	syscall	
