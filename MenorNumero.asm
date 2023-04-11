.data
mensaje: .asciiz "El numero menor es: "
.text
.globl main
main:
    # Cargar los tres números
    li $s0, 6 # Primer número
    li $s1, 3 # Segundo número
    li $s2, 8 # Tercer número
    
    # Encontrar el número mínimo de los dos primeros números
    blt $s0, $s1, minimo
    move $t0, $s1 # $s1 es menor
    j siguiente
minimo:
    move $t0, $s0 # $s0 es menor
    
siguiente:
    # Encontrar el número menor de los tres números
    blt $t0, $s2, menor
    move $t1, $s2 # $s2 es menor que el valor actual de $t0
    j fin
menor:
    move $t1, $t0 # El número mínimo de los dos primeros es menor que $s2
    
fin:
    # Mostrar el resultado
    la $a0, mensaje # Cargar la dirección del mensaje
    li $v0, 4 # Imprimir cadena
    syscall
    
    move $a0, $t1 # Cargar el número menor
    li $v0, 1 # Imprimir entero
    syscall
    
    li $v0, 10 # Terminar programa
    syscall
