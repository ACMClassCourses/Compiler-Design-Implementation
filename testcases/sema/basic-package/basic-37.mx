/*
Test Package: Sema_Local_Preview
Test Target: Basic
Author: 16' Yutong Xie
Time: 2019-11-11
Verdict: Fail
Comment: null cannot be assigned to primitive type variable
Origin Package: Semantic Pretest
*/
int main() {
    
    int[][] graph = new int[3][];
    graph[0] = null;
    graph[1] = new int[10];
    graph[2] = new int[30];
    graph[2][0] = null; // null cannot be assigned to primitive type variable
    return 0;
}
