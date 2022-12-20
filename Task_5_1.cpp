#include <iostream>
using namespace std;

int main() {
	int n, i;
	cout << "Enter the permutation size: ";
	cin >> n;
	int A[n], B[n], C[n];
	cout << "Enter the first permutation (A):";
	for (i = 0; i < n; i++) cin >> A[i];
	cout << "Enter the second permutation (B):";
	for (i = 0; i < n; i++) cin >> B[i];
	cout << "Composition A*B = ";
	for (i = 0; i < n; i++) {
		C[i] = A[B[i] - 1];
		cout << C[i] << " ";
	}
	cout << endl;

	return 0;
}