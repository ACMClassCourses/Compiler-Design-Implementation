/*
Test Package: Sema_Local_Preview
Test Target: Basic
Author: 16' Zhanghao Wu
Time: 2019-11-11
Verdict: Fail
Comment: Variable cannot be void.
Origin Package: Semantic Pretest
*/
int main() {
    int a;
    int b;
    a = a + b;
    foo();
    return 0;
}

void foo(){
    void s = foo(); return s;
}