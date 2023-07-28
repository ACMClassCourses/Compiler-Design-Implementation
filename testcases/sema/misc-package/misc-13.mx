/*
Test Package: Sema_Local_Preview
Test Target: Misc
Author: 10' Bo Dai
Time: 2019-10-20
Verdict: Success
Origin Package: Semantic Extended
*/
int N = 8;
int[] row = new int[8];
int[] col = new int[8];
int[][] d = new int[2][];

void printBoard() {
    int i;
    int j;
    for (i = 0; i < N; i++) {
        for (j = 0; j < N; j++) {
            if (col[i] == j)
                print(" O");
            else
                print(" .");
        }
        println("");
    }
    println("");
}

void search(int c) {
    if (c == N) {
        printBoard();
    }
    else {
        int r;
        for (r = 0; r < N; r++) {
            if (row[r] == 0 && d[0][r+c] == 0 && d[1][r+N-1-c] == 0) {
                row[r] = 1;
                d[0][r+c] = 1;
                d[1][r+N-1-c] = 1;
                col[c] = r;
                search(c+1);
                row[r] = 0;
                d[0][r+c] = 0;
                d[1][r+N-1-c] = 0;
            }
        }
    }
}

int main() {
    int i;
	for (i = 0; i < 2; i ++)
	    d[i] = new int[8 + 8 - 1];
    search(0);
    return 0;
}