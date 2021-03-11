##	-	-IMPORTANT-	    -
##	The general structure;
##
##		-Main menu
##		-LinkedList creater
## 		-LinkedList displayer
## 		
##is given to you, necessary functions are empty, you have to ##fill them 
##	efficiently for lab3 part 1.
##	Necessary register defined. 	
##IF YOU READ INSTRUCTIONS CAREFULLY YOU FIGURE OUT THAT IT IS ##NOT DIFFICULT TO HANDLE
###############################################################
##
##	_Lab3main - a program that calls linked list utility functions,

##		 depending on user selection.  _Lab3main outputs a 

##		message, then lists the menu options and get the user

##		selection, then calls the chosen routine, and repeats

##

##	a0 - used for input arguments to syscalls and for passing the 

##		pointer to the linked list to the utility functions

##	a1 - used for 2nd input argument to the utility functions that need it

##	a2 - used for 3rd input argument to the utility functions that need it

##	v0 - used for input and output values for syscalls

##	s0 - used to safely hold the pointer to the linked list

##	s1 - used to hold the user input choice of which menu option			


##   


##      linked list consists of 0 or more elements, in 


##		dynamic memory segment (i.e. heap)


##	elements of the linked list contain 2 parts:


##		at address z: pointerToNext element (unsigned integer), 4 bytes


##		at address z+4: value of the element (signed integer), 4 bytes


##

##

###################################################################

#
#		text segment			


####################################################################

.text		
.globl _Lab3main
 
 
_Lab3main:		# execution starts here
	li $s0, 0	# initialize pointer storage register to 0 (=Null pointer)
	la $a0,msg110	# put msg110 address into a0
	li $v0,4	# system call to print
	syscall		#   out the msg110 string


##	Output the menu to the terminal,

##	   and get the user's choice


MenuZ:	
	la $a0,msg111	# put msg111 address into a0
	li $v0,4	# system call to print
	syscall		#   out the msg111 string
	la $a0,msg112	# put msg112 address into a0
	li $v0,4	# system call to print
	syscall		#   out the msg112 string
	la $a0,msg113	# put msg113 address into a0
	li $v0,4	# system call to print
	syscall		#   out the msg113 string
	la $a0,msg114	# put msg114 address into a0
	li $v0,4	# system call to print
	syscall		#   out the msg114 string
	la $a0,msg115	# put msg115 address into a0
	li $v0,4	# system call to print
	syscall		#   out the msg115 string
	la $a0,msg116	# put msg116 address into a0
	li $v0,4	# system call to print
	syscall		#   out the msg116 string
	la $a0,msg117	# put msg117 address into a0
	li $v0,4	# system call to print
	syscall		#   out the msg117 string
	la $a0,msg133	# put msg117 address into a0
	li $v0,4	# system call to print
	syscall		#   out the msg117 string
	la $a0,msg134	# put msg117 address into a0
	li $v0,4	# system call to print
	syscall		#   out the msg117 string
	la $a0,msg135	# put msg117 address into a0
	li $v0,4	# system call to print
	syscall		#   out the msg117 string
	la $a0,msg136	# put msg117 address into a0
	li $v0,4	# system call to print
	syscall		#   out the msg117 string
	la $a0,msg118	# put msg118 address into a0
	li $v0,4	# system call to print
	syscall		#   out the msg118 string


EnterChoice:
	la $a0,msg119	# put msg119 address into a0
	li $v0,4	# system call to print
	syscall		#   out the msg119 string
	li $v0,5	# system call to read  
	syscall		# in the integer
	move $s1, $v0	# move choice into $s1


##	T1 through T7no use an if-else tree to test the user choice (in $s1)

##	   and act on it by calling the correct routine



T1:	bne $s1,1, T2	# if s1 = 1, do these things. Else go to T2 test
	jal create_list
	move $s0, $v0	# put pointer to linked list in s0 for safe storage
	j MenuZ		# task is done, go to top of menu and repeat


T2:	bne $s1,2, T3	# if s1 = 2, do these things. Else go to T3 test
	move $a0, $s0	# put pointer to linked list in a0 before the call
	jal display_list 
	j MenuZ		# task is done, go to top of menu and repeat


