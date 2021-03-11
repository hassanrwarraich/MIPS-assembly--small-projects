.text
main:
	jal interactWithUser
	
	
	interactWithUser:
		li $v0, 4
		la $a0, octa
		syscall
		li $v0, 4
		la $a0, hexa
		syscall
		li $v0, 4
		la $a0, goOut
		syscall
		
		li $v0, 5
		syscall
		move $s0, $v0
		
		lw $s1, wa
		bne $s0, $s1, firstOp
		jal one
		firstOp:
		lw $s1, wb
		bne $s0, $s1, secondOp
		jal two
		secondOp:
		lw $s1, wc
		bne $s0, $s1, thirdOp
		jal three
		thirdOp:
		j interactWithUser
	jr $ra
##################################################################################################3	
	convertToDec:
		addi $sp, $sp, -36
    		sw $s7, 32($sp)
    		sw $s6, 28($sp)
    		sw $s5, 24($sp)
    		sw $s4, 20($sp)
    		sw $s3, 16($sp)
    		sw $s2, 12($sp)
    		sw $s1, 8($sp)
    		sw $s0, 4($sp)
    		sw $ra, 0($sp)
    		
    		
		addi $s4, $zero, 0
		addi $s1, $zero, 0
		addi $s3, $zero, 0
		addi $s2, $zero, 0
		addi $s7, $zero, 0
		addi $s5, $zero, 0
		addi $s6, $zero, 0
		#loop for calculating length of string
		
		loop:
    			lb   $s1, string($s2)
   			beq $s1, 10, lend 
    			addi $s3, $s3, 1
    			addi $s2, $s2, 1
    			
    			j loop
		lend:
		li $v0, 1
		move $a0, $s3
		addi $s2, $zero, 0
		li $v0, 1
		move $a0, $s3
		loop2:
			lb $s4, string($s2)
			addi $s2, $s2, 1
			subi $s4, $s4, 48
			
			beq $s3, $zero, end2
			addi $s3, $s3, -1
			addi $s6, $0, 0
			loop3:
				beq $s3, $s6, end3
				mul $s4, $s4, 8 
				addi $s6, $s6, 1
				j loop3
			end3: 
			add $s7, $s7, $s4
			j loop2
		end2:
		
	move $v0, $s7
	
	
	lw $ra, 0($sp)
        lw $s0, 4($sp)
        lw $s1, 8($sp)
        lw $s2, 12($sp)
        lw $s3, 16($sp)
        lw $s4, 20($sp)
        lw $s5, 24($sp)
        lw $s6, 28($sp)
        lw $s7, 32($sp)
        addi $sp, $sp, 36
	
	jr $ra
###############################################################################################################3	
	reverseNumber:
		addi $sp, $sp, -36
    		sw $s7, 32($sp)
    		sw $s6, 28($sp)
    		sw $s5, 24($sp)
    		sw $s4, 20($sp)
    		sw $s3, 16($sp)
    		sw $s2, 12($sp)
    		sw $s1, 8($sp)
    		sw $s0, 4($sp)
    		sw $ra, 0($sp)
		
		addi $s7, $zero, 0
		addi $s4, $0, 0
		addi $s6, $0, 4
		addi $s3, $0, 256
		foring:
			beq $s7, $s6, ending
			div $s2, $s3
			mflo $s2 #quiotient
			mfhi $s5 #remainder
			sll $s4, $s4, 8
			or $s4, $s4, $s5
			addi $s7, $s7, 1
			j foring
		ending:
		move $a0, $s4
		li $v0, 34
		syscall
		li $v0, 4
	  	la $a0, nextLine
		syscall
		
		lw $ra, 0($sp)
        	lw $s0, 4($sp)
        	lw $s1, 8($sp)
        	lw $s2, 12($sp)
        	lw $s3, 16($sp)
        	lw $s4, 20($sp)
        	lw $s5, 24($sp)
        	lw $s6, 28($sp)
        	lw $s7, 32($sp)
        	addi $sp, $sp, 36
	jr $ra
########################################################################################################	
one:
	addi $sp, $sp, -8
    	sw $s2, 4($sp)
    	sw $ra, 0($sp)

	li  $v0, 8          
	la  $a0, string
	li  $a1, 20
	syscall
	
	jal convertToDec
	move $a0, $v0
	li $v0, 1
	syscall
	
	li $v0, 4
	la $a0, nextLine
	syscall
	
	lw $ra, 0($sp)
        lw $s2, 4($sp)
        addi $sp, $sp, 8

	jr $ra

two:
	addi $sp, $sp, -8
    	sw $s2, 4($sp)
    	sw $ra, 0($sp)
    	
	li $v0, 5
	syscall
	move $s2, $v0
	move $a0, $s2
	li $v0, 34
	syscall
	li $v0, 4
	la $a0, nextLine
	syscall
	jal reverseNumber
	
	lw $ra, 0($sp)
        lw $s2, 4($sp)
        addi $sp, $sp, 8
	
jr $ra
		
three:
	 li $v0,10
	 syscall
jr $ra
	


.data
	hexa: .asciiz "2. enter decimal number \n"
	octa: .asciiz "1. enter octal number \n"
	goOut: .asciiz "3. exit \n"
	nextLine: .asciiz "\n"
	.align 2
	string: .space 80
	wa: .word 1
	wb: .word 2
	wc: .word 3
