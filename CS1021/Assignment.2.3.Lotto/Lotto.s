	AREA	Lotto, CODE, READONLY
	IMPORT	main
	EXPORT	start

start
	LDR R1, =TICKETS			; adrT = TICKETS;
	MOV R9, R1					; tmp2 = adrT;
	LDRB R2, [R1]				; elemT = Memory.Byte[TICKETS];
	LDR R3, =DRAW				; adrD = DRAW;
	MOV R10, R3;				; tmp1 = adrD;
	LDRB R4, [R3]				; elemD = Memory.Byte[DRAW];
	LDR R5, =COUNT				; adrCount = COUNT;
	LDR R5, [R5]				; ticketCounter = 0;
	MOV R12, #0					; positionCounter = 0;
	MOV R11, #0					; matchCounter = 0;
	MOV R8, #0					; drawCounter = 0;
while1 							; 
	CMP R5, #0					; while (ticketCounter != 0)
	BLS ewh1					; {
	CMP R8, #6					; 	if (drawCounter != 6)
	BEQ nextTicket				;	{
while2 							;
	CMP R12, #6					;		while (positionCounter != 6)
	BEQ ewh2					;		{
	CMP R2, R4					;			if (elemT == elemD)
	BNE noMatch					;			{
	ADD R11, R11, #1			;				matchCounter++;	
	B ewh2						;			}
noMatch							;
	ADD R1, R1, #1				;			adrT++;
	LDRB R2, [R1]				;			elemT = Memory.Byte[adrT];
	ADD R12, R12, #1			;			positionCounter++;			
	B while2					;		}
ewh2							;	}	
	MOV R12, #0					;	positionCounter = 0;
	ADD R8, R8, #1				; 	drawCounter++;
	MOV R1, R9					; 	adrT = tmp2;
	LDRB R2, [R1]				; 	elemT = Memory.Byte[adrT];
	ADD R3, R3, #1				;	adrD++;
	LDRB R4, [R3]				;	elemD = Memory.Byte[adrD];
	B while1					; 
nextTicket						;	else if (drawCounter == 6)
	CMP R11, #4					;	{
	BHS	match4					;
	MOV R11, #0					;		matchCounter = 0;
	ADD R9, R9, #6				; 		tmp2 = tmp2 + 6;
	MOV R1, R9					; 		adrT = tmp2;
	LDRB R2, [R1]				; 		elemT = Memory.Byte[adrT];
	MOV R3, R10					;		adrD = tmp1;
	LDRB R4, [R3]				;		elemD = Memory.Byte[tmp1];
	MOV R8, #0					;		drawCounter = 0;
	MOV R12, #0					;		positionCounter = 0;
	SUB R5, R5, #1				;		ticketCounter--;
	B while1					;
match4							;		
	CMP R11, #4					;		if (matchCounter == 4)
	BNE match5					;		{
	LDR R0, =MATCH4				;			match4 = MATCH4;
	LDR R7, [R0]				;			tmp3 = Memory.Word[MATCH4];
	ADD R7, R7, #1				;			tmp3++;
	STR R7, [R0]				;			Memory.Word[MATCH4] = tmp3;
	MOV R11, #0					;			matchCounter = 0;
	B nextTicket				;		}
match5							;
	CMP R11, #5					;		else if (matchCounter == 5)
	BNE	match6					;		{
	LDR R0, =MATCH5				;			match5 = MATCH5;
	LDR R7, [R0]				;			tmp3 = Memory.Word[MATCH5];
	ADD R7, R7, #1				;			tmp3++;
	STR R7, [R0]				;			Memory.Word[MATCH5] = tmp3;
	MOV R11, #0					;			matchCounter = 0;
	B nextTicket				;		}
match6							;		else if (matchCounter == 6) {
	LDR R0, =MATCH6				;			match6 = MATCH6;
	LDR R7, [R0]				;			tmp3 = Memory.Word[MATCH6];
	ADD R7, R7, #1				;			tmp3++;
	STR R7, [R0]				;			Memory.Word[MATCH6] = tmp3;
	MOV R11, #0					;		}	
	B nextTicket				; 	}
ewh1							; }
	LDR R1, =MATCH4
	LDR R1, [R1]
	LDR R2, =MATCH5
	LDR R2, [R2]
	LDR R3, =MATCH6
	LDR R3, [R3]
stop	B	stop 

	AREA	TestData, DATA, READWRITE
	
COUNT	DCD	3						; Number of Tickets
TICKETS	DCB	3, 8, 11, 21, 22, 31	; Tickets
	DCB	7, 23, 25, 28, 29, 32
	DCB	10, 11, 12, 22, 26, 30
	
DRAW	DCB	10, 11, 12, 22, 26, 30	; Lottery Draw

MATCH4	DCD	0
MATCH5	DCD	0
MATCH6	DCD	0

	END	
