	AREA	Countdown, CODE, READONLY
	IMPORT	main
	EXPORT	start

start
	LDR	R1, =cdWord			; Load start address of word
	LDR	R2, =cdLetters		; Load start address of letters

	LDRB R3, [R1]			; elemW = Memory.Byte[adrWord];	 
	LDRB R4, [R2]			; elemL  = Memory.Byte[adrLetters];
	MOV R8, #0				; countW = 0;
	MOV R6, #0				;	it = 0;
while1
	CMP R3, #0				; while (elemW != 0)
	BEQ ewh1				; {
	ADD R8, R8, #1			; 	countW++;
while2						;
	CMP R4, #0				;	while (elemL != 0 && elemW != elemB)
	BEQ ewh2				; 	{
	CMP R4, R3				;
	BNE noMatch				; 		if (elemW == elemL) {
	MOV R4, #0x21			;			elemL = '!';
	STRB R4, [R2]			;			Memory.Byte[adrL] = elemL;
	B ewh2					;
noMatch						;		}
	ADD R2, R2, #1			; 		adrL = adrL + 1;
	LDRB R4, [R2]			; 		elemL = Memory.Byte[adrL];
	ADD R6, R6, #1			;		it++;
	B while2				;			
ewh2						;	}
	ADD R1, R1, #1			; 	adrW = adrW + 1;
	LDRB R3, [R1]			; 	elemW = Memory.Byte[adrW];
	SUB R2, R2, R6			;	adrL = adrL - it;
	LDRB R4, [R2]			;	elemL = Memory.Byte[adrL];
	MOV R6, #0				;	it = 0;
	B while1				; 	}
ewh1
	MOV R7, #0				; countL = 0;
while3
	CMP R4, #0				; while (elemL != 0 && elemW == 0)
	BEQ ewh3				; {
	CMP R4, #0x21			;
	BNE hasNoMatch			; 	if (elemL == '!') {	
	ADD R7, R7, #1			;		countL++;
hasNoMatch					;	}
	ADD R2, R2, #1			;	adrL = adrL + 1;
	LDRB R4, [R2]			; 	elemL = Memory.Byte[adrL];
	B while3				;
ewh3						; }
	CMP R8, R7				; if (countL == countW) 
	BEQ equals				; {
	MOV R0, #0				;	result = 0;
	B stop					; }
equals						; else
	MOV R0, #1				;	result = 1;
	
stop	B	stop



	AREA	TestData, DATA, READWRITE
	
cdWord
	DCB	"beets",0

cdLetters
	DCB	"daetebzsb",0
	
	END	
