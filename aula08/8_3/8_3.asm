.data
input: .space 40
texto2: .asciiz "Introduza a string: "
resultado: .asciiz "O número de caracteres numéricos: "

.text
.globl main
	
main:
	la $a0, texto2
	li $v0, 4
	syscall
	
	li $a1, 40
	la $a0, input
	li $v0, 8
	syscall
	
	li $t5, 0 #contador n = 0
	
	move $t0, $a0 #mover endereço da string para $t0
	li $t7, 0 #i=0
	
for:
	addu $t3, $t0, $t7 #guardar endereço da string[i] em $t0
	lb $t1, 0($t3) #valor da string[i] guardado em $t1
	beq $t1, '\0', exit #acabando a string vai para exit
	bgt $t1, '9', case
	blt $t1, '0', case
	addi $t5, $t5, 1 #n++
	
case: 
	addi, $t7, $t7, 1 #i++
	
	j for
	
exit: 
	la $a0, resultado
	li $v0, 4
	syscall
	
	move $a0, $t5
	li $v0, 1
	syscall
	
	

	
