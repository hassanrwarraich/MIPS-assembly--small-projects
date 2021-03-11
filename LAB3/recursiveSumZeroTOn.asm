#	Find summation of number from 0 to n recursively. n >= 0.
# sum(n)= n + sum(n-1)
#	int sum(int n)
#	{ if (n=0)
#		return (0);
#	  else
#		return (n + sum (n-1));
#	}
	
	.text
	li	$a0, 3
	jal	sumRecursive
	
	move	$a0, $v0
	li	$v0, 1
	syscall
	
	li	$v0, 10
	syscall
#==========================================
sumRecursive:
	addi	$sp, $sp, -8
	sw	$a0, 4($sp)
	sw	$ra, 0($sp)
# 	if (n > 0) go to else
	bne	$a0, $zero, else
	addi	$sp, $sp, 8
	addi	$v0, $zero, 0
	jr	$ra
else:
	addi	$a0, $a0, -1
	jal	sumRecursive
	lw	$ra, 0($sp)
	lw	$a0, 4($sp)
	addi	$sp, $sp, 8
	add	$v0, $v0, $a0
	jr	$ra
	
	
	