/*
Test Package: Codegen
Author: Pikachu
Time: 2020-02-03
Input:
=== input ===
1001 1000 10
=== end ===
Output:
=== output ===
10100
=== end ===
ExitCode: 0
InstLimit: -1
Origin Package: Codeforces 1A #52940143
*/
int n,m,a;
int main(){
	scanf("%d%d%d",&n,&m,&a);
	printf("%I64d",(m+a-1ll)/a*((n+a-1)/a));
    return 0;
}