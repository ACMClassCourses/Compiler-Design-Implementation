/*
Test Package: Sema_Local_Preview
Test Target: Scope
Author: 14' Yurong You
Time: 2019-11-11
Verdict: Fail
Comment: Variable a, b outside valid scope.
Origin Package: Semantic Extended
*/
int f(){
	for (;;) int a = 1;
	return a;
}

int g(){
	while(true) int b = 1;
	return b;
}
int main(){
	return 0;
}