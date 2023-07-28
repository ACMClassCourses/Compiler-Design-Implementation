/*
Test Package: Sema_Local_Preview
Test Target: Scope
Author: 16' Xiaoyuan Liu
Time: 2019-11-11
Verdict: Success
Origin Package: Semantic Extended
*/

// scope recover
class A {
    int a;
};
int main() {
	int x = 1;
	{
	    string x = "gzotpa";
	    {
	        bool x = true;
	        {
                A x = null;
	        }
	        if (x) print("gzotpa");
	    }
	    int y = x.length();
	}
	x = x + 1;
	return x;
}