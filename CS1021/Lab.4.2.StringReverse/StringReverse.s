	AREA	StringReverse, CODE, READONLY
	IMPORT	main
	EXPORT	start

start
	LDR	R1, =strSrc			; adrS = srcElems;
	LDR	R2, =strDst			; adrD = dstElems;
	
	MOV R3, R1				; tmp = adrS;
	LDR R4, =0				; otherTmp = 0;
	LDRB R5, [R1]			; elementS = Memory.Byte[adrS];
while
	CMP R5, #0				; while (elementS != 0)
	BEQ endWhile			; {
	ADD R1, R1, #1			; 	adrS++;
	ADD R2, R2, #1			; 	adrD++;
	LDRB R5, [R1]			; elementS = Memory.Byte[adrS];
	B while					; }
endWhile					;
	MOV R1, R3				; adrS = tmp;
	STRB R3, [R2]			; tmp = Memory.Byte[adrD];
	LDRB R5, [R1]			; thirdTmp = Memory.Byte[adrS];
dup							; 
	CMP R5, #0				; while (thirdTmp != 0)
	BEQ enddup				; {
	STRB R5, [R2]			; 	thirdTmp = Memory.Byte[adrD];
	ADD R1, R1, #1			; 	adrS++;
	SUB R2, R2, #1			; 	adrD++;
	LDRB R5, [R1]			; 	thirdTmp = Memory.Byte[adrS];
	B dup					; }
enddup
	
stop	B	stop


	AREA	TestData, DATA, READWRITE


strSrc	DCB	"hello",0
strDst	SPACE	128

	END	