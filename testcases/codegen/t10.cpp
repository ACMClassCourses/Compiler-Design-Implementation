/*
Test Package: Codegen
Author: 14' Shichao Xu
Time: 2020-01-25
Input:
=== input ===
=== end ===
Output:
=== output ===
1
1029
171
=== end ===
ExitCode: 0
InstLimit: -1
Origin Package: Codegen Pretest-534
*/
#include<cstdio>

int gcd5(int x, int y);

int gcd(int x, int y) {
  if (x%y == 0) return y;
  else return gcd5(y, x%y);
}


int gcd1(int x, int y) {
  if (x%y == 0) return y;
  else return gcd(y, x%y);
}


int gcd2(int x, int y) {
  if (x%y == 0) return y;
  else return gcd1(y, x%y);
}



int gcd3(int x, int y) {
  if (x%y == 0) return y;
  else return gcd2(y, x%y);
}


int gcd4(int x, int y) {
  if (x%y == 0) return y;
  else return gcd(y, x%y);
}


int gcd5(int x, int y) {
  if (x%y == 0) return y;
  else return gcd2(y, x%y);
}

int main() {
    printf("%d\n", (gcd(10,1)));
    printf("%d\n", (gcd(34986,3087)));
    printf("%d\n", (gcd(2907,1539)));

    return 0;
}
