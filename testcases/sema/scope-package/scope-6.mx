/*
Test Package: Sema_Local_Preview
Test Target: Scope
Author: 16' Xiaoyuan Liu
Time: 2019-11-11
Verdict: Success
Origin Package: Semantic Extended
*/
// class 'this'
// scope in class
bool a;
bool b;
class A {
    int a;
    int b;
    A () {
        a = 1;
        b = a + 1;
        this.a = b;
        this.b = this.a + 1;
        {
            string a = toString(this.b);
            string b = a;
        }
    }
};
int main() {
    A a = new A();
	println("too young too simple.");
	return 0;
}