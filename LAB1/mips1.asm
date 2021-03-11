.data
string: .space 80
notpalind: .asciiz "not palindromic!"
palind: .asciiz "palindromic!"
enter: .asciiz "enter string: "

.text
.globl main
main:  

#taking string
li $v0, 4
la $a0, enter
syscall

li  $v0, 8          
la  $a0, string
li  $a1, 20
syscall

#making counters
add $t0, $zero, $zero   
add $t1, $zero, $zero 

#finding the length
length:
    lb  $s0, string($t0) 
    beq $s0, '\0', NEXTCHECK 
    add $t0, $t0, 1 
    add $t1, $t1, 1 
j length
   
NEXTCHECK:
add $t0, $zero, 0
sub $t2, $t1, $t0   
sub $t2, $t2, 2  
div $t5, $t2, 2
add $t5, $t5, 1
add $t3, $0, 0 
#checking if palindrom or not
palindrom: 
     
    lb  $s0, string($t0)   
    lb  $s1, string($t2) 
    add $t0, $t0, 1 
    sub $t2, $t2, 1 
    add $t3, $t3, 1
    
    beq $t5, $t0, pand 
    beq $s0, $s1, palindrom
    bne $s0, $s1, ELSE
    
    j palindrom
#display msg for not a palindrom
 ELSE:
    li  $v0, 4              
    la  $a0, notpalind
    syscall
    j EXIT   
#display msg for a palindrom
pand:
li  $v0, 4          
la  $a0, palind
syscall
j EXIT

EXIT:
li  $v0, 10
syscall
