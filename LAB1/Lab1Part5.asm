.text
main:
	#take input for array size
	li $v0, 4
	la $a0, size
	syscall
	li $v0, 5
	syscall
	move $t0, $v0
	#declaring array
	addi $s0, $0, 0
	addi $t2, $0, 0
	#taking elements and storing in array
	for:
	    beq $s0, $t0, exit3
	    li $v0, 4
	    la $a0, mess
	    syscall
	    li $v0, 5
	    syscall
	    sw $v0, array+0($t2) 
	    addi $t2, $t2, 4
	    addi $s0, $s0, 1
	    j for
	exit3:
	addi $s0, $0, 0
	addi $t2, $0, 0
################################################################################################################	
loop:	
	#displaying menu
	li $v0, 4
	la $a0, opa
	syscall
	li $v0, 4
	la $a0, opb
	syscall
	li $v0, 4
	la $a0, opc
	syscall
	li $v0, 4
	la $a0, opd
	syscall
	li $v0, 4
	la $a0, ope
	syscall
	#taking option
	li $v0, 5
	syscall
	move $t1, $v0
	
	#going to selected menu
	lw $t2, wa
	bne $t1, $t2, firstOp
	jal one
	firstOp:
	lw $t2, wb
	bne $t1, $t2, secondOp
	jal two
	secondOp:
	lw $t2, wc
	bne $t1, $t2, thirdOp
	jal three
	thirdOp:
	lw $t2, wd
	bne $t1, $t2, fourthOp
	jal four
	fourthOp:
	lw $t2, we
	bne $t1, $t2, fifthOp
	jal five
	fifthOp:
	
	j loop
		
	
	
	
	
Finish:
#start of methods
###########################################################################################################################	
#if first option is selected
one:
    
    addi $sp, $sp, -20
    sw $s0, 16($sp)
    sw $t0, 12($sp)
    sw $t1, 8($sp)
    sw $t2, 4($sp)
    sw $t3, 0($sp)
    ###
    addi $s0, $0, 0
    addi $t2, $0, 0
    li $v0, 5
    syscall
    move $t4, $v0
    for2:
        beq $s0, $t0, exiting
        addi $s0, $s0, 1
        lw $t1, array($t2)
        
        bge $t4, $t1, go
        add $t3, $t3, $t1
        go:
        addi $t2, $t2, 4
    j for2
         
    exiting:
        li $v0, 1
        move $a0, $t3
        syscall
        addi $v0, $zero, 4  
    	la $a0, space       
        syscall
        addi $t3, $0, 0
    ###
    lw $t3, 0($sp)
    lw $t2, 4($sp)
    lw $t1, 8($sp)
    lw $t0, 12($sp)
    lw $s0, 16($sp)
    addi $sp, $sp, 20
    jr $ra
##################################################################################################################3   
two:
	#if second option is selected
    addi $sp, $sp, -24
    sw $s0, 20($sp)
    sw $t0, 16($sp)
    sw $t2, 12($sp)
    sw $t3, 8($sp)
    sw $t4, 4($sp)
    sw $t5, 0($sp)
    ###
    addi $s0, $0, 0
    addi $t2, $0, 0
    li $v0, 5
    syscall
    move $t4, $v0
    li $v0, 5
    syscall
    move $t5, $v0
    for4:
        beq $s0, $t0, exitin
        addi $s0, $s0, 1
        lw $t1, array($t2)
        
        bge $t4, $t1, go1
        ble $t5, $t1, go1
        add $t3, $t3, $t1
        go1:
        addi $t2, $t2, 4
    j for4
         
    exitin:
        li $v0, 1
        move $a0, $t3
        syscall
        addi $v0, $zero, 4  
    	la $a0, space       
        syscall
        addi $t3, $0, 0
    ###
    lw $t5, 0($sp)
    lw $t4, 4($sp)
    lw $t3, 8($sp)
    lw $t2, 12($sp)
    lw $t0, 16($sp)
    lw $s0, 20($sp)
    addi $sp, $sp, 24
    jr $ra
    