T3:	bne $s1,3, T4	# if s1 = 3, do these things. Else go to T4 test
	la $a0,msg120	# put msg120 address into a0
	li $v0,4	# system call to print
	syscall		#   out the msg120 string
	li $v0,5	# system call to read  
	syscall		#   in the integer
	move $a1, $v0	# put integer value into a1 before the call
	move $a0, $s0
	addi $a2, $0, 6	# put pointer to linked list in a0 before the call
	jal Insert_end
	move $s0, $v1
	j ReportZ 


T4:	bne $s1,4, T5	# if s1 = 4, do these things. Else go to T5 test
	la $a0,msg120	# put msg120 address into a0
	li $v0,4	# system call to print
	syscall		#   out the msg120 string
	li $v0,5	# system call to read  
	syscall		#   in the value
	move $a1, $v0	# put integer value into a1 before the call
	la $a0,msg124	# put msg124 address into a0
	li $v0,4	# system call to print
	syscall		#   out the msg124 string
	li $v0,5	# system call to read  
	syscall		#   in the position number
	move $a2, $v0	# put position number into a2 before the call
	move $a0, $s0	# put pointer to linked list in a0 before the call
	jal Insert_n
	move $s0, $v1	# put the (possibly revised) pointer into s0
	j ReportZ


T5:	bne $s1,5, T6	# if s1 = 5, do these things. Else go to T6 test
	la $a0,msg125	# put msg125 address into a0
	li $v0,4	# system call to print
	syscall		#   out the msg125 string
	li $v0,5	# system call to read  
	syscall		#   in the position number
	move $a1, $v0	# put position number into a1 before the call
	move $a0, $s0	# put pointer to linked list in a0 before the call
	jal Delete_n
	move $s0, $v1	# put the (possibly revised) pointer into s0
	j ReportZ


T6:	bne $s1,6, T7	# if s1 = 6, do these things. Else go to T7 test
	la $a0,msg126	# put msg126 address into a0
	li $v0,4	# system call to print
	syscall		#   out the msg126 string
	li $v0,5	# system call to read  
	syscall		#   in the value x
	move $a1, $v0	# put x value into a1 before the call
	move $a0, $s0	# put pointer to linked list in a0 before the call
	jal Delete_x
	move $s0, $v1	# put the (possibly revised) pointer into s0
	j ReportZ
	
T7:	bne $s1,7, T8	# if s1 = 6, do these things. Else go to T7 test
	la $a0,msg137	# put msg126 address into a0
	li $v0,4	# system call to print
	syscall		#   out the msg126 string
	li $v0,5	# system call to read  
	syscall		#   in the value x
	move $a1, $v0	# put x value into a1 before the call
	move $a0, $s0	# put pointer to linked list in a0 before the call
	jal AddNodes
	move $s0, $v1	# put the (possibly revised) pointer into s0
	j ReportZ
	
T8:	bne $s1,8, T9	# if s1 = 6, do these things. Else go to T7 test
	la $a0,msg138	# put msg126 address into a0
	li $v0,4	# system call to print
	syscall		#   out the msg126 string
	li $v0,5	# system call to read  
	syscall		#   in the value x
	move $a1, $v0	# put x value into a1 before the call
	move $a0, $s0	# put pointer to linked list in a0 before the call
	jal SwapNodes
	move $s0, $v1	# put the (possibly revised) pointer into s0
	j ReportZ
	
T9:	bne $s1,9, T10	# if s1 = 6, do these things. Else go to T7 test
	la $a0,msg139	# put msg126 address into a0
	li $v0,4	# system call to print
	syscall		#   out the msg126 string
	li $v0,5	# system call to read  
	syscall		#   in the value x
	move $a1, $v0	# put x value into a1 before the call
	bne $s1,9, T10	# if s1 = 6, do these things. Else go to T7 test
	la $a0,msg140	# put msg126 address into a0
	li $v0,4	# system call to print
	syscall		#   out the msg126 string
	li $v0,5	# system call to read  
	syscall		#   in the value x
	move $a2, $v0
	 
	move $a0, $s0	# put pointer to linked list in a0 before the call
	jal FindSumInRange	
		
	move $s0, $v1	# put the (possibly revised) pointer into s0
	j ReportZ
	
