/*
Test Package: Sema_Local_Preview
Test Target: Misc
Author: 15' Jiacheng Yang
Time: 2019-10-20
Verdict: Success
Origin Package: Semantic Extended
*/

int reed = 12883127;
int n;

int rand() {
	reed = reed + (reed << 5) + 1727317;
	if (reed % 1772371 < 1000) {
		reed = reed ^ (reed + 818277) | (reed - 18217);
	}
	int const = 1 << 30;
	return reed & (~const >> 2);
}

class Test{
	string [][] array;
	Test() {
		int i;
		int j;
		this.array = new string [n][];
		for (i = 0; i < n; i++) {
			int sum;
			sum = 0;
			this.array[j] = new string[(i + i * i + 3) | 13];
			int s = 0;
			for (j = 0; j < ((i + i * i + 2) | 13); j++) {
				this.array[i][j] = toString(rand());
			}
		}
	}
	void printme() {
		int i;
		int j;
		int k;
		for (i = 0; i < n; i++)
			for (j = 0; j - i * i < i + 3; j++) {
				println(this.array[i][j]);
				println("toInt: " + toString(this.array[i][j].parseInt()));
				int l;
				int r;
				l = rand() % array[i][j].length();
				r = rand() % array[i][j].length();
				if (l > r) {
					int t;
					t = l;
					l = r;
					r = t;
				}
				println("substr: " + this.array[i][j].substring(l, r));
				for (k = 0; k + 1 < array[i][j].length() + 1; k = k + 2) {
					print(toString(array[i][j].ord(k)) + " ");
				}
				println("");
			}
	}
};

int main() {
	n = getInt();
	println("BY Kipsora");
	Test a = new Test;
	a.printme();
	a.array = new string[3][3];
	if (true) { int a; }
	else { int a; }
	for (;;) { int a; }
	while (true) { int a; }
}