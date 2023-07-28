/*
Test Package: Codegen
Author: Pikachu
Time: 2020-02-03
Input:
=== input ===
0 0 0 0 0
0 0 0 0 0
0 1 0 0 0
0 0 0 0 0
0 0 0 0 0
=== end ===
Output:
=== output ===
1
=== end ===
ExitCode: 0
InstLimit: -1
Origin Package: Codeforces 263A #48540584
*/
#include<stdio.h>
 
int main()
{
	int n,r,c,i,j;
	for (i=0;i<5;i++)
		for (j=0;j<5;j++)
		{
		scanf("%d", &n);
		if (n==1)
		{r=i;c=j;}}
	printf("%d",abs(2-r)+abs(2-c));
	return 0;
}