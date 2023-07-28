/*
Test Package: Sema_Local_Preview
Test Target: Array
Author: 15' Haoran Ye
Time: 2019-10-20
Verdict: Success
Origin Package: Semantic Extended
*/

int main(){
	int[][] a = new int[5][5];
	int[][] b = new int[5][5];
	int[][] c = new int[5][5];
	a[1][1]=1;
	a[1][2]=1;
	a[1][3]=1;
	a[1][4]=1;
	a[2][1]=0;
	a[2][2]=1;
	a[2][3]=3;
	a[2][4]=6;
	a[3][1]=0;
	a[3][2]=0;
	a[3][3]=1;
	a[3][4]=7;
	a[4][1]=0;
	a[4][2]=0;
	a[4][3]=0;
	a[4][4]=1;
	b[1][1]=1;
	b[1][2]=1;
	b[1][3]=1;
	b[1][4]=1;
	b[2][1]=0;
	b[2][2]=-1;
	b[2][3]=3;
	b[2][4]=-6;
	b[3][1]=0;
	b[3][2]=0;
	b[3][3]=2;
	b[3][4]=11;
	b[4][1]=0;
	b[4][2]=0;
	b[4][3]=0;
	b[4][4]=-6;
	int i;
	int j;
	int k;
	for(i = 1; i <= 4; i++)
		for(j = 1; j <= 4; j++){
			c[i][j] = 0;
			for(k = 1; k <= 4; k++){
				c[i][j] = c[i][j] + a[i][k] * b[k][j];
			}
		}
	return c[1][1] + c[2][2] + c[3][3] + c[4][4];
}