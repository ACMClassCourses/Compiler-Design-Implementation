/*
Test Package: Sema_Local_Preview
Test Target: Classes
Author: 15' Lianming Zheng
Time: 2019-10-20
Verdict: Success
Origin Package: Semantic Extended
*/

A object;

int main() {
    object.func1(2, 3);

    object.set(0, 1)
          .set(1, 0);

    object.copy(object.getThis())
          .copy(object.getThis().getThis());

    return 0;
}

class A {
    void func1(int x, int y) {
        func2(this.x*x, this.y*y);
    }

    void func2(int xx, int yy) {
        func1(x*this.x, y*this.y);
    }

    A set(int xx, int yy) {
        return set(x, y).set(this.x, this.y).set(xx, yy).getThis();
    }

    A copy(A other) {
        // this = other;
        return this;
    }

    A getThis() {
        return getThis().getThis().getThis().getThis().copy(this);
    }

    int x; int y;
};