.data
texto: .asciiz "o Edu e gay 11"

.text
main:

la $t0, texto #armazenar o endereço da string texto 

loop:
    lb $t1, 0($t0) #ler o texto[i]
    beq $t1, '\0', exit #se chegar ao fim da string, vai para o exit
    blt $t1, 'a', case 
    bgt $t1, 'z', case #se for menor que 'a' ou maior que 'z' é porque ou é numero ou letra maiuscula, logo nao se vai fazer nada
    sub $t1, $t1, 32 #neste caso é letra minuscula, logo segundo o codigo ascii, subtraindo 32, obtemos a mesma letra em maiuscula
    sb $t1, 0($t0) #faz replace do texto[i] pela mesma letra mas maiuscula 
    addi $t0, $t0, 1 #incrementa 1 (i++)
    j loop

case: #ao entra aqui, nao faz nada, só incrementa
    addi $t0, $t0, 1
    j loop

exit:  
    la $a0, texto
    li $v0, 4
    syscall
 
 
