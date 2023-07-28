/*
Test Package: Sema_Local_Preview
Test Target: Basic
Author: 16' Yunfeng Lin
Time: 2019-11-11
Verdict: Fail
Comment: Illegal member access.
Origin Package: Semantic Pretest
*/
class A{
    int a;
    A ptr;
    B alt;
    B af(){
        return alt.pf();
    }
    A pf(){
        return alt.af();
    }
};

int main()
{
    A ptr;
    B alt;
    //legal
    ptr.ptr.(ptr).alt.alt.a = alt.af().pf().af().pf().b;
    alt.pf();
    //illegal
    ptr.(alt.ptr);
    ptr.alt.(b+1);

    return 1;
}

class B{
    int b;
    A alt;
    B ptr;
    A af(){
        return alt.pf();
    }
    B pf(){
        return alt.af();
    }
}