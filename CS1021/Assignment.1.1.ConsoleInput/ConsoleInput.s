	AREA	ConsoleInput, CODE, READONLY
	IMPORT	main
	IMPORT	getkey
	IMPORT	sendchar
	EXPORT	start
	PRESERVE8

start
	MOV R4, #0
	MOV R5, #10

while
	BL	getkey			; read key from console
	CMP	R0, #0x0D  		; while (key != CR)
	BEQ	endwh			; {
	BL	sendchar		;   echo key back to console

	MUL R4, R5, R4		; 	result *= 10;	
	SUB R0, R0, #0x30	; 	number = ASCII to numeral;
	ADD R4, R0, R4		; 	result += number;
	B	while			; }
endwh

stop	B	stop

	END	