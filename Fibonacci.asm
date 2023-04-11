.data
mensaje: .asciiz "Serie Fibonacci:\n"
separador: .asciiz ", "
.text
.globl main
main:
    # Inicializar los dos primeros números de la serie
    li $s0, 0 # Primer número
    li $s1, 1 # Segundo número
    
    # Mostrar mensaje de la serie Fibonacci
    la $a0, mensaje # Cargar la dirección del mensaje
    li $v0, 4 # Imprimir cadena
    syscall
    
    # Imprimir los primeros dos números
    li $v0, 1 # Imprimir entero
    move $a0, $s0
    syscall
    la $a0, separador # Imprimir separador
    li $v0, 4
    syscall
    li $v0, 1
    move $a0, $s1
    syscall
    la $a0, separador # Imprimir separador
    li $v0, 4
    syscall
    
    # Generar el resto de la serie
    li $t0, 8 # Contador del bucle while
    li $t1, 3 # Posición del número actual en la serie
    
    while:
        # Generar el siguiente número en la serie
        add $t2, $s0, $s1 # $t2 = $s0 + $s1
        move $s0, $s1 # $s0 = $s1
        move $s1, $t2 # $s1 = $t2
        
        # Imprimir el número actual
        li $v0, 1
        move $a0, $t2
        syscall
        
        # Imprimir separador si no es el último número
        bne $t1, 10, else
        j fin
        else:
            la $a0, separador
            li $v0, 4
            syscall
        
        # Incrementar el contador y la posición del número actual
        addi $t1, $t1, 1
        addi $t0, $t0, -1
        
        # Verificar si se han generado suficientes números
        bne $t0, $zero, while
    
    fin:
    # Terminar programa
    li $v0, 10
    syscall
