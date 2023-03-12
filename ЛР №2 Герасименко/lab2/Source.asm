.686
.model flat,stdcall
.stack 100h
.const
k dw 2
.data
	XYZ dd 0E773h, 0717Fh, 026AAh ; ������ ��������� X, Y, Z
	M dw 0
	R dw 0
	N dd 3
.code
ExitProcess PROTO STDCALL :DWORD
Start:
	xor eax, eax
	mov esi, 0
	mov eax, XYZ[esi]
	add eax, 1    ; X ������� � "1" (X')
	mov esi, 0
	mov ecx, N
	@l1:
		add eax, XYZ[esi*4]    ;���� ������������ 
		inc esi                ;��������� X, X', 
	loop @l1				   ;Y, Z (eax = M)
	cmp eax, 0  ; ��������� M � �����
	jg pp1      ; ���� ������ ����
	jle pp2		; ���� ������ ����

	pp1:       ; 1 ������������
		xor ebx, ebx
		mov ebx, eax
		add eax, ebx  ; � �������� �� 2
		xor eax, XYZ[4] ; ��������� R
		jnc adr2		; ���� ��� ������������
		jmp adr1		; ���� ���� ������������
	pp2:	   ; 2 ������������
		xor ebx, ebx
		mov ebx, XYZ[8]
		and ebx, 000FFh  ; ������� Z & 00FF
		sub eax, ebx	 ; ��������� R
		jnc adr2		 ; ���� ��� ������������
		jmp adr1		 ; ���� ���� ������������

	adr2:      ; ��� ������������
		xor eax, 0D1F1h
		jmp exit

	adr1:	   ; ���� ������������
		add eax, 0221Bh 
		jmp exit
		
exit:
Invoke ExitProcess,1
End Start