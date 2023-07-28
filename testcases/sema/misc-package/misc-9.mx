/*
Test Package: Sema_Local_Preview
Test Target: Misc
Author: 14' Xiaojun Wu
Time: 2019-10-20
Verdict: Success
Origin Package: Semantic Pretest
*/
class Fibonacci{
	int x;
	int result;
	
	void reset(){
		x = 0;
		result = 0;
	}
	
	void set_problem(int x_in){
		reset();
		x = x_in;
	}
	
	int calc(int cur_num){
		if (cur_num == 0)
			return 1;
		else
			return cur_num * calc(cur_num-1);
	}
	
	int get_result(){
		result = calc(x);
		return result;
	}
};

int main(){
	Fibonacci teacher;
	teacher = new Fibonacci;
	int x;
	for (x = 0; x < 5; x++){
		teacher.set_problem(x);
		println(toString(teacher.get_result()));
	}
	return 0;
}