T10:	bne $s1,10, T11
	jal create_list
	move $s6, $v0	# put pointer to linked list in s0 for safe storage
	jal create_list
	move $s7, $v0
	move $a1, $s6	# put x value into a1 before the call
	move $a0, $s7	# put pointer to linked list in a0 before the call
	jal CountCommonValues
	la $a0,msg142	
	li $v0,4	
	syscall
	move $a0, $v1	# put the (possibly revised) pointer into s0
	li $v0, 1
	syscall
	la $a0,msg85	
	li $v0,4	
	syscall
	j ReportZ
T11:	bne $s1,11, T7no	# if s1 = 7, do these things. Else go to T7no
	la $a0,msg127	# put msg127 address into a0
	li $v0,4	# system call to print
	syscall		#   out the thank you string
	li $v0,10
	# the exit syscall is 10
	syscall		# goodbye...


T7no:	
	la $a0,msg128	# put msg128 address into a0
	li $v0,4	# system call to print
	syscall		#   out the msg128 string
	j EnterChoice	# go to the place to enter the choice


##	ReportZ determines if the return value in $v0 is

##	   0 for success, -1 for failure, or other (invalid)


ReportZ: beq $v0,0,Succeed
	 beq $v0,-1,Fail


Invalid: la $a0,msg130  # put msg130 address into a0
	 li $v0,4	# system call to print
	 syscall	#   out the invalid message
	 j MenuZ	# task is done, go to top of menu and repeat

	
Succeed: la $a0,msg131  # put msg131 address into a0
	 li $v0,4	# system call to print
	 syscall	#   out the success message
	 j MenuZ	# task is done, go to top of menu and repeat

Fail:	 la $a0,msg132  # put msg132 address into a0
	 li $v0,4	# system call to print
	 syscall	#   out the failure message
	 j MenuZ	# task is done, go to top of menu and repeat


###################################################################

##

#### create_list - a linked list utility routine, 

##			which creates the contents, element 

##			by element, of a linked list

##

##	a0 - used for input arguments to syscalls

##	s0 - holds final value of pointer to linked list (to be put in v0 at exit)

##	t0 - temp value, holds # of current element being created; is loop control variable

##	t1 - temp value, holds n+1, where n is the user input for length of list

##	s1 - value of pointer to current element

##	s2 - value of pointer to previous element

##	v0 - used as input value for syscalls (1, 4, 5 and 9),

##		but also for the return value, to hold the address of the 

##		first element in the newly-created linked list

##	sp - stack pointer, used for saving s-register values on stack

##

##################################################################   


create_list:		# entry point for this utility routine
	addi $sp,$sp,-12 # make room on stack for 3 new items
	sw $s0, 8 ($sp) # push $s0 value onto stack
	sw $s1, 4 ($sp) # push $s1 value onto stack
	sw $s2, 0 ($sp) # push $s2 value onto stack
	la $a0, msg91	# put msg91 address into a0
	li $v0,4	# system call to print
	syscall		#   out the msg91 string
	la $a0, msg92	# put msg92 address into a0
	li $v0,4	# system call to print
	syscall		#   out the msg92 string
	li $v0,5	# system call to read  
	syscall		#   in the integer
	addi $t1,$v0,1	# put limit value of n+1 into t1 for loop testing
	bne $v0, $zero, devam90 #if n = 0, finish up and leave
	la $a0, msg93	# put msg93 address into a0
	li $v0,4	# system call to print
	syscall		#   out the msg93 string
	move $s0, $zero # the pointer to the 0-element list will be Null
	j Finish90	# 
	


devam90:		# continue here if n>0
	li $t0, 1	# t=1
	li $a0, 16	# get 16 bytes of heap from OS
	li $v0, 9	# syscall for sbrk (dynamic memory allocation
	syscall
	move $s0, $v0	# the final value of list pointer is put in $s0
	move $s1, $v0	# the pointer to the current element in the list is put in $s1
	j Prompt90	# 
		


Top90:	move $s2, $s1	# pointer to previous element is updated with pointer to current element
	sll $t2,$t0,4	# $t2 is 16 x the number of the current element ($t0)
	move $a0, $t2	# get $t2 bytes of heap from OS
	li $v0, 9	# syscall for sbrk (dynamic memory allocation)
	syscall
	move $s1, $v0	# the pointer to the new current element in the list is put in $s1
	sw $s1, 0($s2)	# the previous element's pointerToNext is loaded with the new element's address



