/*
Test Package: Sema_Local_Preview
Test Target: Misc
Author: 15' Zhekai Zhang
Time: 2019-10-20
Verdict: Success
Origin Package: Semantic Extended
*/
int countA;
int countB;
int countC;
C something;

class A
{
	A a;
	B b;
	A()
	{
		idx = countA++;
		if(idx % 2 == 0)
		{
			a = new A;
			if(countB % 2 == 0)
				b = new B;
			else
				b = null;
		}
		else
			a = null;
		c = new C[2][];
		c[0] = (new C[6][6][6][6])[2][3][3];
		c[1] = null;
		if(c.size() != 2)
			println("Oops!");
	}
	C[] getc0()
	{
		return c[0];
	}
	C[][] c;
	int idx;
};

class B
{
	int idx;
	C c;
	B()
	{
		idx = countB++;
		c = (new A).getc0()[0].Me().Me();
	}
};

class C
{
	int idx;
	C()
	{
		this.idx = countC++;
		str = toString(idx);
		something = Me();
	}
	C Me() { return this; }
	string str;
};

void count()
{
	countA = 0;
	countB = 0;
	countC = 0;
	B b = new B;
	println(toString(countA) + " " + toString(countB) + " " + toString(countC));
	countA = 1;
	countB = 1;
	countC = 1;
	b = new B;
	print(toString(countA-1) + " " + toString(countB-1) + " " + toString(countC-1));
	print("\n");
	println(toString(something.Me().str.substring(1, something.str.length()-1).parseInt()));
	string temp = toString(something.str.ord(42 & 21));
	if(temp < something.str)
		println(something.str + ">" + temp);
	else
		println(something.str + "<=" + temp);
}

///////////////////////////////////

int main()
{
	{{{;};{}}};
	int i;
	for(i=0;;i++)
		if(((i ^ 891 & 759) == 666) == !false)
		{
			println(toString(i));
			int i = 0;
			println(toString(i));
			{
				int i = 1;
				println(toString(i));
			}
			count();
			break;
		}
	while(true)
	{
		if(i % 2 == 0)
			continue;
		print(toString(i)+",");
	}
	println("");
	return 0;
}
