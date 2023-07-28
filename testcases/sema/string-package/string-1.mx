/*
Test Package: Sema_Local_Preview
Test Target: String
Author: 15' Caomeng Yao
Time: 2019-10-20
Verdict: Success
Origin Package: Semantic Extended
*/

string[] str_arr = null;

int main() {
    int la = getInt();
    str_arr = new string[la];

    int i;
	int cnt = 0;
    for (i = 0; i < la; i++) {
 		str_arr[i] = getString();
		cnt = cnt + str_arr[i].length();
	}
	
	string str = "";
	int sum = 0;
    for (i = 0; i < la; ++i){
		str = str + str_arr[i].substring(0, str_arr[i].length() - 1);
		sum = sum + str_arr[i].ord(0);
	}
	println(str);
	print(toString(sum));
	if (cnt == str.length()) return 0;
	
	else return 1;
}