############################################################################################################################
three:
    #if third option is selected
    addi $sp, $sp, -28
    sw $s0, 24($sp)
    sw $t0, 20($sp)
    sw $t1, 16($sp)
    sw $t2, 12($sp)
    sw $t3, 8($sp)
    sw $t4, 4($sp)
    sw $t6, 0($sp)
    ###
    addi $s0, $0, 0
    addi $t2, $0, 0
    li $v0, 5
    syscall
    move $t4, $v0
    for5:
        beq $s0, $t0, exitin1
        addi $s0, $s0, 1
        lw $t1, array($t2)
        div $t1, $t4
        mfhi $t3
        bnez  $t3, go2
        add $t6, $t6, 1
        
        go2:
        addi $t2, $t2, 4
        
    j for5
         
    exitin1:
        li $v0, 1
        move $a0, $t6
        syscall
        addi $v0, $zero, 4  
    	la $a0, space       
        syscall
        addi $t6, $0, 0
        addi $t3, $0, 0
    ###
    lw $t6, 0($sp)
    lw $t4, 4($sp)
    lw $t3, 8($sp)
    lw $t2, 12($sp)
    lw $t1, 16($sp)
    lw $t0, 20($sp)
    lw $s0, 24($sp)
    addi $sp, $sp, 28
    jr $ra

#####################################################################################################################    
four:
    #if fourth option is selected
    addi $sp, $sp, -28
    sw $s0, 24($sp)
    sw $s1, 20($sp)
    sw $t0, 16($sp)
    sw $t2, 12($sp)
    sw $t3, 8($sp)
    sw $t4, 4($sp)
    sw $t5, 0($sp)
    ###
    addi $s0, $0, 0
    addi $s1, $0, 0
    addi $t2, $0, 0
    addi $t5, $0, 0
    beq $s0, $t0, ext
    addi $t2, $t2, 4
    addi $s0, $s0, 1
    addi $t5, $t5, 1
    lop:
        beq $s0, $t0, ext
        lw $t3, array($t2)
        back:
        	beq $s1, $t2, hoho
        	lw $t4, array($s1)
        	sub $s3, $t3, $t4
        	beq $s3, $0, hoha
        	addi $s1, $s1, 4
        	j back
        hoho:
            addi $s1, $0, 0
            addi $t5, $t5, 1
        hoha:
        addi $t2, $t2, 4
        addi $s0, $s0, 1
        j lop
    ext:
    li $v0, 1
    move $a0, $t5
    syscall
    addi $v0, $zero, 4  
    la $a0, space       
    syscall
    ###
    lw $t5, 0($sp)
    lw $t4, 4($sp)
    lw $t3, 8($sp)
    lw $t2, 12($sp)
    lw $t0, 16($sp)
    lw $s1, 20($sp)
    lw $s0, 24($sp)
    addi $sp, $sp, 28
    jr $ra
 
#########################################################################################################################   
five:
    #if fifth option is selected
    addi $sp, $sp, -12
    sw $s0, 8($sp)
    sw $t0, 4($sp)
    sw $t2, 0($sp)
    
    li $v0,10
    syscall
    
    lw $t2, 0($sp)
    lw $t0, 4($sp)
    lw $s0, 8($sp)
    addi $sp, $sp, 12
    jr $ra	
#######################################################################################################################

.data
	size: .asciiz "enter size \n"
	mess: .asciiz "enter element \n"
	opa: .asciiz "1: sum greater than input \n"
	opb: .asciiz "2: sum between two input \n"
	opc: .asciiz "3: number divisible by input \n"
	opd: .asciiz "4: different numbers \n"
	ope: .asciiz "5: exit \n"
	space: .asciiz "\n"
	wa: .word 1
	wb: .word 2
	wc: .word 3
	wd: .word 4
	we: .word 5
	.align 2
	array: .space 400
