.data
frase1: .asciiz "Insira a frase 1: \n"
espaco: .space 20
frase2: .asciiz "Insira a frase 2: \n"
numero_caracteres: .asciiz "O numero de caracteres da frase1 é: \n"
frase_concatenada: .asciiz "A frase concatenada é: "
.text

.globl main

main:
	la $a0, frase1
	li $v0, 4
	syscall
	
	li $a1, 20
	la $a0, espaco
	li $v0, 8
	syscall
	
	jal strlen
	
	move $t0, $v0
	
	la $a0, frase2
	li $v0, 4
	syscall
	
	li $a1, 20
	la $a0, espaco
	li $v0, 8
	syscall
	
	move $t1, $a0
	
	la $a0, numero_caracteres
	li $v0, 4
	syscall 
	
	move $a0, $t0
	li $v0, 1
	syscall
	
	li $v0,10
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