#a0 and a1 give us two adresses of arrays and return in value in v1
CountCommonValues:
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

lw $s0, 0($a0)
lw $s1, 0($a1)
Punjab:
	beq $s0, $0, Kashmir
	beq $s1, $0, Kashmir
	lw $t0, 4($s0)
	lw $t1, 4($s1)
	beq $t0,$t1, Sindh
	bgt $t0,$t1,KPK
	lw $s0, 0($s0)
	j Punjab
	KPK:
	lw $s1, 0($s1)
	j Punjab
	
Sindh:
	addi $t2, $t2, 1
	Baloch:
	lw $s1, 0($s1)
	beq $s1, $0, Kashmir
	lw $t1, 4($s1)
	beq $t1, $t0, Baloch
	j Punjab
	
Kashmir:
	move $v1, $t2

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