/*
Test Package: Sema_Local_Preview
Author: Pikachu
Time: 2020-02-02
Input:
=== input ===
8
11 12 1 2 13 14 3 4
=== end ===
Output:
=== output ===
2
=== end ===
ExitCode: 0
InstLimit: -1
Origin Package: Codeforces 1145A #52445759
*/
#include<stdio.h>
int n,a[20];
int jud(int x){
	int i,j;
	for(i=0;i<n/x;i++){
		int flag=0;
		for(j=0;j<x-1;j++){
			if(a[i*x+j]>a[i*x+j+1])flag=1;
		}
		if(!flag)return 1;
	}
	return 0;
}
int main(){
	int i;
	scanf("%d",&n);
	for(i=0;i<n;i++)scanf("%d",&a[i]);
	for(i=n;i;i>>=1)if(jud(i))return printf("%d",i),0;
	return 0;
}