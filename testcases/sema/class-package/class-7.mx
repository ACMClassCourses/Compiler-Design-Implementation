/*
Test Package: Sema_Local_Preview
Test Target: Classes
Author: 14' Tiancheng Xie
Time: 2019-10-20
Verdict: Success
Origin Package: Semantic Pretest
*/
int main()
{
	CLASS a = new CLASS;
	a.c = 0;
	println(toString(a.c));
	a.a = a;
	println(toString(a.a.a.a.a.a.a.a.a.a.a.c));
	CLASS b = new CLASS;
	b.a = a;
	b.b = b;
	a.b = b;
	println(toString(a.b.a.b.a.b.a.c));
	return 0;
}

class CLASS
{
	CLASS a;
	CLASS b;
	int c;
};