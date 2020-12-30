	AREA	DisplayResult, CODE, READONLY
	IMPORT	main
	IMPORT	getkey
	IMPORT	sendchar
	EXPORT	start
	PRESERVE8

start
	MOV R6, #0
	MOV R7, #10

while
	BL	getkey			; read key(a) from console
	CMP	R0, #'+' 	
	BEQ	addition
	CMP R0, #'-'
	BEQ subtract
	CMP R0, #'*'
	BEQ multiply
	CMP R0, #'/'		; while (key != '+' || key != '-' || key != '*' || key != '/')	
	BEQ divide			; {
	BL	sendchar		; echo key(a) back to console
					
	MUL R6, R7, R6		; 	a *= 10;
	SUB R0, R0, #0x30	; 	number = ASCII to numeral of key;
	ADD R6, R0, R6		; 	a += number;
	B	while			; 	proceed to while}

addition				; 	if (key = '+') {
	MOV R4, #0
	MOV R5,	#10
addnext
	BL getkey			; read key(b) from console;
	BL sendchar			; echo key(b) back to console;
	CMP R0, #0x0D		; 		while (key != CR)
	BEQ	addtot			; 		{
	
	MUL R4, R5, R4		; 			b *= 10;
	SUB R0, R0, #0x30	; 			number = ASCII to numeral;
	ADD R4, R0, R4		; 			b += number;
	B	addnext			; 		}
	
addtot					; 		if (key = CR) {
	ADD R5, R4, R6		; 			result = a + b;
	B endall			; 		}
						; 	}
	
subtract				; 	if (key = '-') {
	MOV R4, #0
	MOV R5,	#10
subnext
	BL getkey			; read key(b) from console
	BL sendchar			; echo key(b) back to console
	CMP R0, #0x0D		; 		while (key != CR)
	BEQ	subtot			; 		{
	
	MUL R4, R5, R4		; 			b *= 10;
	SUB R0, R0, #0x30	; 			number = ASCII to numeral;
	ADD R4, R0, R4		; 			b += number;
	B	subnext			;		}
	
subtot					; 		if (key = CR) {
	SUB R5, R6, R4		; 			result = a - b;
	B endall			; 		}
						;	}
	
	
multiply				; 	if (key = '*') {
	MOV R4, #0
	MOV R5,	#10
mulnext	
	BL getkey			; read key(b) from console
	BL sendchar			; echo key(b) back to console
	CMP R0, #0x0D		; 		while (key != CR)
	BEQ	multot			; 		{
	
	MUL R4, R5, R4		; 			b *= 10;
	SUB R0, R0, #0x30	; 			number = ASCII to numeral;
	ADD R4, R0, R4		; 			b += number;
	B	mulnext			; 		}
	
multot					; 		if (key = CR) {
	MUL R5, R6, R4		;			result = a * b;
	B endall			; 		}
						;	}
						
						
divide					; if (key = '/') {
	MOV R4, #0
	MOV R5, #10
divnext
	BL getkey			; read key(b) from console
	BL sendchar			; echo key(b) back to console
	CMP R0, #0x0D		;		while (key != CR)
	BEQ divtot			;		{
	
	MUL R4, R5, R4		; 			b *= 10;
	SUB R0, R0, #0x30	; 			number = ASCII to numeral;
	ADD R4, R0, R4		; 			b += number;
	B divnext			;		}
	
divtot					; 		if (key = CR) {
	MOV R8, R6			; 			remainder = a;
	MOV R5, #0			; 			quotient = 0;
dividing 							
	CMP R8, R4			;			while (remainder >= b)
	BLO endall			; 			{
	ADD R5, R5, #1		;				quotient += 1;
	SUB R8, R8, R4		;				remainder -= b;
	B dividing			;			}
						; }	


endall

	MOV R0, #0x3D
	BL sendchar			; print '='

	LDR R9, =0			; quotient = 0	
	LDR R10, =10		
	MOV R8, R5			; remainder = a
lop1
	CMP R8, R10			; while (remainder >= 10)
	BLO endlop1			; {
	ADD R9, R9, #1		; 	quotient += 1;
	SUB R8, R8, R10		; 	remainer -= 10;	
	B lop1				; }
	MOV R0, R9
	BL sendchar			; print most significant digit
	B loop2
endlop1					; if (remainder < 10) {
	MOV R0, R8			
	BL sendchar			; 	print digit } 
	B allend

loop2
	LDR R9, =0			; quotient = 0	
	LDR R10, =10		
lop2
	CMP R8, R10			; while (remainder >= 10)
	BLO endlop2			; {
	ADD R9, R9, #1		; 	quotient += 1;
	SUB R8, R8, R10		; 	remainer -= 10;	
	B lop2				; }
	MOV R0, R9
	BL sendchar			; print most significant digit
	B loop3
endlop2					; if (remainder < 10) {
	MOV R0, R8			
	BL sendchar			; 	print digit } 

loop3
	LDR R9, =0			; quotient = 0	
	LDR R10, =10		
lop3
	CMP R8, R10			; while (remainder >= 10)
	BLO endlop3			; {
	ADD R9, R9, #1		; 	quotient += 1;
	SUB R8, R8, R10		; 	remainer -= 10;	
	B lop3				; }
	MOV R0, R9
	BL sendchar			; print most significant digit
	B loop4
endlop3					; if (remainder < 10) {
	MOV R0, R8			
	BL sendchar			; 	print digit } 
	
loop4	
	LDR R9, =0			; quotient = 0	
	LDR R10, =10		
lop4
	CMP R8, R10			; while (remainder >= 10)
	BLO endlop4			; {
	ADD R9, R9, #1		; 	quotient += 1;
	SUB R8, R8, R10		; 	remainer -= 10;	
	B lop4				; }
	MOV R0, R9
	BL sendchar			; print most significant digit
	B allend
endlop4					; if (remainder < 10) {
	MOV R0, R8			
	BL sendchar			; 	print digit } 
	
	
	
allend
stop	B	stop

	END	