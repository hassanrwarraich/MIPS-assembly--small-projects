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
	
	#displaying elements
	addi $s0, $0, 0
	addi $t2, $0, 0
	for2:
	    beq $s0, $t0, exit 
	    
	    addi $s0, $s0, 1
	    lw $t1, array($t2)
	    		
	    li $v0, 1
	    move $a0, $t1
	    syscall
	    addi $t2, $t2, 4
	    j for2
	exit:
	
	#reversing elements
	addi $s0, $0, 0
	addi $v0, $zero, 4  
    	la $a0, space       
        syscall
	for3:
	    beq $s0, $t0, exit2 
	    addi $t2, $t2, -4
	    lw $t1, array($t2)		
	    li $v0, 1
	    move $a0, $t1
	    syscall
	    addi $s0, $s0, 1
	    j for3
	exit2:

.data
	size: .asciiz "enter size"
	mess: .asciiz "enter element"
	space: .asciiz "\n"
	.align 2
	array: .space 80
