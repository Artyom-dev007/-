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
mov ax,x ;операнд x
mov bl,al
and bl,00000001b
not bl
and al,11111110b
and al,bl ;инвертирование последнего бита операнда x'

mov dx,y ;операнд y
mov cl,dl        
and cl,00000001b
not cl
and cl,11111110b
and dl,cl ;инвертирование последнего бита операнда y' 

and al,dl ;логическое & x' и y'
mov cl,al

mov ax,z
mul n     ;арифметическое умножение z на 5

add al,cl ;арифметическое сложение промежуточных результатов

exit:
Invoke ExitProcess,1
End Start