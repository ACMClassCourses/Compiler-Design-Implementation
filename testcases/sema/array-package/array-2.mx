/*
Test Package: Sema_Local_Preview
Test Target: Array
Author: 15' Sihao Ying
Time: 2019-10-20
Verdict: Success
Origin Package: Semantic Pretest
*/
int main() {
int i;
int j;
int k;
int[][] A = new int[3][4];
int[][] B = new int[4][2];
int[][] C = new int[3][2];
for (i = 0; i < 3; ++i)
	for (j = 0; j < 4; ++j)
			A[i][j] = i + j;
for (i = 0; i < 4; ++i)
	for (j = 0; j < 2; ++j)
			B[i][j] = i * j;
for (i = 0; i < 3; ++i)
	for (j = 0; j < 2; ++j)
			C[i][j] = 0;
for (i = 0; i < 3; ++i)
	for (j = 0; j < 2; ++j)
		for (k = 0; k < 4; ++k)
			C[i][j] = C[i][j] + A[i][k] * B[k][j];
int ans = 0;
for (i = 0; i < 3; ++i)
	for (j = 0; j < 2; ++j)
		ans = ans + C[i][j];
print(toString(ans));
return 0;
}