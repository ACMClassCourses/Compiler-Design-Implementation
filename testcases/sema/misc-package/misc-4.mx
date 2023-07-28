/*
Test Package: Sema_Local_Preview
Test Target: Misc
Author: 15' Zhenjia Xu
Time: 2019-10-20
Verdict: Success
Origin Package: Semantic Extended
*/

class ClassA{
	int num;
	string str;
	bool[] bool_arr;
	ClassA(){
		str = "";
		num = 1;
		bool_arr = null;
		bool_arr = new bool[100];
		return;
	}
	ClassA getClassA(int x){
		ClassA tmp = new ClassA;
		tmp.num = x;
		this.num = x;
		return tmp;
	}
	string getString(){
		return str;
	}
};
int Main(int parameter){
	ClassA a = new ClassA;
	ClassA b = a.getClassA(parameter);
	b.num = parameter;
	parameter = getInt();
	int[] int_arr = (new int[2][])[3];
	int number = b.getString().parseInt() + getString().ord(123) % b.getString().substring(1, 3).length();
	string str1 = "123";
	string str2 = "456";
	int num = 0;
	if(str1 < str2) num++;
	if(str1 <= str2) num++;
	if(str1 > str2) num++;
	if(str1 >= str2) num++;
	if((str1 + str2) == (str1 + str2)){
		num++;
	}else if(false)
			num--;
			else --num;
	for(;;){
		break;
	}
	while(true)
		continue;
	println(str1);
	print(str2);
	return num;
}
int main() {
    Main(0);
}