Prompt90: la $a0,msg94	# put msg94 address into a0
	li $v0,4	# system call to print
	syscall		#   out the msg94 string
	move $a0, $t0	# put x (the current element #) in $a0
	li $v0,1	# system call to print
	syscall		#   out the integer in $a0
	la $a0, msg95	# put msg95 address into a0
	li $v0,4	# system call to print
	syscall		#   out the msg95 string
	li $v0, 5	# system call to read in  
	syscall		#   the integer from user
	sw $v0, 4($s1) 	# store the value from user into
			#   current element's value part
	addi $t0,$t0,1	# x = x+1  increment element count
	bne $t0,$t1, Top90 # If x != n+1, go back to top of loop and iterate again
	sw $0,0($s1)	# Put Null value into pointerToNext part of last element in list

Finish90: move $v0,$s0	# put pointer to linked list in $v0 before return
	lw $s0, 8 ($sp) # restore $s0 value from stack
	lw $s1, 4 ($sp) # restore $s1 value from stack
	lw $s2, 0 ($sp) # restore $s2 value from stack
	addi $sp,$sp,12 # restore $sp to original value (i.e. pop 3 items)
	jr $ra		# return to point of call






##################################################################

#### display_list - a linked list utility routine, 

##			which shows the contents, element 

##			by element, of a linked list

##

##	a0 - input argument: points to the linked list, i.e. contains

##		the address of the first element in the list

##	s0 - current pointer, to element being displayed

##	s1 - value of pointerToNext part of current element

##	v0 - used only as input value to syscalls (1, 4, and 34)

##	sp - stack pointer is used, for protecting s0 and s1

##

################################################################# 

  



display_list:		# entry point for this utility routine
	addi $sp, $sp,-8 # make room on stack for 2 new items
	sw $s0, 4 ($sp) # push $s0 value onto stack
	sw $s1, 0 ($sp) # push $s1 value onto stack
	move $s0, $a0	# put the pointer to the current element in $s0
	la $a0, msg81	# put msg81 address into a0
	li $v0, 4	# system call to print
	syscall		#   out the msg81 string
	bne $s0, $zero, devam80	# if pointer is NULL, there is no list
	la $a0, msg82	# put msg82 address into a0
	li $v0, 4	# system call to print
	syscall		#   out the msg82 string
	j Return80	# done, so go home
	
devam80:		# top of loop	
	la $a0, msg83	# put msg83 address into a0
	li $v0, 4	# system call to print
	syscall		#   out the msg83 string
	lw $s1, ($s0)	# read the value of pointerToNext
	move $a0, $s1	# put the pointerToNext value into a0
	li $v0, 34	# system call to print out the integer 
	syscall		#   in hex format
	la $a0, msg84	# put msg84 address into a0
	li $v0, 4	# system call to print
	syscall		#   out the msg84 string
	lw $a0, 4($s0)	# read the value part, put into a0	
	li $v0, 1	# system call to print  	
	syscall		#   out the integer
	la $a0, msg85	# put msg85 address into a0
	li $v0, 4	# system call to print
	syscall		#   out the msg85 string (new line)
	
Top80:	beq $s1, $zero, Return80 # if pointerToNext is NULL, there are no more elements
	la $a0, msg86	# put msg86 address into a0
	li $v0, 4	# system call to print
	syscall		#   out the msg86 string
	move $s0, $s1	# update the current pointer, to point to the new element
	lw $s1, ($s0)	# read the value of pointerToNext in current element
	move $a0, $s1	# put the pointerToNext value into a0
	li $v0, 34	# system call to print out the integer 
	syscall		#   in hex format
	la $a0, msg84	# put msg84 address into a0
	li $v0, 4	# system call to print
	syscall		#   out the msg84 string
	lw $a0, 4($s0)	# read the value part, put into a0
	li $v0, 1	# system call to print  
	syscall		#   out the integer
	la $a0, msg85	# put msg85 address into a0
	li $v0, 4	# system call to print
	syscall		#   out the msg85 string (new line)
	j Top80		# go back to top of loop, to test and 
			#   possibly iterate again

Return80:	
	la $a0, msg89	# put msg89 address into a0
	li $v0, 4	# system call to print
	syscall		# out the msg89 string
	lw $s0, 4 ($sp) # restore $s0 value from stack
	lw $s1, 0 ($sp) # restore $s1 value from stack
	addi $sp, $sp, 8 # restore $sp to original value (i.e. pop 2 items)
	jr $ra		# return to point of call

