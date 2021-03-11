# A program to swap the contents of two elements of an array.
	.text
	la	$a0, array
	lw	$a1, index1
	lw	$a2, index2
	jal	swap
	
# Look at data segment to verify the change.
	li	$v0, 10
	syscall
#============================================
swap:
	move	$t0, $a1
	move	$t1, $a2
	sll	$t0, $t0, 2  	# $t0= 4 * $t0
	sll	$t1, $t1, 2  	# $t1= 4 * $t1
	add	$t0, $t0, $a0	# $t0 points to the array element at index1
	add	$t1, $t1, $a0	# $t1 points to the array element at index2
# Perform swap.
	lw	$t3, 0($t0)
	lw	$t4, 0($t1)	
	sw	$t3, 0($t1)
	sw	$t4, 0($t0)
	jr	$ra
#============================================	
	.data
array:	.word	10, 20, 30, 40, 50 # First element is at index position 0
index1:	.word	0
index2:	.word	1