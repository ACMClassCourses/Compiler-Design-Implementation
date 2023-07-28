/*
Test Package: Sema_Local_Preview
Test Target: Misc
Author: 10' Bo Dai
Time: 2019-10-20
Verdict: Success
Origin Package: Semantic Pretest
*/
int cd(int d, string a, string b, string c, int sum) {
    if (d == 1) {
        println("move " + a + " --> " + c);
        sum++;
    } else {
        sum = cd(d - 1, a, c, b, sum);
        println("move " + a + " --> " + c);
        sum = cd(d - 1, b, a, c, sum);
        sum++;
    }
    return sum;
}

int main() {
    string a = "A";
	string b = "B";
	string c = "C";
    int d = getInt();
    int sum = cd(d, a, b, c, 0);
    println(toString(sum));
    return 0;
}