#################################################
##	dummy routines for the 4 utilities which

##	  students should write for Lab3
###############################################
#

### Fill Those functions
Insert_end:
addi $sp, $sp, -24
sw $s1, 20($sp)
sw $s0, 16($sp)
sw $t2, 12($sp)
sw $t1, 8($sp)
sw $t0, 4($sp)
sw $ra, 0($sp)

move $s0, $a0
move $t2, $a0
move $t3, $a0
beq $t3,$0,hol
lw $t3, 0($t3)
move $s1, $a1
hig:
beq $t3, $0, hog
lw $s0, 0($s0)
lw $t3, 0($t3)
j hig
hog:
	li $a0, 16	# get 16 bytes of heap from OS
	li $v0, 9	# syscall for sbrk (dynamic memory allocation
	syscall
	move $t0, $v0
	lw $t1, 0($s0)
	sw $t1, 0($t0)
	sw $s1, 4($t0)
	sw $t0, 0($s0)
	j hon
hol:
	li $a0, 16	# get 16 bytes of heap from OS
	li $v0, 9	# syscall for sbrk (dynamic memory allocation
	syscall
	move $t0, $v0
	sw $0, 0($t0)
	sw $s1, 4($t0)
	move $v1, $t0
	j hzg	
hon:
move $v1, $t2
hzg:

lw $ra, 0($sp)
lw $t0, 4($sp)
lw $t1, 8($sp)
lw $t2, 12($sp)
lw $s0, 16($sp)
lw $s1, 20($sp)
addi $sp, $sp, 24
jr $ra



Insert_n :

addi $sp, $sp, -32
sw $t4, 28($sp)
sw $t3, 24($sp)
sw $s1, 20($sp)
sw $s0, 16($sp)
sw $t2, 12($sp)
sw $t1, 8($sp)
sw $t0, 4($sp)
sw $ra, 0($sp)

move $t0, $a0
move $t4, $a0
move $t1, $a1
move $t2, $a2
lw $t3, 0($t0)
peche:
	beq $t2, 2, agge
	beq $t3, $0, agge
	lw $t0, 0($t0)
	lw $t3, 0($t3)
	addi $t2, $t2, -1
	j peche
agge:	
	li $a0, 16	# get 16 bytes of heap from OS
	li $v0, 9	# syscall for sbrk (dynamic memory allocation
	syscall
	move $s0, $v0
	lw $s1, 0($t0)
	sw $s1, 0($s0)
	sw $t1, 4($s0)
	sw $s0, 0($t0)
	move $v1, $t4
	addi $v0, $0, 0
		
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

Delete_n:
	addi $sp, $sp, -24
sw $s1, 20($sp)
sw $s0, 16($sp)
sw $t2, 12($sp)
sw $t1, 8($sp)
sw $t0, 4($sp)
sw $ra, 0($sp)

addi $t2, $0, -1
oye:
	move $s0, $a0
	move $s1, $a1
	beq $s1, 1, hooo
	beq $s0 ,$0, oaa
	lw $t2, 0($s0)
	lw $t0, 0($s0)
	lw $t0, 0($t0)
	hoye:
	ble $s1, 2, dis
	beq $t0 ,$0, dis
	lw $s0, 0($s0)
	lw $t2, 0($t2)
	lw $t0, 0($t0)
	addi $s1, $s1, -1
	j hoye
dis:
	lw $t1, 0($t2)
	sw $t1, 0($s0)
	j hej
oaa:
	move $v1, $a0
	move $v0, $t2
	j heja
hej:
	move $v1, $a0
	addi $v0, $0, 0
	j heja
hooo:
	lw $a0, 0($a0)
	move $v1, $a0
	addi $v0, $0, 0
	j heja
heja:
lw $ra, 0($sp)
lw $t0, 4($sp)
lw $t1, 8($sp)
lw $t2, 12($sp)
lw $s0, 16($sp)
lw $s1, 20($sp)
addi $sp, $sp, 24
jr $ra



Delete_x:

