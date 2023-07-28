/*
Test Package: Codegen
Author: Pikachu
Time: 2020-02-02
Input:
=== input ===
17 5 2
=== end ===
Output:
=== output ===
<< 3 4 (5) 6 7 >> 
=== end ===
ExitCode: 10
InstLimit: -1
Origin Package: Codeforces 399A #44003944
*/
#include <stdio.h>
int main() {
   int n,p,k;
	scanf("%d%d%d",&n,&p,&k);
	if(p-k>1) printf("<< ");
	for(int i= p-k; i<=p+k;i++)
	      if(1<= i && i <= n) {
	         if(i==p)printf( "(%d) ",i);
	        else printf("%d ", i);
	  }
	if(p + k < n) printf(">> ");
 
	return 0;
}