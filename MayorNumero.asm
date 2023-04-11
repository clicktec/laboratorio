.data
mensaje: .asciiz "El numero mayor es: "
.text
.globl main
main:
    # Cargar los tres números
    li $s0, 6 # Primer número
    li $s1, 3 # Segundo número
    li $s2, 8 # Tercer número
    
    # Encontrar el número máximo de los dos primeros números
    bgt $s0, $s1, maximo
    move $t0, $s1 # $s1 es mayor
    j siguiente
maximo:
    move $t0, $s0 # $s0 es mayor
    
siguiente:
    # Encontrar el número mayor de los tres números
    bgt $t0, $s2, mayor
    move $t1, $s2 # $s2 es mayor
    j fin
mayor:
    move $t1, $t0 # El número máximo de los dos primeros es mayor que $s2
    
fin:
    # Mostrar el resultado
    la $a0, mensaje # Cargar la dirección del mensaje
    li $v0, 4 # Imprimir cadena
    syscall
    
    move $a0, $t1 # Cargar el número mayor
    li $v0, 1 # Imprimir entero
    syscall
    
    li $v0, 10 # Terminar programa
    syscall
