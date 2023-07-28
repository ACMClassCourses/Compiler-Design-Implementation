/*
Test Package: Sema_Local_Preview
Test Target: Misc
Author: 14' Yurong You
Time: 2019-10-20
Verdict: Success
Modified Flag: True
Origin ID: 611
Origin Name: vector
Origin Package: Semantic Extended
*/
class vector{
	int[] data;
    vector(){
        data = new int[10];
    }
	void init(int[] vec){
		// init the vector from an array
		if (vec == null) return;
		data = new int[vec.size()];
		int i;
		for (i = 0; i < vec.size(); ++i)
		{
			data[i] = vec[i];
		}
	}

	int getDim(){
		if (data == null) return 0;
		return data.size();
	}

	int dot(vector rhs){
		int i = 0;
		int result = 0;
		while(i < getDim()){
			//result = data[i] * rhs[i];
			result = data[i] * rhs.data[i];
			++i;
		}
		return result;
	}

	vector scalarInPlaceMultiply(int c){
		if (data == null) return null;
		int i;
		for (i = 0; i < getDim(); ++i) {
			this.data[i] = c * this.data[i];
		}
		return this;
	}

	vector add(vector rhs){
		if (getDim() != rhs.getDim() || getDim() == 0)
			return null;
		//int[] temp = new int[getDim()];
		vector temp = new vector;
		int i;
		for (i = 0; i < getDim(); ++i){
			temp.data[i] = data[i] + rhs.data[i];
		}
		return temp;
	}

	bool set(int idx, int value){
		if (getDim() < idx) return false;
		data[idx] = value;
		return true;
	}

	string toString(){
		string temp = "( ";
		if (getDim() > 0) {
			temp = temp + toString();
		}
		int i;
		for (i = 1; i < getDim(); ++i) {
			temp = temp + ", " + toString();
		}
		temp = temp + " )";
		return temp;
	}

	bool copy(vector rhs){
		if (rhs == null) return false;
		if (rhs.getDim() == 0) {
			data = null;
		} else {
			data = new int[rhs.getDim()];
			int i;
			for (i = 0; i < getDim(); ++i) {
				data[i] = rhs.data[i];
			}
		}
		return true;
	}
};

int main(){
	vector x = new vector;
	int[] a = new int[10];
	int i;
	for (i = 0; i < 10; ++i){
		a[i] = 9 - i;
	}
	x.init(a);
	print("vector x: ");
	println(x.toString());
	vector y = new vector;
	y.copy(x);
	if (y.set(3, 817)){
		println("excited!");
	}
	print("vector y: ");
	println(y.toString());
	print("x + y: ");
	println((x.add(y)).toString());
	print("x * y: ");
	println(toString(x.dot(y)));
	print("(1 << 3) * y: ");
	println(x.scalarInPlaceMultiply(1 << 3).toString());
}