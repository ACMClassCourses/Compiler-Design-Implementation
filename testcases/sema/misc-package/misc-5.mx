/*
Test Package: Sema_Local_Preview
Test Target: Misc
Author: 15' Yiran Wu
Time: 2019-10-20
Verdict: Success
Origin Package: Semantic Extended
*/
class testClass1
{
	int a;
	int b;
	int c;
	int classFunc()
	{
		return 0;
	}
};
class testClass2
{
	testClass1 obj;
};
int max(int a,int b)
{
	if(a>b) return a;
	else return b;
}

int main()
{
	int i=max(3,5);
	int j=0;
	int[][] arr=new int[5][5];
	for(i=0;i<5;i++)
	{
		j=0;
		while(j<100000)
		{
			arr[i][++j]=(i+j)&((i<<10)+1^(5*j));
			if(j>4 && max(1,2)==2) break;
			else continue;
		}
	}
	string str="compiler2017";
	print(str.substring(0,str.length()-1));
	i=1;
	return max(-i,0);
}