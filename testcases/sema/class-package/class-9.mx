/*
Test Package: Sema_Local_Preview
Test Target: Classes
Author: 15' Lianming Zheng
Time: 2019-10-20
Verdict: Success
Origin Package: Semantic Extended
*/
A a;
B b;

int main() {
    a = new A;
    b = new B;
    A[] a = (new A).many()[0];
    B[][] b = (new B).many()[1][1].many();
    return 0;
}

class A {
    B b;
    A one() {
        return a;
    }

    A[][] many() {
        return new A[10][10];
    }
};

class B {
    A a;
    B one() {
        return b;
    }

    B[][] many() {
        return new B[10][10];
    }
};