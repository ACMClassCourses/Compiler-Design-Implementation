/*
Test Package: Codegen
Author: Pikachu
Time: 2020-02-03
Input:
=== input ===
3
njfngnrurunrgunrunvurn
jfvnjfdnvjdbfvsbdubruvbubvkdb
ksdnvidnviudbvibd
=== end ===
Output:
=== output ===
n20n
j27b
k15d
=== end ===
ExitCode: 0
InstLimit: -1
Origin Package: Codeforces 71A #53307259
*/
#include<stdio.h>
#include<string.h>
 
int main(){
	int t,l;
	char s[100];
	scanf("%d",&t);
	while(t--){
		scanf("%s",s);
		l = strlen(s);
		if(l > 10)
			printf("%c%d%c\n",s[0],l-2,s[l-1]);
		else
			printf("%s\n",s);
	}
	
}