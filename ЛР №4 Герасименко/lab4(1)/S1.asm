.586 
.MODEL flat,C
.DATA
SUM dd 0.0;переменна€ в которую мы поместим результат функции на C
i_local DD 0;счЄтчик
n dd 0;число итераций
.CODE
extern fun_el:near ; объ€вление внешней функции fun_el
public SumR
SumR proc C

	push ebp;
	mov ebp,esp;
	mov i_local,1;помещаем в счЄтчик 1
	mov ecx, dword ptr [ebp+8];помещаем в ecx число итераций цикла n
	mov n, ecx;поместили в локальную переменную "n" число итераций из ecx
	mov esi, [ebp + 12];поместили адрес массива в esi

	;начало цикла
	L1:
		mov ebx, i_local;поместили в ebx текущий счЄтчик
		sub ebx, 1;вычли 1, чтобы использовать в обращении к элементам массива
		push dword ptr [esi + ebx*4];передаЄм текущий элемент массива в функцию fun_el
		call fun_el;вызываем функцию fun_el

		fld SUM;помещаем в st(0) SUM
		fadd;складываем st(0) и st(1)

		inc i_local;увеличиваем счЄтчик на 1
		fstp SUM;помещаем значение из st(0) в SUM
		mov ecx, SUM;помещаем SUM в ecx
		mov [esi + ebx*4], ecx;помещаем в текущий элемент массива значение из ecx
		mov SUM, 0;обнул€ем SUM

	mov eax, n;помещаем n в eax
	inc eax;увеличиваем n на 1
	mov ebx, i_local;помещаем в ebx, текущее значение счЄтчика
	cmp ebx, eax;сравниваем текущее значение счЄтчика и n
	jne L1;если они не равны переходим к L1
	;конец цикла

	mov eax, esi;помещаем адрес массива в eax дл€ возврата в C++
	mov esp,ebp;
	pop ebp;

ret
SumR endp
End
