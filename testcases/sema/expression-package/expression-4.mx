/*
Test Package: Sema_Local_Preview
Test Target: Expression
Author: 15' Sidi Lu
Time: 2019-11-11
Verdict: Fail
Comment: RValue cannot be function.
Origin Package: Semantic Extended
*/
class testret
{
    int name;
    testret()
    {
	name = 2;
    }
};
testret ret_const()
{
    testret r = new testret;
    return r;
}
int main()
{
    ret_const() = new testret;
}
