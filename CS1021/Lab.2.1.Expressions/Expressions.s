	AREA	Expressions, CODE, READONLY
	IMPORT	main
	EXPORT	start

start
	LDR R1, =5	; x = 5
	LDR R2, =6	; y = 6
	
	; this is part a
	
	LDR R3, =3	; tmp = 3
	LDR R4, =0	; tmp1 = 0
	MUL R4, R1, R1	; result = x^2
	MUL R3, R4, R3	; result = 3x^2
	
	LDR R4, =5	; tmp2 = 5
	MUL R4, R1, R4	; result = x * 5
	ADD R3, R3, R4	; result = 3x^2 + 5x
	
	; this is part b
	
	LDR R3, =2	; tmp = 2
	LDR R4, =0	; tmp1 = 0
	MUL R4, R1, R1	; result = x^2
	MUL R4, R3, R4	; result = 2 * x^2
	
	LDR R3, =6	; tmp2 = 6
	LDR R5, =0	; tmp3 = 0
	MUL R5, R1, R2	; result = xy
	MUL R5, R3, R5	; result = 6 * xy
	
	LDR R3, =3	; tmp4 = 3
	LDR R6, =0	; tmp5 = 0
	MUL R6, R2, R2	; result = y^2
	MUL R6, R3, R6	; result = 3 * y^2
	ADD R6, R5, R6	; result = 6xy + 3y^2
	ADD R4, R4, R6	; result = 2x^2 + 6xy + 3y^2
	
	; this is part c
	
	LDR R3, =4	; tmp = 4
	LDR R4, =0	; tmp1 = 0
	MUL R4, R1, R1	; result = x^2
	MUL R3, R4, R3	; result = 4 * x^2
	
	LDR R5, =0	; tmp2 = 0
	MUL R5, R4, R1	; result = x^2 * x
	SUB R5, R5, R3	; result = x^3 - 4x^2
	
	LDR R4, =3	; tmp3 = 3
	MUL R4, R1, R4	; result = x * 3
	
	LDR R6, =8	; tmp4 = 8
	ADD R6, R4, R6	; result = 3x + 8
	ADD R5, R5, R6	; result = x^3 - 4x^2 + 3x + 8
	
stop	B	stop

	END	