.text
main:	li $v0, 4
	la $a0, enterMat
	syscall
	li $v0, 4
	la $a0, enterPreMat
	syscall
	li $v0, 4
	la $a0, display
	syscall
	li $v0, 4
	la $a0, displayMatrix
	syscall
	li $v0, 4
	la $a0, trace
	syscall
	li $v0, 4
	la $a0, traceOther
	syscall
	li $v0, 4
	la $a0, SumR
	syscall
	li $v0, 4
	la $a0, SumC
	syscall
	li $v0, 4
	la $a0, exit
	syscall

	li $v0, 5
	syscall
	move $s0, $v0
	
	beq $s0, 1, go1
	beq $s0, 2, go2
	beq $s0, 3, go3
	beq $s0, 4, go4
	beq $s0, 5, go5
	beq $s0, 6, go6
	beq $s0, 7, go7
	beq $s0, 8, go8
	#ending program
	li $v0,10
	syscall


go1:	#taking input
	li $v0, 4
	la $a0, size
	syscall
	li $v0, 5
	syscall
	move $s2, $v0
	move $t1, $v0
	mul $s2, $s2, $s2
	move $s3, $s2
	# allocate dynamic memory
	mul $a0, $s2, 4		
	li $v0, 9           
	syscall 
	move $s1, $v0
	move $t0, $v0
	
	addi $s4, $0, 0
	lool:
	beq $s4, $s3, end
	
	li $v0, 4
	la $a0, element
	syscall
	li $v0, 5
	syscall
	sw $v0, 0($s1)
	addi $s1, $s1, 4
	addi $s4, $s4, 1
	
	j lool
	end:
	j main
	
go2: 	
	#taking input
	li $v0, 4
	la $a0, size
	syscall
	li $v0, 5
	syscall
	move $s2, $v0
	move $t1, $v0
	mul $s2, $s2, $s2
	move $s3, $s2
	# allocate dynamic memory
	mul $a0, $s2, 4		
	li $v0, 9           
	syscall 
	move $s1, $v0
	move $t0, $v0
	
	addi $s4, $0, 1
	lool2:
	bgt $s4, $s3, end
	
	sw $s4, 0($s1)
	addi $s1, $s1, 4
	addi $s4, $s4, 1
	
	j lool2
	exit2:	
	j main
	
	
go3:
	li $v0, 4
	la $a0, enterRow
	syscall
	li $v0, 5
	syscall
	move $s0, $v0
	li $v0, 4
	la $a0, enterCol
	syscall
	li $v0, 5
	syscall
	move $s1, $v0
	
	subi $s2, $s0, 1
	mul $s2, $s2, $t1
	mul $s2, $s2, 4
	subi $s3, $s1, 1
	mul $s3, $s3, 4
	add $s2, $s2, $s3
	
	add $s2, $s2, $t0
	lw $s3, 0($s2)
	li $v0, 4
	la $a0, answer
	syscall
	move $a0, $s3
	li $v0, 1
	syscall
	li $v0, 4
	la $a0, space
	syscall
	j main
	

go4:
	move $s0, $t0
	move $s1, $t1
	mul $s1, $s1, $s1
	addi $s2, $0, 0
	dis:
	beq $s2, $s1, emd
	lw $s3, 0($s0)
	addi $s0, $s0, 4
	move $a0, $s3
	li $v0, 1
	syscall
	addi $s2, $s2, 1
	j dis
	emd:
	li $v0, 4
	la $a0, space
	syscall
	j main
	
go5:
	move $s0, $t0
	move $s1, $t1
	addi $s2, $0, 1
	addi $s3, $0, 0
	trr:
	bgt $s2, $s1, etrr
	
	subi $s4, $s2, 1
	mul $s4, $s4, $t1
	mul $s4, $s4, 4
	subi $s5, $s2, 1
	mul $s5, $s5, 4
	add $s4, $s4, $s5
	add $s4, $s4, $t0
	lw $s5, 0($s4)
	
	add $s3, $s3, $s5
	addi $s2, $s2, 1
	j trr
	etrr:
	li $v0, 4
	la $a0, answer
	syscall
	move $a0, $s3
	li $v0, 1
	syscall
	li $v0, 4
	la $a0, space
	syscall
	j main
	
go6:
	move $s0, $t0
	move $s1, $t1
	move $s6, $s1
	addi $s2, $0, 1
	addi $s3, $0, 0
	trr2:
	bgt $s2, $s1, etrr2
	
	subi $s4, $s2, 1
	mul $s4, $s4, $t1
	mul $s4, $s4, 4
	subi $s5, $s6, 1
	mul $s5, $s5, 4
	add $s4, $s4, $s5
	add $s4, $s4, $t0
	lw $s5, 0($s4)
	
	add $s3, $s3, $s5
	addi $s2, $s2, 1
	subi $s6, $s6, 1
	j trr2
	etrr2:
	li $v0, 4
	la $a0, answer
	syscall
	move $a0, $s3
	li $v0, 1
	syscall
	li $v0, 4
	la $a0, space
	syscall
	j main

go7:
	move $s0, $t0
	move $s1, $t1
	mul $s1, $s1, $s1
	addi $s2, $0, 0
	addi $s4, $0, 0
	dis2:
	beq $s2, $s1, emd2
	lw $s3, 0($s0)
	addi $s0, $s0, 4
	add $s4, $s4, $s3
	addi $s2, $s2, 1
	j dis2
	emd2:
	li $v0, 4
	la $a0, answer
	syscall
	move $a0, $s4
	li $v0, 1
	syscall
	li $v0, 4
	la $a0, space
	syscall
	j main


go8:
	move $s0, $t0
	move $s1, $t1
	addi $s2, $0, 0
	addi $s3, $0, 1
	punj:
	bgt $s3, $s1, epunj
	addi $s4, $0, 1
		punj2:
		bgt $s4, $s1, epunj2
		
		subi $s6, $s4, 1
		mul $s6, $s6, $t1
		mul $s6, $s6, 4
		subi $s5, $s3, 1
		mul $s5, $s5, 4
		add $s6, $s6, $s5
		add $s6, $s6, $t0
		lw $s5, 0($s6)
		
		add $s2, $s2, $s5
		
		addi $s4, $s4, 1
		j punj2
		epunj2:
	addi $s3, $s3, 1
	j punj
	epunj:
	li $v0, 4
	la $a0, answer
	syscall
	move $a0, $s2
	li $v0, 1
	syscall
	li $v0, 4
	la $a0, space
	syscall
	j main

.data
	enterMat: .asciiz "1) read the matrix \n"
	enterPreMat: .asciiz "2) make array and values 1 2 3 ... \n"
	display: .asciiz "3) display disered element \n"
	displayMatrix: .asciiz "4) display entire matrix \n"
	trace: .asciiz "5) trace of matrix \n"
	traceOther: .asciiz "6) trace of other diagonal \n"
	SumR: .asciiz "7) sum row by row \n"
	SumC: .asciiz "8) sum col by col \n"
	exit: .asciiz "9) exit \n"

	size: .asciiz "enter size of matrix: "
	element: .asciiz "enter next element: "
	enterRow: .asciiz "enter row number: "
	enterCol: .asciiz "enter col number: "
	space: .asciiz "\n"
	answer: .asciiz "answer is: "
