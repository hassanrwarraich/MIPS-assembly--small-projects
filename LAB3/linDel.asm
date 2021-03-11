#assuming $a0 gives pointer to list and $a1 position of node
AddNodes:  
addi $sp, $sp, -32
sw $t4, 28($sp)
sw $t3, 24($sp)
sw $s1, 20($sp)
sw $s0, 16($sp)
sw $t2, 12($sp)
sw $t1, 8($sp)
sw $t0, 4($sp)
sw $ra, 0($sp)

move $s0, $a0
move $s1, $a1
beq $s0, $0, aexi
lw $t0, 0($s0)
lub:
	beq $s1, 1, anex
	beq $t0, $0, aexi
	lw $s0, 0($s0)
	lw $t0, 0($t0)
	addi $s1, $s1, -1
	j lub
anex:
	lw $t1, 4($s0)
	lw $t2, 4($t0) 
	add $t2, $t2, $t1
	sw $t2, 4($s0)
	lw $t2, 0($t0)
	sw $t2, 0($s0)
	addi $v0, $0, 0
	j afin
aexi:
	addi $v0, $0, -1
afin:
move $v1, $a0
lw $ra, 0($sp)
lw $t0, 4($sp)
lw $t1, 8($sp)
lw $t2, 12($sp)
lw $s0, 16($sp)
lw $s1, 20($sp)
lw $t3, 24($sp)
lw $t4, 28($sp)
addi $sp, $sp, 32
jr $ra