.data 
	prompt: .asciiz  "Introduza um numero\n"
	str: .asciiz "-"
	fim: .asciiz "\nfim!"
	
.text

.globl main

main:
	la $a0, prompt
	li $v0, 4
	syscall
	
	li $v0, 5
	syscall
	
	li $t1, 0
	move $t0, $v0
	
loop:	
	bge $t1, $t0, exit
	
	la $a0, str
	li $v0, 4
	syscall 
	
	addi $t1, $t1, 1
	
	j loop
	
exit: 
	la $a0, fim
	li $v0, 4
	syscall
	
	
