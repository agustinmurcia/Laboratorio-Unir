.data
mensaje:  .ascii	 "Favor ingrese un numero: "

line:	  .asciiz 	 "\n"	# line tomara un salto de línea

.text 
.globl main		

main:

la $a0 mensaje		# carga cadena mensaje en $a0
li $v0 4		# carga $v0 a 4: permite mostrar una cadena
syscall
li $v0 5		# carga $v0 a 5: permite leer un entero
syscall			# llamada al sistema
move $t0 $v0		# mueve al registrador $t0 el valor leido

la $a0 mensaje		# carga cadena number2 en $a0
li $v0 4		# carga $v0 a 4: permite mostrar una cadena
syscall
li $v0 5
syscall
move $t1 $v0

la $a0 mensaje		# carga cadena number3 en $a0
li $v0 4		# carga $v0 a 4: permite mostrar una cadena
syscall
li $v0 5
syscall
move $t2 $v0

sle $t3 $t0 $t1		# compara if($t0 <= $t1)
beq $t3 $zero elseB	# compara if($t3 == 0)
sle $t3 $t0 $t2
beq $t3 $zero elseB
move $a0 $t0
j print			# hace un salto al label print

elseB:
slt $t3 $t1 $t0		# compara if($t1 < $t0)
beq $t3 $zero elseC
sle $t3 $t1 $t2
beq $t3 $zero elseC
move $a0 $t1
j print

elseC:
move $a0 $t2
j print

print:
		
li $v0 1		# carga $v0 a 1: permite mostrar un entero
syscall



li $v0 10	
syscall			# salida

