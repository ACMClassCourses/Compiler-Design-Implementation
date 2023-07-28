/*
Test Package: Sema_Local_Preview
Test Target: Classes
Author: 14' Huichen Li
Time: 2019-10-20
Verdict: Success
Modified Flag: True
Origin ID: 610
Origin Package: Semantic Extended
*/
class Cat{
	void greet(){
		println("MIAOMIAOMIAO");
	}
};

class Lamb{
	void greet(){
		println("MIEMIEMIE");
	}
};

class Animals{
	Cat c;
	Lamb l;
    Animals(){
        c = new Cat;
        l = new Lamb;
    }
	void greet(){
		c.greet();
		l.greet();
	}
};

int main(){
	Cat cat;
	cat = new Cat;
	Lamb lamb;
	lamb = new Lamb;
	Animals a = new Animals;
	a.c = cat;
	a.l = lamb;
	a.greet();
}