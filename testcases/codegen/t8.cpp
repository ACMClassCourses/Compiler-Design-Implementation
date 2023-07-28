/*
Test Package: Codegen
Author: Haojun Mao
Time: 2020-01-25
Input:
=== input ===
1
2
3
4
=== end ===
Output:
=== output ===
4
1234
0000
=== end ===
ExitCode: 0
InstLimit: -1
Origin Package: Codegen Pretest-532
*/
// input: 1 2 3 4
#include<cstdio>
int *a = new int[4];
int main()
{
    int **b = new int*[4];
	int i;
	b[0] = a;
	b[1] = a;
	b[2] = a;
	b[3] = a;
	printf("%d\n", (4));
	for (i = 0; i < 4; i++)
        scanf("%d", &b[0][i]);
		// b[0][i] = getInt();
	for (i = 0; i < 4; i++)
		printf("%d", (b[1][i]));
	printf("\n");
	for (i = 0; i < 4; i++)
		b[2][i] = 0;
	for (i = 0; i < 4; i++)
		printf("%d", (b[3][i]));
    return 0;
}


