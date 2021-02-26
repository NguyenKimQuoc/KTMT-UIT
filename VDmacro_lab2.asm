#.macro OutputInt (%value)
#	li	$a0, %value
#	li 	$v0, 1
#	syscall
#.end_macro
#	.text
#main:
#	OutputInt(1)
#	OutputInt(2)
#	OutputInt(3)
#	OutputInt(4)
#.macro	Max (%a, %b)

#	li	$t1, %a
#	li	$t2, %b
#	slt	$t0, $t1, $t2
#	bne	$t0, $zero, else
#	li	$a0, %a
#	li	$v0, 1
#	syscall
#	j	exit
#else:	li	$a0, %b
#	li	$v0, 1
#	syscall
#exit:
#.end_macro
#	.text
#main:
#	Max (100, 11)
.macro Fibonaci (%n)	
	li	$s1, %n
	li	$s2, 0
	Print:	slt	$t0, $s1, $s2	# ham in chuoi Fibonaci tu dau toi gia tri thu n
		bne	$t0, $zero, exit
		move	$a1, $s2	# truyen tham so i cho ham Fib
		jal	Fib
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
.end_macro
	.text
main:
	Fibonaci(10)		