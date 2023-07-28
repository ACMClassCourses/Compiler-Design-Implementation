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
0000
1234
=== end ===
ExitCode: 0
InstLimit: -1
Origin Package: Codegen Pretest-531
*/
//input: 1 2 3 4
#include<cstdio>
int *a = new int[4];
int main()
{
    int *b = new int[4];
	int i;
    for (i = 0; i < 4; i++)
	{
		a[i] = 0;
        scanf("%d", &b[i]);
		// b[i] = getInt();
	}
	for (i = 0; i < 4; i++)
	{
		printf("%d", (a[i]));
	}
	printf("\n");
	a=b;
	for (i = 0; i < 4; i++)
	{
		printf("%d", (a[i]));
	}
    return 0;
}
