li $a0, 6           	# call fib(10)
jal fib			# 
move $a0, $v0 	# $s0 = fib(10)
li	$v0, 1
syscall
li	$v0, 10
syscall
fib:    subi $sp,$sp,12         # save registers on stack
        sw $a0, 0($sp)          # save $a0 = n
        sw $s0, 4($sp)          # save $s0
        sw $ra, 8($sp)          # save return address $ra
        bgt $a0,1, gen          # if n>1 then goto generic case
        move $v0,$a0            # output = input if n=0 or n=1
        j rreg                  # goto restore registers
gen:    subi $a0,$a0,1           # param = n-1
        jal fib                 # compute fib(n-1)
        move $s0,$v0            # save fib(n-1)
        sub $a0,$a0,1           # set param to n-2
        jal fib                 # and make recursive call
        add $v0, $v0, $s0       # $v0 = fib(n-2)+fib(n-1)
rreg:   lw  $a0, 0($sp)         # restore registers from stack
        lw  $s0, 4($sp)         #
        lw  $ra, 8($sp)         #
        addi $sp, $sp, 12       # decrease the stack size
        jr $ra