addi $sp, $sp, -24
sw $s1, 20($sp)
sw $s0, 16($sp)
sw $t2, 12($sp)
sw $t1, 8($sp)
sw $t0, 4($sp)
sw $ra, 0($sp)
addi $t2, $0, -1
delNode:
	move $s0, $a0
	move $s1, $a1
	hihi:
	beqz $s0, end
	lw $t3, 4($s0)
	beq $t3, $s1, hello
	j hoho
	hello:
	lw $s0, 0($s0)
	lw $a0, 0($a0)
	addi $t2, $0, 0
	j hihi
	
	hoho:
	lw $t1, 0($s0)
	beqz $t1, end
	lw $t0, 4($t1)
	beq $t0, $s1, next
	
	prev:
	beqz $t1, end
	lw $t3, 4($t1)
	beq $t3, $s1, next
	lw $s0, 0($s0)
	lw $t1, 0($t1)
	j prev
	next:
	lw $t1, 0($t1)
	sw $t1, 0($s0)
	addi $t2, $0, 0
	j prev	
	
end:
	
	move $v1, $a0
	move $v0, $t2
	
lw $ra, 0($sp)
lw $t0, 4($sp)
lw $t1, 8($sp)
lw $t2, 12($sp)
lw $s0, 16($sp)
lw $s1, 20($sp)
addi $sp, $sp, 24
jr $ra



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
	beq $t0, $0, aexi
	beq $s1, 1, anex
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
la $a0,msg141	
li $v0,4	
syscall
move $a0,$s1	
li $v0,1	
syscall
la $a0,msg85	
li $v0,4	
syscall
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
addi $t2, $0, 0
move $s0, $a0
move $s1, $a1
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
################################################
#     	 	data segment			

#
#						
################################################
.data
msg81:	 .asciiz "This is the current contents of the linked list: \n"
msg82:   .asciiz "No linked list is found, pointer is NULL. \n"
msg83:   .asciiz "The first node contains:  pointerToNext = "
msg84:   .asciiz ", and value = "
msg85:   .asciiz "\n"
msg86:   .asciiz "The next node contains:  pointerToNext = "
msg89:   .asciiz "The linked list has been completely displayed. \n"
msg91:	 .asciiz "This routine will help you create your linked list. \n"
msg92:   .asciiz "How many elements do you want in your linked list? Give a non-negative integer value: 0, 1, 2, etc.\n"
msg93:   .asciiz "Your list is empty, it has no elements. Also, it cannot not be displayed. \n"
msg94:   .asciiz "Input the integer value for list element #"
msg95:   .asciiz ": \n"
msg110:  .asciiz "Welcome to the Lab3 program about linked lists.\n"
msg111:  .asciiz "Here are the options you can choose: \n"
msg112:  .asciiz "1 - create a new linked list \n"
msg113:  .asciiz "2 - display the current linked list \n"
msg114:  .asciiz "3 - insert element at end of linked list \n"
msg115:  .asciiz "4 - insert element into linked list at position n  \n"
msg116:  .asciiz "5 - delete element at position n from linked list \n"
msg117:  .asciiz "6 - delete element from linked list with value x \n"
msg118:  .asciiz "11 - exit this program \n"
msg119:  .asciiz "Enter the integer for the action you choose:  "
msg120:  .asciiz "Enter the integer value of the element that you want to insert:  "
msg124:  .asciiz "Enter the position number in the linked list where you want to insert the element:  "	
msg125:  .asciiz "Enter the position number in the linked list of the element you want to delete:  "
msg126:  .asciiz "Enter the integer value of the element that you want to delete:  "
msg127:  .asciiz "Thanks for using the Lab3 program about linked lists.\n"
msg128:  .asciiz "You must enter an integer from 1 to 7. \n"
msg130:  .asciiz "The return value was invalid, so it isn't known if the requested action succeeded or failed. \n"	
msg131:  .asciiz "The requested action succeeded. \n"
msg132:  .asciiz "The requested action failed. \n"
msg133:  .asciiz "7 - add two nodes \n"
msg134:  .asciiz "8 - swap two nodes \n"
msg135:  .asciiz "9 - find sum in range \n"
msg136:  .asciiz "10 - count common values \n"
msg137:  .asciiz "Enter index to add with next one:  "
msg138:  .asciiz "Enter index to swap with next one:  "
msg139:  .asciiz "Enter 1st integer:  "
msg140:  .asciiz "Enter 2nd integer:  "
msg141:  .asciiz "sum is:  "
msg142:  .asciiz "common values are:  "
##
## end of file Lab3main.txt
##SK
