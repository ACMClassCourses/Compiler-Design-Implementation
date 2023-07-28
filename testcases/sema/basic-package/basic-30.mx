/*
Test Package: Sema_Local_Preview
Test Target: Basic
Author: Pikachu
Time: 2019-11-11
Verdict: Fail
Comment: Function cannot be lvalue.
Origin Package: Semantic Pretest
*/
class A {
    int x;
    int y;
    int z;
};

int f(){
    return 1;
}

int main() {
    int t;
    A x;
    f() = x;
}