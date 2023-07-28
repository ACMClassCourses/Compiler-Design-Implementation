/*
Test Package: Sema_Local_Preview
Test Target: Basic
Author: 16' Yunfeng Lin
Time: 2019-11-11
Verdict: Success
Origin Package: Semantic Pretest
*/
class A
{
    int b;
    B foo;
    A f()
    {
        return foo.g().foo;
    }
};

int main()
{
    B foo;
    foo = (foo.foo.foo).foo.foo.foo.foo.g();
    foo.foo.f().foo.g().foo.foo.g();
    foo.foo.foo.foo.foo.foo.foo.g().foo.b = getString().length();
    return 0;
}

class B
{
    int a;
    A foo;
    B g()
    {
        //test left value for increment result
        (++(++a))++;
        return foo.f().foo;
    }
};
