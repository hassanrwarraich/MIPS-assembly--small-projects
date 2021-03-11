.text
main:
	#taking 1st element
	li $v0, 4
	la $a0, entera
	syscall
	li $v0, 5
	syscall
	move $t0, $v0
	#taking 2nd element
	li $v0, 4
	la $a0, enterb
	syscall
	li $v0, 5
	syscall
	move $t1, $v0
	#taking 3rd element
	li $v0, 4
	la $a0, enterc
	syscall
	li $v0, 5
	syscall
	move $t2, $v0
	
	addi $s0, $0, 3
	addi $s1, $0, 4
	
	#calculating upper term
	mul $t4, $t0, $s1
	mul $t6, $t4, $t1
	#calculating lower term
	addi $t3, $t2, -2
	div $t3, $s0
	mflo $t7
	#finding answer
	div $t6, $t7
	mfhi $t5
	
	#printing answer	
	li $v0, 4
	la $a0, ans
	syscall
	li $v0, 1
	move $a0, $t5
	syscall
	 
.data
entera: .asciiz "enter element a"
enterb: .asciiz "enter element b"
enterc: .asciiz "enter element c"
enterd: .asciiz "enter element d"
ans: .asciiz "your answer is: "
four: .word 4
three: .word 3
