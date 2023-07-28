/*
Test Package: Sema_Local_Preview
Test Target: Classes
Author: 15' Lianming Zheng
Time: 2019-10-20
Verdict: Fail
Comment: cannot return any value in a constructor
Origin Package: Semantic Extended
*/
A get() { return new A; } // this is valid

class A {
    A() {
        return get(); // cannot return any value in a constructor
    }
};

int main() { return 0; }