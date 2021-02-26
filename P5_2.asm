	.data
cach:	.asciiz	"\n"
kcach:	.asciiz	" "
	.text
main:	li	$v0, 5			
	syscall				# nhap n
	move	$s1, $v0
	li	$s2, 1
	Print:	slt	$t0, $s1, $s2	# ham in chuoi Fibonaci tu dau toi gia tri thu n
		bne	$t0, $zero, exit
		move	$a1, $s2	# truyen tham so i cho ham Fib
		jal	Fib
		la	$a0, kcach
		li	$v0, 4
		syscall
		move	$a0, $v1
		li	$v0, 1
		syscall
		addi	$s2, $s2, 1	# i++
		J	Print 
############################################################################################
Fib:    addi	$sp, $sp, -12         	
      	sw	$a1, 0($sp)          	# luu $a1 = n
        sw 	$s0, 4($sp)          	 
        sw 	$ra, 8($sp)          	# luu gia tri thanh ghi $ra
       	slti	$t1, $a1, 2
       	beq	$t1, $zero, InFib       	
        move	$v1, $a1            	# tra ve gia tri 0 neu khi n = 0, 1 khi n = 1
        j 	InFib2                 
	InFib:  addi	$a1, $a1, -1   	
       		jal 	Fib             # de quy tinh Fib (n - 1)
        	move 	$s0, $v1        # luu gia tri Fib (n - 1)
       		addi 	$a1, $a1, -1    
        	jal 	Fib             # de quy tinh Fib (n - 2)
        	add 	$v1, $v1, $s0   # gan $v1 = Fib (n - 2) + Fib (n - 1)
	InFib2: lw  	$a1, 0($sp)     
        	lw  	$s0, 4($sp)         
        	lw  	$ra, 8($sp)         
        	addi 	$sp, $sp, 12    
        	jr 	$ra	
exit:
	move 	$t2, $s1
	li 	$t3, 1
	li 	$t4, 2
check:	beq	$t2, $t4, chan
	beq	$t2, $t3, le
	addi	$t2, $t2, -2
	j 	check
chan:	la	$a0, cach
	li	$v0, 4
	syscall
	div	$a1, $s1, $t4
	jal	Fib
	li	$v0, 1
	move	$a0, $v1
	syscall
	add	$a1, $a1, 1 
	jal	Fib
	li	$v0, 1
	move	$a0, $v1
	syscall
	j	out
le:	la	$a0, cach
	li	$v0, 4
	syscall
	div	$a1, $s1, $t4
	add	$a1, $a1, 1 
	jal	Fib
	li	$v0, 1
	move	$a0, $v1
	syscall
out: