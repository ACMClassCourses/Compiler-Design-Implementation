/*
Test Package: Sema_Local_Preview
Test Target: Classes
Author: 15' Xinhao Chen
Time: 2019-11-11
Verdict: Fail
Comment: Mismatched constructor name.
Origin Package: Semantic Extended
*/
class A {
  B() {}
};

class B {
  A() {}
};

int main() {
  A b = new A;
  B a = new B;
}

