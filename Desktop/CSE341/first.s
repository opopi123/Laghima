.globl main
.globl debug
.data

str: .asciiz "the answer should be 15. The answer is"
var1: .word 15

.text
main:
	li $v0, 4	#loads system call code 4 which is print string
	la  $a0, str 	#loads the address of str into $a0 for printing
	syscall

	li $v0, 1	#loads system call code 1 which is print int
	li $t0, 10	#loads integer 10 into the $t0 register
debug:	add $t1, $t0, 5	#adds $st0 to 5 and stores it in register $t1
	#lb $a0, 0($t1)	#loads immediate of $t1 to $a0 readying it for print int
	move $a0 $t1
	syscall

	li $v0, 10
	syscall

