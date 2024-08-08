/*
Test Package: Sema_Local_Preview
Test Target: Basic
Author: 16' Xiaoyuan Liu
Time: 2019-11-11
Verdict: Success
Origin Package: Semantic Pretest
*/
// function in function
// null as para
int too(int young) {
    return young;
}
int young(int too) {
    return too;
}
int simple(sometimes naive) {
    return 1926;
}
class sometimes {
	int naive;
	void make_money() {
		this.naive++;
	}
};
int main() {
    sometimes naive = null;
    print(toString(
        too(young(too(simple(naive))))
    ));
}
