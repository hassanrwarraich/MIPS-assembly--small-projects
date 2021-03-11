.data
enter: .asciiz "enter 1st number"
enter2: .asciiz "enter second number"
sol: .asciiz "solution is:"

.text
.globl main
main: 
#take input
li $v0, 4
la $a0, enter
syscall
		
li $v0, 5
syscall
move $t0, $v0

li $v0, 4
la $a0, enter2
syscall	

li $v0, 5
syscall
move $t1, $v0

#calculating results
sub $t2, $t0, $t1
andi $t3, $t2, 15

#displaying reults
li $v0, 4
la $a0, sol
syscall

li  $v0, 1     
move $a0, $t3     
syscall
