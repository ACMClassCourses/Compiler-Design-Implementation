/*
Test Package: Sema_Local_Preview
Test Target: Array
Author: 16' Boyu Tian
Time: 2019-11-11
Verdict: Success
Origin Package: Semantic Pretest
*/
int main()
{
    //test your array type;
    int[][][][] a = new int[100][200][300][500];
    int b;
    int[][][] c = a[3];
    int[][] d = c[7];
    int e = c[7][8][9];
    if(d[2][1] == c[1][2][3] && d[2][2] == a[1][2][3][4] && d[2][3] == b)
        ++c[1][2][3];
    return 0;
}