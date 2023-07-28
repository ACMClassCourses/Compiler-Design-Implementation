/*
Test Package: Codegen
Author: Pikachu
Time: 2020-02-03
Input:
=== input ===
2
1 0 0
1 1 1
=== end ===
Output:
=== output ===
1
=== end ===
ExitCode: 0
InstLimit: -1
Origin Package: Codeforces 231A #46181712
*/
#include<stdio.h>
int main(){
	int n,x,y,z,c=0,k;
	scanf("%d",&n);
	for(k=0;k<n;k++){
		scanf("%d %d %d",&x,&y,&z);
		if(x+y+z>1)c++;
	}
	printf("%d\n",c);
}