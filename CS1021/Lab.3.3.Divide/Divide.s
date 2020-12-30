	AREA	Divide, CODE, READONLY
	IMPORT	main
	EXPORT	start

start
	LDR R2, =18	; a = 18
	LDR R3, =8	; b = 8
	LDR R0, =0	; quotient = 0

	CMP R3, #0
	BEQ endwh
	MOV R1, R2	; remainder = a;
while
	CMP R1, R3	; while ( remainder >= b)
	BLO endwh	; {
	ADD R0, R0, #1	; quotient = quotient + 1
	SUB R1, R1, R3	; remainder = remainder - b
	B	while		;}	
endwh				
	
stop	B	stop

	END	