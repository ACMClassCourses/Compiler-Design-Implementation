/*
Test Package: Codegen
Author: 10' Huan Yang
Time: 2020-01-25
Input:
=== input ===
103
=== end ===
Output:
=== output ===
67
=== end ===
ExitCode: 0
InstLimit: -1
Origin Package: Codegen Pretest-525
*/
#include<cstdio>

int N;
int head;
int startx;
int starty;
int targetx;
int targety;
int x;
int y;
int *xlist = new int[12000];
int *ylist = new int[12000];
int tail;
int ok;
int now;
int *dx = new int[8];
int *dy = new int[9];
int **step;
int i;
int j;

void origin(int N)
{   
    head = 0;
    tail = 0;
	step = new int*[N];
    for (i = 0; i < N; i ++ ) {
		step[i] = new int[N];
        for (j = 0; j < N; j ++ )
        step[i][j] = 0;
    }	
}

bool check(int a) {
    return ((a < N) && (a >= 0));
}

void addList(int x, int y) {
    if (check(x) && check(y) && step[x][y] == -1) {
        tail ++;
        xlist[tail] = x;
        ylist[tail] = y;
        step[x][y] = now + 1;
        if ((x == targetx) && (y == targety)) ok = 1;
    }
}
int main() {
	origin(106);
    scanf("%d", &N);
    // N = getInt();
    targety  = N - 1;
    targetx = targety;
    for (i = 0; i < N; i ++)
        for (j = 0; j < N; j ++)
        step[i][j] = -1;
    dx[0] = -2; dy[0] = -1;
    dx[1] = -2; dy[1] = 1;
    dx[2] = 2; dy[2] = -1;
    dx[3] = 2; dy[3] = 1;
    dx[4] = -1; dy[4] = -2;
    dx[5] = -1; dy[5] = 2;
    dx[6] = 1; dy[6] = -2;
    dx[7] = 1; dy[7] = 2;
    while (head <= tail) {
        x = xlist[head];
        y = ylist[head];
        now = step[x][y];
        for (j = 0;j < 8;j ++)
            addList(x + dx[j], y + dy[j]);
        if (ok == 1) break;
        head ++;
    }
    if (ok == 1) printf("%d\n", (step[targetx][targety]));
    else printf("no solution!\n");
    return 0;
}
