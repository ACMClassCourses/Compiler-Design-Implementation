/*
Test Package: Sema_Local_Preview
Test Target: Classes
Author: 16' Zhihan Jin
Time: 2019-11-11
Verdict: Success
Origin Package: Semantic Extended
*/
class A {
  B t;
  A() {
    t = new B();
  }
};

class B {
  A t;
  B() {
    t = new A();
  }
};

int main() {
  A a = new A;
  B b = new B;
  a.t = b;
  b.t = a;
}