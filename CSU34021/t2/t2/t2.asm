option casemap:none
includelib		legacy_stdio_definitions.lib
extrn	printf:near
.data								; declaring global variables

public g							; long long g;

g QWORD 4							; g = 4

.code

;	min: c++
;	int min(int a, int b, int c){
;		int v = a;
;		if (b < v) v = b;
;		if (c < v) v = c;
;		return v;
;	}

public		min						; export function name

min:		sub		rsp, 32				; allocate shadow space
			mov		rax, rcx			; int v = a;
			cmp		rax, rdx			; if (b < v)
			jle		greater_than_b
			mov		rax, rdx			;	v = b;
greater_than_b:
			cmp		rax, r8				; if (c < v)
			jle		min_v
			mov		rax, r8				;	v = c;
min_v:		add		rsp, 32				; restoring pre-allocated shadow space
			ret							; return v;

;	p: c++
;	int p(int i, int j, int k, int l){
;		return min(min(g, i, j), k, l);
;	}

public		p						; export function name

p:			sub		rsp, 32				; allocating shadow space
			mov		r12, rcx			; r12 = i
			mov		r13, rdx			; r13 = j
			mov		r14, r8				; r14 = k
			mov		r15, r9				; r15 = l
			
			mov		rcx, g				; moved g into rcx
			mov		rdx, r12			; rdx = i
			mov		r8, r13				; r8 = j
			call	min
			
			mov		rcx, rax			; moving result of min(g, i, j) into rcx
			mov		rdx, r14			; rdx = k
			mov		r8, r15				; r8 = l
			call	min					; min(min(g, i, j), k, l);
			
			add		rsp, 32				; restoring pre-allocated shadow space
			ret							; return min(min(g, i, j), k, l);

;	g: c++
;	int gcd(int a, int b){
;		if (b == 0) return 0;
;		else return gcd(b, a % b);
;	}

public		gcd						; export function name

gcd:		sub		rsp, 32				; allocating shadow space
			mov		rax, 0				; rax = 0
			cmp		rax, rdx			; if (b != 0)
			je		ret_gcd				;
			mov		rax, rcx			; tmp saving a = rax
			mov		rcx, rdx			; moving b = rdx
			xor		rdx, rdx			; checking divisor
			idiv	rcx					; 
			call	gcd					; 

ret_gcd:	mov		rax, rcx			; returning function
			add		rsp, 32				; restoring pre-allocated shadow space
			ret							; 

;	_int64 q(_int64 a, _int64 b, _int64 c, _int64 d, _int64 e){
;		_int64 sum = a + b + c + d + e;
;		printf("a = %I64d b = %I64d c = %I64d d = %I64d e = %I64d\n",a,b,c,d,e,sum);
;		return sum;
;	}
			
public		q						; export function name

sum			db 'a = %I64d b = %I64d c = %I64d d = %I64d e = %I64d sum = %I64d', 0AH, 00H ; formatting string

q:			mov		rax, rcx			; sum = rax = a;
			add		rax, rdx			; sum += b;
			add		rax, r8				; sum += c;
			add		rax, r9				; sum += d
			mov		r10, [rsp + 40]		; fifth param(e) somehow in this address
			add		rax, r10			; sum += e
			push	rax					; pushing sum;
			push	r10					; pushing e;
			push	r9					; pushing d;
			sub		rsp, 32				; 
			mov		r9, r8				; r9 = c
			mov		r8, rdx				; r8 = b
			mov		rdx, rcx			; rdx = a
			lea		rcx, sum			; writing sum into address of rcx
			call	printf				; calling printf on all above;
			add		rsp, 32				; 
			pop		r9					; pop(d);
			pop		r10					; pop(e);
			pop		rax					; pop(sum); restore all;
			ret		

public		qns						; export function name
	
sum1		db		'qns', 0AH, 00H
			
qns:		sub		rsp, 32				; allocating shadow space
			lea		rcx, sum1			; writing sum1 into address of rcx
			call	printf				; printf(sum1);
			add		rsp, 32				; restoring pre-allocated shadow space
			mov		rax, 0				; 
			ret		
end