	AREA	GCD, CODE, READONLY
	IMPORT	main
	EXPORT	start

start
	LDR R2, =32	; a = 32
	LDR R3, =24	; b = 24

while
	CMP R2, R3
	BEQ endwh
	BLO otherwise
	SUB R0, R2, R3
	B	while
otherwise
	SUB R0, R3, R2
	B	while
endwh
	
stop	B	stop

	END	