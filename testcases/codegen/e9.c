/*
Test Package: Codegen
Author: Pikachu
Time: 2020-02-03
Input:
=== input ===
3
4 1 7
-2 4 -1
1 -5 -3
=== end ===
Output:
=== output ===
NO
=== end ===
ExitCode: 0
InstLimit: -1
Origin Package: Codeforces 69A #42823903
*/
#include<stdio.h>
int main(void)
{	int p,q,r,x=0,y=0,z=0,n,i;
	scanf("%d", &n);
	for(i=0;i<n;i++)
	{	scanf("%d %d %d", &p,&q,&r);
		x+=p; y+=q; z+=r;
	}
if(x==0 && y==0&& z==0)
printf("YES");
else printf("NO");
}
 