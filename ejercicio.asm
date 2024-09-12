	JMP start	        ; Saltar al inicio de la ejecución

num1:	DB 5	        ; Primer número
num2:	DB 3	        ; Segundo número
sum:	DB 0	        ; Aquí se almacenará la suma

start:
	MOV A, [num1]	    ; Mover el valor de num1 al registro A
	ADD A, [num2]	    ; Sumar el valor de num2 al registro A
	MOV [sum], A	    ; Guardar el resultado de la suma en la variable sum

	MOV C, sum          ; Apuntar al resultado
	MOV D, 232	        ; Apuntar a la salida (puerto o memoria)
	CALL print_num      ; Llamar a la rutina para imprimir el número

	HLT	                ; Detener la ejecución

print_num:		        ; Rutina para imprimir un número (conversión simple de dígitos)
	PUSH A
	MOV A, [C]	        ; Cargar el valor del número
	ADD A, '0'	        ; Convertir el valor a su equivalente ASCII
	MOV [D], A	        ; Imprimir el carácter
	INC D
	POP A
	RET