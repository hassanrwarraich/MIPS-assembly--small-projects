
multiplyDigits:  
addi $sp, $sp, -16
sw $s2, 12($sp)
sw $s1, 8($sp)
sw $t1, 4($sp)
sw $ra, 0($sp)

addi $t1, $0, 10
addi $s2, $0, 1
jal mull
move $v0, $s2 #returns value in v0
lw $ra, 0($sp)
lw $t1, 4($sp)
lw $s1, 8($sp)
lw $s2, 12($sp)
addi $sp, $sp, 16
jr $ra
	mull:
	addi	$sp, $sp, -8
	sw	$s1, 4($sp)
	sw	$ra, 0($sp)
	bgtz	$s0, else
	addi	$sp, $sp, 8
	mul     $s2, $s2, $s1
	jr	$ra
	
	else:
	div $s0, $t1
	mfhi $s1
	mflo $s0
	jal mull
	lw	$ra, 0($sp)
	lw	$s1, 4($sp)
	addi	$sp, $sp, 8
	mul     $s2, $s2, $s1
	jr	$ra

