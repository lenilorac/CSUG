.686							; create 32 bit code
.model flat, C					; 32 bit memory model
option casemap: none			; case sensitive

.data							; global variables

public g						; declaring global variable

g	DWORD	4					; int g = 4;

.code

; //	min: C++
; int min(int a, int b, int c){
	; int v = a;
	; if (b < v)	v = b;
	; if (c < v)	v = c;
	; return v;
; }

public		min							; function name exported

min:		push	ebp					; push frame pointer
			mov		ebp, esp			; update ebp -> new stack frame
			
			mov		eax, [ebp + 8]		; eax(v) = a;

			cmp		eax, [ebp + 12]		; if (b < v)
			jge		greater_than_eq_b	; {
			mov		eax, [ebp + 12]		; 	v = b;
greater_than_eq_b:						; }
			cmp		eax, [ebp + 16]		; if (c < v)
			jge		min_v				; {
			mov		eax, [ebp + 12]		; 	v = c;
min_v:      mov		esp, ebp			; restore esp
			pop		ebp					; restore ebp
			ret		0					; return v;
			
; //	p: C++
; int p(int i, int j, int k, int l){
	; return min(min(g, i, j), k, l);
; }

public	p								; function name exported

p:			push	ebp						; push frame pointer
			mov		ebp, esp			; update ebp -> new stack frame
			
			push	[ebp + 12]			; push j	
			push	[ebp + 8]			; push i
			push	g					; push g
			call	min					; min(g, i, j);
			add		esp, 12				; pop function parameters off stack
			
			push	[ebp + 20]			; push l
			push	[ebp + 16]			; push k
			push	eax					; push last result
			call	min					; min(min(g, i, j), k, l);
			add		esp, 12				; pop function parameters off stack
			
			mov 	esp, ebp			; restore esp
			pop		ebp					; restore ebp
			ret		0					; return min(min(g, i, j), k, l));
			
; //	gcd: C++
; int gcd(int a, int b){
	; if (b == 0)	return 0;
	; else	return gcd(b, a % b); 
; }

public		gcd							; function name exported

gcd:		push	ebp					; push frame pointer
			mov		ebp, esp			; update ebp -> new stack pointer
			
			mov		eax, [ebp + 12]		; eax = b;
			cmp		eax, 0				; if (b != 0) 
			je		return_a			; {
			cdq							; 	converting double to quadword;
			mov		ecx, [ebp + 12]
			idiv	ecx					;	edx = a % b;
			push	edx					; 	push edx;
			push	ecx					;	push b;
			call	gcd					; 	return gcd(b, a % b);
			add		esp, 8				; }
			jmp		return_gcd
			
return_a:	mov		eax, [ebp + 8]		; return a;
			
return_gcd:	mov		esp, ebp			; restore stack pointer
			pop		ebp					; restore frame pointer
			ret		0					; return gcd(b, a % b);
end