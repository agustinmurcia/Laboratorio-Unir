.data
mensaje:  .ascii	 "El número mayor es: "
line:	  .asciiz 	 "\n"			# line tomara un salto de línea
d: .word 27, 87, 23				# Arreglo.
n: .word 3					# Tamaño del arreglo.
mayor: .word 0					# Resultdo.
	
.text
.globl main 
		
	main:
		la $a0 mensaje			# carga cadena mensaje en $a0
		li $v0 4			# carga $v0 a 4: permite mostrar una cadena
		syscall				# Llamada a sistema
		li $t0, 0			# Carga de variable
		li $s0, 0			# Carga de resultado de la variable
		lw $s1, n			# Tamaño dela variable
		m1: bge $t0, $s1, m3		# Compracion mayor o igul entre registros.
		mul $t1, $t0, 4			# Lenguaje de desplazamiento con la palabra reservada.
		lw $t2, d($t1)			# Cargamos la variable t1 en t2
		ble $t2, $s0, m2		# Comparacion menor o igual entre registros
		move $s0, $t2			# Mover registros.
		m2: addi $t0, $t0, 1		# Increment las direcciones de datos  a ser impreso.
		b m1 				# 
		m3: move $a0, $s0		# mueve al registrador $a0 el valor leido
		
		li $v0, 1			# carga $v0 a 1: permite mostrar un entero
		syscall				# Llamda al sistema.
		
	li $v0, 10				# Salida de la rutina 
	syscall					# Salida.
	
	
	
	
	
	