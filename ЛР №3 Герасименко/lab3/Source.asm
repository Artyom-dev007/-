.686
.model flat,stdcall
.stack 100h
.data
Sum dd 0.0
N dd 10
F dd 11.0
array dd 18.0, 11.0, 121.0, 33.0, 41.0, 5.0, 10.0, 55.0, 17.0, 100.0 ;������
.code
ExitProcess PROTO STDCALL :DWORD
Start:
;���������� ������� ����������� ������� �� ��������
        xor ecx, ecx
        push n
        pop ecx
    
cycl_1: push ecx        ; �������� ����
        mov eax, n
        dec eax
        push eax
        pop ecx
        lea esi, array
    
cycl_2: mov eax, [esi]      ; ��������� ����
        mov ebx, [esi+4]
        cmp eax, ebx
        js swap
    
just_:  add esi, 4      ; ����� ��� �������� ����� swap
        loop cycl_2
        
        pop ecx
        loop cycl_1
            
        jmp l
    
swap:   mov [esi], ebx  ; ����� ����������
        mov [esi+4], eax
        jmp just_ 
l:
FINIT ;������������� ��������������� ������������

mov esi, 0 ; ��� ���������� �������
mov ecx, N ; ������� ��������

; ���������� ����� ���������, ��������� �� 11

@cycl3:
    FNCLEX
    FLDZ  ; �������� ����
    FLD F ; �������� ����� 11
    FLD array[esi*4] ; �������� �������� �������
    FPREM1           ; ������� �� �������
    FCOMI ST, ST(2)  ; ��������� ������� � �����
    je L1            ; �������� �������� �� �����
    jg G
    jl G
    L1:  ; ���� ������� ����� ����
    FLD Sum ;�������� ���������� �����
    FLD array[esi*4] ; �������� �������� �������
    FADD ST, ST(1) ; ������������
    FST Sum
    FFREE ST(0) ; ������� �������� 1
    FFREE ST(1)
    FFREE ST(2)
    FFREE ST(3)
    FFREE ST(4)
    FFREE ST(5)
    FFREE ST(6)
    FFREE ST(7)
    FNCLEX
    G: ; ��� ��������� �������
    inc esi ; ��� ����������� �� �������
loop @cycl3

exit:
Invoke ExitProcess,1
End Start