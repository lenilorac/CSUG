	AREA	StringLength, CODE, READONLY
	IMPORT	main
	EXPORT	start

start
	LDR	R1, =str1		; adr1 = srt1Elems;
	MOV R0, #0			; counter = 0;
while
	LDRB R2, [R1]		; element = Memory.Byte[adr1]
	CMP R2, #0			; while (element != 0)
	BEQ endWhile		; {
	ADD R0, R0, #1		;	counter += 1;
	ADD R1, R1, #1		;	element = next element;
	B while				; }
endWhile
	
stop	B	stop



	AREA	TestData, DATA, READWRITE

str1	DCB	"Friday",0

	END	
