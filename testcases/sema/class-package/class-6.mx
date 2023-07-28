/*
Test Package: Sema_Local_Preview
Test Target: Classes
Author: 14' Tiancheng Xie
Time: 2019-10-20
Verdict: Success
Origin Package: Semantic Pretest
*/
class A
{
	C c;
};
class B
{
	C c;
};
class C
{
	int a;
	string b;
};
int main()
{
	A a = new A;
	B b = new B;
	C c = new C;
	a.c = c;
	b.c = c;
	c.a = 0;
	c.b = getString();
	if(a.c.b + b.c.b == c.b + c.b)
	{
		c.b = c.b + c.b;
	}
	c.b = toString("123.456".parseInt());
	if(c.b == toString(123))
	{
		println(c.b);
	}
	return 0;
}




