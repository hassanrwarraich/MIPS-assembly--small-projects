#a0 gets the adress a1 and a2 range return in v1 adress and v0 value
FindSumInRange:
addi $sp, $sp, -24
sw $s1, 20($sp)
sw $s0, 16($sp)
sw $t2, 12($sp)
sw $t1, 8($sp)
sw $t0, 4($sp)
sw $ra, 0($sp)

move $t0, $a0
move $t1, $a1
move $t2, $a2
move $t3, $a0
addi $s1, $0, 0
jal found
move $v0, $s1
move $v1, $t3

lw $ra, 0($sp)
lw $t0, 4($sp)
lw $t1, 8($sp)
lw $t2, 12($sp)
lw $s0, 16($sp)
lw $s1, 20($sp)
addi $sp, $sp, 24
jr $ra

found:
	addi	$sp, $sp, -4
	sw	$ra, 0($sp)
	
	beq $t0, $0, Kar
	j Mul
	Kar:
	addi $sp, $sp, 4
	jr $ra
	Mul:
	lw $s0, 4($t0)
	bgt $s0, $t2, Lah
	blt $s0, $t1, Lah
	add $s1, $s1, $s0
	Lah:
	lw $t0, 0($t0)
	jal found
	
	lw	$ra, 0($sp)
	addi	$sp, $sp, 4
	jr $ra