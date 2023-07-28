/*
Test Package: Sema_Local_Preview
Test Target: Misc
Author: 14' Tiancheng Xie
Time: 2019-10-20
Verdict: Success
Origin Package: Semantic Pretest
*/
string miracle = "\"orange________\"";

class moment_ring
{
	string[] singers;
	string lryics;
	void init()
	{
		this.singers = new string[9];
		lryics = "kii te yo ima no kimochi wa\nsouda na souda na katari kirenai\n...";
	}
};

int depth;

void another_fun()
{
	moment_ring song;
	song.init();
	depth--;
	if(depth > 0)
		another_fun();
	else
		//fun();
		fun(2017);
}

class test
{
	string txt;
	test init()
	{
		txt = "you should pass this one";
		return this;
	}
	test init2(test t)
	{
		t.txt = "TAT";
		this.txt = t.txt;
		return t;
	}
};

int main()
{
	int a;
	{
		int a = 0;
		println(toString(a));
	}
	a = 1;
	test nico;
	println(nico.init().txt);
	println(toString(nico.init().txt.ord(0)));
	depth = 3;
	another_fun();
	;
	return toString(fun(10).ord(0)).ord(0);
}

string fun(int pos)
{
	if(pos < 0)
		return "";
	return fun(pos - 1) + toString(miracle.ord(pos));
}