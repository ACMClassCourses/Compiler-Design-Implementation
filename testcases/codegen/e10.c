/*
Test Package: Codegen
Author: Pikachu
Time: 2020-02-03
Input:
=== input ===
47
=== end ===
Output:
=== output ===
YES
=== end ===
ExitCode: 0
InstLimit: -1
Origin Package: Codeforces 122A #61467904
*/
#include<stdio.h>
int main()
{
    int n;
    scanf("%d",&n);
printf((n%4==0)||(n%7==0)||(n%47==0)||(n%74==0)||(n%477==0) ? "YES" : "NO");
}