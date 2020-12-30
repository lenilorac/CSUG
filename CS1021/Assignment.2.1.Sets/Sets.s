	AREA	Sets, CODE, READONLY
	IMPORT	main
	EXPORT	start

start
	LDR R1, =AElems		; adrA = AElems;
	LDR R2, [R1]		; elemA = Memory.Word[adrA];
	LDR R3, =ASize		; numbA = ASize;
	LDR R3, [R3]		; countA = Memory.Word[numbA];
	
	LDR R4, =BElems		; adrB = BElems;
	LDR R5, [R4]		; elemB = Memory.Word[adrB];
	MOV R8, R4			; tmp1 = adrB;
	LDR R6, =BSize		; numbB = BSize;
	LDR R6, [R6]		; countB = Memory.Word[numbB];
	MOV R7, R6			; tmp2 = countB;
	
	LDR R9, =CSize		; numbC = CSize;
	LDR R10, =CElems	; adrC = CElems;
	LDR R9, [R9]		; countC = Memory.Word[numbC];
	LDR R11, [R10]		; elemC = Memory.Word[adrC];
	
while1
	CMP R3, #0			; while (cA != 0)
	BEQ ewh1			; {
	MOV R4, R8			;	adrB = tmp1;
	LDR R5, [R4]		; 	elemB = Memory.Word[adrB];
	MOV R6, R7			;	countB = tmp2;
while2	
	CMP R6, #0			; 	while (cB != 0)
	BEQ ewh2			; 	{
	CMP R2, R5			;		if (eA != eB)
	BEQ CMatch			;		{
	ADD R4, R4, #4		;	 		adrB += 4;
	LDR R5, [R4]		;	 		elemB = Memory.Word[adrB];
	SUB R6, R6, #1		;	 		cB--;
	B while2			;		}
CMatch					; 		else {
	MOV R11, R2			;		elemC = elemA;
	STR R11, [R10]		;		Memory.Word[adrC] = eC;
	ADD R10, R10, #4	; 		adrC += 4;		
	ADD R9, R9, #1		; 		countC++;
						;		}
ewh2					;	}
	ADD R1, R1, #4		; 		adrA += 4;
	SUB R3, R3, #1		; 		cA--;
	LDR R2, [R1]		; 		elemA = Memory.Word[adrA];
	B while1			; }	 
ewh1					; 
	MOV R11, #4			; tmp3 = 4;
	MUL R11, R9, R11	; tmp3 = countC * 4;
	SUB R10, R10, R11	; adrC -= countC * 4;	
stop	B	stop


	AREA	TestData, DATA, READWRITE
	
ASize	DCD	8					; Number of elements in A
AElems	DCD 4,6,2,13,19,7,1,3 	; Elements of A

BSize	DCD	6					; Number of elements in B
BElems	DCD	13,9,1,9,5,8		; Elements of B

CSize	DCD	0					; Number of elements in C
CElems	SPACE	56				; Elements of C

	END	
