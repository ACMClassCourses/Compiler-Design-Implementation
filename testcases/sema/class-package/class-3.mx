/*
Test Package: Sema_Local_Preview
Test Target: Classes
Author: 15' Bowen Tan
Time: 2019-10-20
Verdict: Success
Origin Package: Semantic Extended
*/
class AAA {
    string str;

    AAA() {
        str = "abcde";
    }

    void AAAprint() {
        print(str);
        print(toString(str.length()));
    }
};

class BBB {
    AAA a;

    BBB() {
        a.str = a.str + "1234567890";
    }
};

int main() {
    int a;
    int b = a + a * a % a;

    BBB[][] bb = new BBB[10][10];

    int i;
    for (i = 1; i <= 10; i++) {
        bool i = false;
        if (i) {
            print("a");
        } else {
            println("b");
        }
    }

    bb[5][5].a.AAAprint();
}