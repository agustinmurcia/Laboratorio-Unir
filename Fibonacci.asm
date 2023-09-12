.data
fib:	.word  0 : 29				# Arreglo de palabras que encierran valores de Fibonacci.
size:	.word 29				# Tamaño del arreglo.

.text
	la 	$s0, fib			# Carga direción del arreglo.
	la 	$s5, size			# carga dirección del tamaño de la variable.
	lw 	$s5, 0($s5)			# Carga el tamaño del arreglo
	
	li 	$s2, 1				# El numero 1 es el valor conocido y primer y segundo numero de Fibonacci.
	sw 	$s2, 0($s0)			# F(0) = 1
	sw 	$s2, 4($s0)			# F(1) = F(0) = 1
	addi 	$s1, $s5, -2			# Contador para el bucle sera de -2
	
# Repita el calculo de cada numero de Fibonacci usando los dos numeros anteriores.

loop:
	lw	$s3, 0($s0)			# Obtiene el valor del arreglo F(n-2)
	lw	$s4, 4($s0)			# Obtiene el valor del arreglo F(n-1)
	add	$s2, $s3, $s4			# F(n) = F(n-1) + F(n-2)
	sw 	$s2, 8($s0)			# Almacenar en arreglo, lo recien calculado.
	addi	$s0, $s0, 4			# Incrementar la direccion al almacenamiento de numeros de Fibonacci ahora conocidos.
	addi	$s1, $s1, -1			# Contador de bucle decremental.
	bgtz	$s1, loop			# Repita mientras no finalice.

# Los numeros de FIbonacci se calculan y guardan en un arreglo, imprimir entonces.

	la 	$a0, fib			# Primer argumento a imprimir (Arreglo)
	add 	$a1, $zero $s5			# Segundo argumento a imprimir (Tamaño)
	jal	print				# Llamado a imprimir rutina.
	
# Finlización

	li	$v0, 10				# Llamada de salida.
	syscall					# salida.	

#####################################################################################################################################

# Subrutina para imprimir los numeros en linea.

.data

space:	.asciiz " "				# Espacio de inseción entre numeros.
head: 	.asciiz "Los numeros son: \n"

.text

print:	add $t0, $zero, $a0			# Iniciando arreglo de direcciones y datos a ser impresos.
	add $t1, $zero, $a1			# Inicializando el bucle de conteo para el tamaño del arreglo.
	la  $a0, head				# Cargar direciones de la cadena de caracteres a imprimir.
	li  $v0, 4				# Especificar servicios de la cadena de impresion.
	syscall
	
out:	lw $a0, 0($t0)				# Carga el integrado para imprimir el actual numero de Fibonacci.
	li $v0, 1				# Especificar servicio integrado de impresion.
	syscall					# Imprimir numero de Fibonacci
	
	la $a0, space				# Carga espacios de direcciones para llamada.
	li $v0, 4				# Especificar servicios de la cadena de impresion.
	syscall
	
	addi $t0, $t0, 4			# Increment las direcciones de datos  ser impreso.
	addi $t1, $t1, -1			# Decrementa el bucle de conteo.
	bgtz $t1, out				#repetir mientras no finalice.
	
	jr   $ra				# Retorno a subrutina.
	
# Fin de la subrutina para imprimir numeros en linea.
	