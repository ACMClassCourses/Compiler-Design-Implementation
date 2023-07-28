/*
Test Package: Sema_Local_Preview
Test Target: Scope
Author: 15' Lianming Zheng
Time: 2019-10-20
Verdict: Success
Origin Package: Semantic Extended
*/
class A {};
class B { B() {{{{{ return; }}}}} };  // single return is allowed in constructor
class C { int func() { return 93; } };
int main() {}
void func() {
    if(false);else;
    while(true);
    for(;;);
    return;
    {;{{;{{}{}}}};{{};{}}};
    new A[10][][][];
    (new C).func() + (new C).func();   // new is a kind of expression
}