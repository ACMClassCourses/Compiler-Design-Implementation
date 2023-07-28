/*
Test Package: Sema_Local_Preview
Test Target: Basic
Author: Admin
Time: 2019-11-11
Verdict: Fail
Comment: Return type not correct(string"hello" to int)
Origin Package: Semantic Pretest
*/
int foo(int a) {
    if (a == 1) return 0;
    else if (a > 5) {
        if (a < 10) {
            if (a > 8) {
                if (a <= 9) {
                    return "hello";
                }
            }
        }
    }else {
        return 1;
    }
}

int main() {
    foo(9);
}