.data
prompt: .asciiz "Introduza um número: \n"
result: .asciiz "o fatorial do número é: "
.text

.globl main

main: 
	la $a0, prompt
	li $v0, 4
	syscall
	
	li $v0, 5
	syscall
	
	move $a0, $v0
	
	jal fatorial
	
	move $t3, $v0
	
	la $a0, result
	li $v0, 4
	syscall
	
	move $a0, $t3
	li $v0, 1
	syscall
	
	li $v0, 10
	syscall
	
fatorial:
	addi $t0, $a0, 0 #num 
	addi $t1, $t1, 1 #resultado = 1
	
loop:
	ble $t0, 0, exit
	mul $t1, $t1, $t0
	addi $t0, $t0, -1
	j loop 
	
exit:
	move $v0, $t1
	jr $ra	
	
	
	
