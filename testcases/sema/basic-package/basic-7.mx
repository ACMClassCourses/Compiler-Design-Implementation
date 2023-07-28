/*
Test Package: Sema_Local_Preview
Test Target: Basic
Author: 14' Tiancheng Xie
Time: 2019-10-20
Verdict: Fail
Comment: a.f(c) has void return value, which conflicts int.
Origin Package: Semantic Pretest
*/

class A
{
	int a;
	void f(int b)
	{
		a = b;
	}
};

int main()
{
	int c = 10;
	A a = new A;
	return a.f(c);
	return 0;
}
