/*
Test Package: Sema_Local_Preview
Test Target: Basic
Author: Pikachu
Time: 2019-11-11
Verdict: Fail
Comment: no target named A.
Origin Package: Semantic Pretest
*/
//dot hell
class A { int a;};
class B { A b;  };
class C { B c;  };
class D { C d;  };
class E { D e;  };
class F { E f;  };
class G { F g;  };
G world = new G;
void hello(int world) {
}
int main() {
    hello(world.g.f.e.d.c.b.a.A);
    return 0;
}