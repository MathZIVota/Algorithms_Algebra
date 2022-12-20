#include <iostream>
using namespace std;

int main() {
	int n, i;
	cout << "Enter the permutation size: ";
	cin >> n;
	int A[n], B[n];
	cout << "Enter the permutation (A):";
	for (i = 0; i < n; i++) cin >> A[i];
	cout << "Reverse permutation:";
	for (i = 0; i < n; i++) {
		B[A[i] - 1] = i + 1;
	}
	for (i = 0; i < n; i++) cout << B[i] << " ";
	cout << endl;

	return 0;
}