/*
Test Package: Sema_Local_Preview
Test Target: Basic
Author: 16' Zhou Fan
Time: 2019-11-11
Verdict: Success
Origin Package: Semantic Pretest
*/
string a = "\n\n\n\"\\\"";

class A {
    bool b;
};

int main() {
    println(a + " " + a);
    // what a mess
    int [] [] [] a;
    a = new int [2] [] [];
    if (true) {
        int[] b = a [1] [1];
        int [][] c = a [1];
        A[][] a = new A[2][];
        if (a[1][1].b) {}
    }
}