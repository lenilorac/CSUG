	AREA	Unique, CODE, READONLY
	IMPORT	main
	EXPORT	start

start

	LDR	R1, =VALUES			; adrV = address V elements;
	LDR R2, =COUNT			; adrC = address C element;
	LDR R2, [R2]			; numC = Memory.Word[adrC];  ...countC = 10
	LDR R3, =0				; countV = 0;
	MOV R6, R1				; tmp = adrV;
	LDR R4, [R6]			; elementV = Memory.Word[adrV];  ...ptr1
	
while
	CMP R2, R3				; while (cC != cV)
	BEQ nodup			    ; {
	MOV R1, R6				;	adrV = tmp;
	ADD R1, R1, #4			; 	adrV = adrV + 4;  ..onto next element
	LDR R5, [R1]			; 	elementB = Mememory.Word[adrV];  ...ptr2
	MOV R7, R2				; 	countB  = countV = 10; 
	SUB R7, R7, #1			; 	countB--;
meanWhile
	CMP R5, R4				; 	while (eB != eV && cB > 0)
	BEQ	endMeanWhile		; 	{
	CMP R7, #0				;
	BLS endWhile			; 
	SUB R7, R7, #1			;		countB--;
	ADD R1, R1, #4			; 		adrV = adrV + 4;  ...onto next element
	LDR R5, [R1]			; 		eB = Memory.Word[adrV];
	B meanWhile				; 	}
endWhile	
	ADD R6, R6, #4			; 	adrV = adrV + 4;  ..onto next element
	LDR R4, [R6]			; 	elementV = Memory.Word[adrV];
	ADD R3, R3, #1			; 	countV++;
	B while					; 	}

nodup						; if (cC <= cV) {
	LDR R0, =1				; 	result = 1;
	B stop					; }
endMeanWhile				; else if (eB == eV) {
	LDR R0, =0				;	result = 0;
							; }
stop	B	stop


	AREA	TestData, DATA, READWRITE
	
COUNT	DCD	10
VALUES	DCD	5, 2, 7, 4, 13, 4, 18, 8, 9, 12


	END	