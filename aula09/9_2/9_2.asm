.data
espaco: .space 40
prompt: .asciiz "Introduza uma string \n"
resultado: .asciiz "O numero de caracteres da string é: "

.text

.globl main

main: 
	la $a0, prompt
	li $v0, 4
	syscall
	
	li $v0, 8
	la $a0, espaco
	la $a1, 40
	syscall
	
	jal strlen 
	
	move $t5, $v0
	
	la $a0, resultado
	li $v0, 4
	syscall
	
	move $a0, $t5
	li $v0, 1
	syscall
	
	li $v0, 10
	syscall
	
strlen:
	move $t0, $a0
	li $t1, 0 #int i = 0
	li $t2, 0 #int n = 0
	
loop:
	addu $t3, $t0, $t1 
	lb $t4, 0($t3) #string[i]
	beq $t4, '\0', Exit
	addi $t2, $t2, 1
	addi $t1, $t1, 1
	j loop
	
Exit:
	subi $t2, $t2, 1 #bug do programa conta o enter
	move $v0, $t2
	jr $ra
	
	
	