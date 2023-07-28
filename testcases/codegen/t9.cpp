/*
Test Package: Codegen
Author: 14' Shichao Xu
Time: 2020-01-25
Input:
=== input ===
=== end ===
Output:
=== output ===
1024
=== end ===
ExitCode: 0
InstLimit: -1
Origin Package: Codegen Pretest-533
*/
#include<cstdio>
int qpow(int a,int p,int mod) {
    int t = 1;
    int y = a;
    while(p>0){
        if((p&1) == 1)t=t*y % mod;
        y=y*y % mod;
        p=p / 2;
    }
    return t;
}

int main() {
    printf("%d\n", (qpow(2,10,10000)));
    return 0;
}