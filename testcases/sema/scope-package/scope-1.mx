/*
Test Package: Sema_Local_Preview
Test Target: Scope
Author: 15' Peiyao Sheng
Time: 2019-10-20
Verdict: Success
Origin Package: Semantic Extended
*/
int x = 1;
bool b(bool x){
    return x;
}
class C{
    C(){
        x();
        {int x;}
    }
    void x(){}
};
int main(){
    string x = "789dcbadcba\n";
    int y;
    C c;
    c.x();
    b(true);
    {y = x.parseInt();
    int x = y;}
    return y;
}