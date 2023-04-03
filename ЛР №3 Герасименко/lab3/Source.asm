.686
.model flat,stdcall
.stack 100h
.data
Sum dd 0.0
N dd 10
F dd 11.0
array dd 18.0, 11.0, 121.0, 33.0, 41.0, 5.0, 10.0, 55.0, 17.0, 100.0 ;массив
.code
ExitProcess PROTO STDCALL :DWORD
Start:
;сортировка массива пузырьковым методом на убывание
        xor ecx, ecx
        push n
        pop ecx
    
cycl_1: push ecx        ; Основной цикл
        mov eax, n
        dec eax
        push eax
        pop ecx
        lea esi, array
    
cycl_2: mov eax, [esi]      ; Вложенный цикл
        mov ebx, [esi+4]
        cmp eax, ebx
        js swap
    
just_:  add esi, 4      ; Метка для удобства после swap
        loop cycl_2
        
        pop ecx
        loop cycl_1
            
        jmp l
    
swap:   mov [esi], ebx  ; Обмен элементами
        mov [esi+4], eax
        jmp just_ 
l:
FINIT ;инициализация математического сопроцессора

mov esi, 0 ; для индексации массива
mov ecx, N ; счетчик итераций

; нахождение суммы элементов, делящихся на 11

@cycl3:
    FNCLEX
    FLDZ  ; загрузка нуля
    FLD F ; загрузка числа 11
    FLD array[esi*4] ; загрузка элемента массива
    FPREM1           ; остаток от деления
    FCOMI ST, ST(2)  ; сравнение остатка с нулем
    je L1            ; условные переходы по метке
    jg G
    jl G
    L1:  ; если остаток равен нулю
    FLD Sum ;загрузка переменной суммы
    FLD array[esi*4] ; загрузка элемента массива
    FADD ST, ST(1) ; суммирование
    FST Sum
    FFREE ST(0) ; очистка регистра 1
    FFREE ST(1)
    FFREE ST(2)
    FFREE ST(3)
    FFREE ST(4)
    FFREE ST(5)
    FFREE ST(6)
    FFREE ST(7)
    FNCLEX
    G: ; все остальные условия
    inc esi ; для перемещения по массиву
loop @cycl3

exit:
Invoke ExitProcess,1
End Start