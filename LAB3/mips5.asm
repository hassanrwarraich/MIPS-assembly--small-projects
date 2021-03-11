#assuming $a0 gets address and a1 number
SwapNodes:
addi $sp, $sp, -40
sw $t6, 36($sp)
sw $t5, 32($sp)
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
	beq $s0, $0, last
	lw $t0, 0($s0)
	beq $t0, $0, last
	beq $s1, 1, pehla
	lw $t0, 0($t0)
	move $t3, $a0
	lw $s0, 0($s0)
	addi $s1, $s1, -1
	j dosra
	pehla:
	lw $t1, 0($s0)
	lw $t2, 0($t0)
	sw $t2, 0($s0)
	sw $s0, 0($t0)
	move $a0, $t0
	j teesra
	
	dosra:
	ble $s1, 1, chotha
	addi $s1, $s1, -1
	lw $s0, 0($s0)
	lw $t3, 0($t3)
	lw $t0, 0($t0)
	beq $t0, $0, last
	j dosra
	chotha:
	lw $t4, 0($t3)
	lw $t5, 0($s0)
	lw $t6, 0($t0)
	sw $t6, 0($s0)
	sw $t4, 0($t0)
	sw $t5, 0($t3) 
	j teesra
	
teesra:
	addi $v0, $0, 0
	j panch
last:
	addi $v0, $0, -1
panch:
move $v1, $a0
lw $ra, 0($sp)
lw $t0, 4($sp)
lw $t1, 8($sp)
lw $t2, 12($sp)
lw $s0, 16($sp)
lw $s1, 20($sp)
lw $t3, 24($sp)
lw $t4, 28($sp)
lw $t5, 32($sp)
lw $t6, 36($sp)
addi $sp, $sp, 40
jr $ra