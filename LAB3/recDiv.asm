

recursiveDivision: 
#assuming we get values in $v0 and $v1
addi $sp, $sp, -12
sw $s1, 8($sp)
sw $s0, 4($sp)
sw $ra, 0($sp)
move $s0, $v0
move $s1, $v1
addi $a0, $0 ,-1
jal rec
lw $ra, 0($sp)
lw $s0, 4($sp)
lw $s1, 8($sp)
addi $sp, $sp, 12
jr	$ra
	rec:
	addi	$sp, $sp, -8
	sw	$s0, 4($sp)
	sw	$ra, 0($sp)
	bgez	$s0, else
	move $a1, $s0
	add $a1, $a1, $s1
	addi	$sp, $sp, 8
	jr	$ra
	else:
	sub	$s0, $s0, $s1
	jal	rec
	lw	$ra, 0($sp)
	lw	$s0, 4($sp)
	addi	$sp, $sp, 8
	addi	$a0, $a0, 1
	jr	$ra

