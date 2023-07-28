/*
Test Package: Sema_Local_Preview
Test Target: Conditions and scopes
Author: Pikachu
Time: 2019-10-13
*/
class S{
    int a;
    S getThis(){ return this; }
};

void test(){
    int a = -1;
    if(a){ ++a; } // expected error: condition cannot be int objects
    while(++a){ ++a; } //expected error: condition cannot be non-bool expression
    while(a != 0){ ++a; } // accepted
    
    S s;
    while(s) { ++s.a; } // expected error: condition cannot be compond objects
    while(s.a != false) { ++s.a; } // expected error: binary expression '!=' cannot be applied to int and bool
    while(s.getThis().getThis().getThis() != s){ ++s.a; } // accepted
    while(s.getThis() = a){ ++s.a; } // expected error: condition cannot be assignment sentences 
                                     // another expected error: this cannot be modified
    while(S st){ ++st.a; } // expected error: Declaration cannot be conditions
    while(int a = 0){ ++st.a; } // expected error: Declaration cannot be conditions


    for(int i = 0; i != s.a; ++i){ --s.a; } // expected error: initial sentence cannot be declarations
    for(i = 0; i != s.a; ++i){ --s.a; } // expected error: variable i is not defined before.
    for(a = 0; a != s.a; ++a){ --s.a; } // accepted.
    for(;;){ --s.a; } // accepted.
    for(;a - s.a; --a){ --s.a; } // expected error: condition cannot be int objects
    for(;;){ int a = -1; } // accepted. Notes: this a is in the subscope of the test
    int a = -2; // expected error: redefinition of variable a

    for(;;) int a = -2; // accepted: a is in the new scope    
}

int main(){
    println("Good Luck!");
    return 0;
}