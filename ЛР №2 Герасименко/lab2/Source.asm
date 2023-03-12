.686
.model flat,stdcall
.stack 100h
.const
k dw 2
.data
	XYZ dd 0E773h, 0717Fh, 026AAh ; массив операндов X, Y, Z
	M dw 0
	R dw 0
	N dd 3
.code
ExitProcess PROTO STDCALL :DWORD
Start:
	xor eax, eax
	mov esi, 0
	mov eax, XYZ[esi]
	add eax, 1    ; X сложить с "1" (X')
	mov esi, 0
	mov ecx, N
	@l1:
		add eax, XYZ[esi*4]    ;цикл суммирования 
		inc esi                ;операндов X, X', 
	loop @l1				   ;Y, Z (eax = M)
	cmp eax, 0  ; сравнение M с нулем
	jg pp1      ; если больше нуля
	jle pp2		; если меньше нуля

	pp1:       ; 1 подпрограмма
		xor ebx, ebx
		mov ebx, eax
		add eax, ebx  ; М умножить на 2
		xor eax, XYZ[4] ; получение R
		jnc adr2		; если нет переполнения
		jmp adr1		; если есть переполнение
	pp2:	   ; 2 подпрограмма
		xor ebx, ebx
		mov ebx, XYZ[8]
		and ebx, 000FFh  ; операнд Z & 00FF
		sub eax, ebx	 ; получение R
		jnc adr2		 ; если нет переполнения
		jmp adr1		 ; если есть переполнение

	adr2:      ; нет переполнения
		xor eax, 0D1F1h
		jmp exit

	adr1:	   ; есть переполнение
		add eax, 0221Bh 
		jmp exit
		
exit:
Invoke ExitProcess,1
End Start