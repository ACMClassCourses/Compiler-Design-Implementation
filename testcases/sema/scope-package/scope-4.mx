/*
Test Package: Sema_Local_Preview
Test Target: Scope
Author: 14' Yurong You
Time: 2019-11-11
Verdict: Fail
Comment: Variable c, d outside valid scope.
Origin Package: Semantic Extended
*/
int h(){
	if (true) int c = 1;
	return c;
}

int k(){
	if (true) ;
	else int d = 1;
	return d;
}

int l(){
	if (true) ;
	else if (true) int e = 1;
	return e;
}

int main(){
	return 0;
}