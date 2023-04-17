#include <iostream>
#include "Header.h"


using namespace std;

extern "C" float* SumR(int p, float* q);

int main() {

	int n = 0;//число элементов массива
	float* x = nullptr;//массив иксов

	std::cout << "Input n: ";
	std::cin >> n;

	x = new float[n];

	std::cout << "\nInput " << n << " elements of x:\n";

	for (int i = 0; i < n; i++) {
		std::cout << "x[" << i << "] = ";
		std::cin >> x[i];//получаем иксы
	}

	float* R = nullptr;
	R = SumR(n, x);//получаем из ассемблера результирующий массив

	std::cout << "\nResult R:\n";
	for (int i = 0; i < n; i++) {
		std::cout << "R[" << i << "] = " << R[i] << std::endl;//вывод на экран
	}
	return 0;
}
