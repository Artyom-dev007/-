.686
.model flat,stdcall
.stack 100h
.const
n dw 5
.data
x dw 121
y dw 35
z dw 4
.code
ExitProcess PROTO STDCALL :DWORD
Start:
mov ax,x ;������� x
mov bl,al
and bl,00000001b
not bl
and al,11111110b
and al,bl ;�������������� ���������� ���� �������� x'

mov dx,y ;������� y
mov cl,dl        
and cl,00000001b
not cl
and cl,11111110b
and dl,cl ;�������������� ���������� ���� �������� y' 

and al,dl ;���������� & x' � y'
mov cl,al

mov ax,z
mul n     ;�������������� ��������� z �� 5

add al,cl ;�������������� �������� ������������� �����������

exit:
Invoke ExitProcess,1
End Start