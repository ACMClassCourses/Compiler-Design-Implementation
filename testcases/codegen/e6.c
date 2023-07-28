/*
Test Package: Codegen
Author: Pikachu
Time: 2020-02-03
Input:
=== input ===
8 1
10 9 8 7 7 7 5 5
=== end ===
Output:
=== output ===
1
=== end ===
ExitCode: 0
InstLimit: -1
Origin Package: Codeforces 158A #62259103
*/
#include<stdio.h>
int main()
{
int m,k,a[50],i;
scanf("%d%d",&m,&k);
for(i=0;i<m;i++)
scanf("%d",&a[i]);
for(i=0;a[i]>=a[k-1]&&a[i]&&i<m;i++);
printf("%d",i);
}