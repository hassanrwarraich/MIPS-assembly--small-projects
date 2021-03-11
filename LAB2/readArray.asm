.text
main:
li $v0, 4
la $a0, read
syscall
li $v0, 4
la $a0, insert
syscall
li $v0, 4
la $a0, med
syscall
li $v0, 4
la $a0, exit
syscall

li $v0, 5
syscall
move $s0, $v0
		
lw $s1, wa
bne $s0, $s1, firstOp
jal readArray
move $a0, $v0
move $a1, $v1
move $s6, $v0
move $s7, $v1
j main

firstOp:
lw $s1, wb
bne $s0, $s1, secondOp
move $a0, $s6
move $a1, $s7
jal insertionSort
j main

secondOp:
lw $s1, wc
bne $s0, $s1, thirdOp
move $a0, $s6
move $a1, $s7
jal medianMode
#displaying median
move $s0, $v0
li $v0, 4
la $a0, median
syscall
move $a0, $s0
li $v0, 1
syscall

li $v0, 4
la $a0, space
syscall
#displaying mode
move $s0, $v1
li $v0, 4
la $a0, mode
syscall
move $a0, $s0
li $v0, 1
syscall
li $v0, 4
la $a0, space
syscall
j main

thirdOp:			
#ending program
li $v0,10
syscall


warra:
li $v0, 4
la $a0, invalid
syscall
li $v0, 4
la $a0, space
syscall

readArray:
	addi $sp, $sp, -20
    	sw $s7, 16($sp)
    	sw $s2, 12($sp)
    	sw $s1, 8($sp)
    	sw $s0, 4($sp)
    	sw $ra, 0($sp)

	#taking input
	li $v0, 4
	la $a0, size
	syscall
	li $v0, 5
	syscall
	move $s0, $v0
	move $v1, $s0
	ble $v0, 0, warra
	
	# allocate dynamic memory
	mul $a0, $s0, 4		
	li $v0, 9           
	syscall 
	    
	move $s1, $v0
	move $s7, $v0
	move $s2, $zero
	loop:
		j war
		#displaying error if wrong number entered
		haah:
		li $v0, 4
		la $a0, invalid
		syscall
		li $v0, 4
		la $a0, space
		syscall
		war:
    		bge $s2, $s0, end
    		# read in and store int
    		li $v0 5
    		syscall
    		sw $v0, 0($s1)
    		bgt $v0, 100, haah
		blt $v0, 0, haah
    		addi $s2, $s2, 1
    		addi $s1, $s1, 4
    	j loop
    	
end:
move $v0, $s7
lw $ra, 0($sp)
lw $s0, 4($sp)
lw $s1, 8($sp)
lw $s2, 12($sp)
lw $s7, 16($sp)
addi $sp, $sp, 20

jr $ra

insertionSort:
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

	addi $s0, $zero, 1
	move $s7, $a0
	move $s6, $a0
	while:
		move $s7, $a0
		move $s6, $a0
		beq $s0, $a1, endWhile
		mul $s1, $s0, 4
		add $s7, $s7, $s1
		add $s6, $s6, $s1
		addi $s6, $s6, -4
		move $s2, $s0
		while2:
			beq $s2, $0, endWhile2
			lw $s5, 0($s7)
			lw $s4, 0($s6)
			bgt $s5, $s4, hello
			move $s3, $s5
			move $s5, $s4
			move $s4, $s3
			sw $s5, 0($s7)
			sw $s4, 0($s6)
			hello:
			addi $s6, $s6, -4
			addi $s7, $s7, -4
			addi $s2, $s2, -1
			j while2
		endWhile2:
		addi $s0 ,$s0 ,1
		j while
	endWhile:
end2:
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

medianMode:
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

	#calculating median
	move $s0, $a0
	move $s1, $a1
	addi $s2, $0, 2
	div $s1, $s2
	mfhi $s2
	beq $s2, $0, hi
	j ho
	hi:
	div $s1, $s1, 2
	mul $s1, $s1, 4
	add $s0, $s0, $s1
	lw $s7, 0($s0) #median stored in s7
	lw $s3, -4($s0)
	add $s7, $s7, $s3
	div $s7, $s7, 2 
	j ha
	ho:
	div $s1, $s1, 2
	mul $s1, $s1, 4
	add $s0, $s0, $s1
	lw $s7, 0($s0) #median stored in s7
	
	ha:
	#calculating mode
	move $s0, $a0
	addi $s1, $0, 0
	addi $s2, $0, 0
	#loop goes through all elements
	loop4:
		beq $s1, $a1, endLoop
		move $s3, $s1
		addi $s4, $0, 0
		mul $s5, $s1, 4
		add $s5, $s5, $a0
		lw $s5, 0($s5)
		loop2:
			beq $s3, $a1, endloop2
			mul $s6, $s3, 4
			add $s6, $s6, $a0
			lw $s6, 0($s6)
			bne $s5, $s6, go
				addi $s4, $s4, 1
			go:
			addi $s3, $s3, 1
			j loop2
		endloop2:
		bne $s4, $s2, hassa
			bgt $s5, $s0, go2
			move $s2, $s4
			move $s0, $s5 
			j go2
		hassa:
		ble $s4, $s2, go2
			
			move $s2, $s4
			move $s0, $s5 #mode stored in s0
		go2:
		addi $s1, $s1, 1
		j loop4
	endLoop:
	move $v0, $s7   #v0 stores median
	move $v1, $s0   #v1 stores mode
end3:
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
	



.data
read: .asciiz "1) read the array \n"
insert: .asciiz "2) insertion sort \n"
med: .asciiz "3) median mode of array \n"
exit: .asciiz "4) exit \n"
size: .asciiz "enter size of array: "
median: .asciiz "median is:  "
mode: .asciiz "mode is:  "
invalid: .asciiz "invalid entry"
space: .asciiz "\n"
wa: .word 1
wb: .word 2
wc: .word 3
wd: .word 4
.align 2
