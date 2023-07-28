/*
Test Package: Sema_Local_Preview
Test Target: Misc
Author: 15' Zhitian Xu
Time: 2019-10-20
Verdict: Success
Origin Package: Semantic Extended
*/


int AA(){
	println(toString(52215214));
	return 215;
}
int startnumber = 435;
int randomnumber(){
	startnumber = startnumber * 214 % 215;
	return startnumber;
}

class Minamoto_Yorimitsu{
	string[] skill; // = new string[3];
	int[] level; // = new int[3];
	string finalskill; // = "King of God no one escape";
	int np;
	Minamoto_Yorimitsu(){
		skill = new string[3];
		level = new int[3];
		finalskill = "King of God no one escape";
		skill[0] = "infinite military";
		skill[1] = "magicpower burst out(thunder)";
		skill[2] = "special killer";
		level[0] = 1;
		level[1] = 1;
		level[2] = 1;
		np = 0;
	}
	void levelup(int which){
		level[which] ++;
	}
	void npup(int energy){
		np = np + energy;
	}
	void Out(){
		if (np >= 100){
			println(finalskill);
			np = 0;
		}else println("Attack");
	}
};
int main(){
	// testcomment_"\n\\\"\njkjkblsd"
	int n = getInt();
	int [][] now = new int[10][];
	int i;
	for (i = 0;i < 10;i ++){
		now[i] = new int[10];
	}
	int j;
	for (i = 0;i < 10;i ++)
		for (j = 0;j < 10;j ++){
			if (i == 0){
				int A = 214;
				print(toString(AA()));
				now[i][j] = randomnumber();
			}else if (j == 0){
				now[i][j] = randomnumber();
			}else{
				string temp = "215\n\"\\abcdfk52215214";
				println(temp.substring(1,7));
				now[i][j] = temp.parseInt() * temp.length() * temp.ord(5) * randomnumber() % 215;
			}
		}
	string[] Jeand = new string[15];
	Jeand[0] = getString();
	int cnt = 0;
	while (Jeand[cnt].length() != 0){
		Jeand[++ cnt] = getString();
		if (cnt > 10) break;
	}
	testclass();
	return 0;
}
void testclass(){
	Minamoto_Yorimitsu onecard = new Minamoto_Yorimitsu;
	int i = 0;
	for (i = 0;i < 10;i ++) onecard.npup(randomnumber() % 15);
	for (i = 0;i < 10;i ++){
		int which = getInt() * randomnumber() % 3;
		onecard.levelup(which);
	}
	onecard.Out();
}