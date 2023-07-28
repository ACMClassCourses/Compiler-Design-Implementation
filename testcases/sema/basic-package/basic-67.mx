/*
Test Package: Sema_Local_Preview
Test Target: Basic
Author: 16' Yunfeng Lin
Time: 2019-11-11
Verdict: Fail
Comment: left value operation is invalid here.
Origin Package: Semantic Pretest
*/
int main()
{
    int a;
    ++(((++(((++(++a))++)++))++)++);
    ++a++;
    return 0;
}
