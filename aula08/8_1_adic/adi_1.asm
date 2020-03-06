.data

lista: .word 4,3,-2,1,27,45
print_str: .asciiz "O conteudo do Array é: \n"
traco: .asciiz " - "
.text
.globl main

main:
	la $a0, print_str
	li $v0, 4
	syscall
	
	la $t1, lista #armazenar endereço da lsita 
	
	li $t0, 0 #i=0
	
for:
	lw $t3, 0($t1) #list[i]
	
	bge $t0, 6, Exit
	
	move $a0, $t3
	li $v0, 1
	syscall
	
	la $a0, traco
	li $v0, 4
	syscall
	
	addi $t1,$t1, 4
	addi $t0, $t0, 1
	j for
	
	
Exit:
	li $v0, 10
	syscall