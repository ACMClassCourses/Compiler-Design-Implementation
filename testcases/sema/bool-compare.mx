/*
Test Package: Sema_Local_Preview
Test Target: Bool compares
Author: Pikachu
Time: 2019-10-14
*/

void f(int x, int y, int z){
  bool a, b;
  if(b > true)    {} // expected error: Binary operator '>' cannot be applied to bool and bool
  if(b < true)    {} // expected error: Binary operator '<' cannot be applied to bool and bool
  if(b >= true)   {} // expected error: Binary operator '>=' cannot be applied to bool and bool
  if(b <= true)   {} // expected error: Binary operator '<=' cannot be applied to bool and bool
  if(b == true)   {} // accepted
  if(b != true)   {} // accepted

  if(b > false)    {} // expected error: Binary operator '>' cannot be applied to bool and bool
  if(b < false)    {} // expected error: Binary operator '<' cannot be applied to bool and bool
  if(b >= false)   {} // expected error: Binary operator '>=' cannot be applied to bool and bool
  if(b <= false)   {} // expected error: Binary operator '<=' cannot be applied to bool and bool
  if(b == false)   {} // accepted
  if(b != false)   {} // accepted

  if(true == true) {} // accepted
  if(false == true) {} // accepted
  if(false == false) {} // accepted
  if(true == true) {} // accepted
  if(true > true) {} // expected error: Binary operator '>' cannot be applied to bool and bool
  if(false > false) {} // expected error: Binary operator '>' cannot be applied to bool and bool

  if(b > 1){} // expected error: Binary operator '>' request for the same type

  if (a > b)      {} // expected error: Binary operator '>' cannot be applied to bool and bool
  if (a < b)      {} // expected error: Binary operator '<' cannot be applied to bool and bool
  if (a >= b)     {} // expected error: Binary operator '>=' cannot be applied to bool and bool
  if (a <= b)     {} // expected error: Binary operator '<=' cannot be applied to bool and bool
  if (a == b)     {} // accepted
  if (a != b)     {} // accepted

  if (a > 0) {} // expected error: Binary operator '>' request for the same type
  if (a > 1) {} // expected error: Binary operator '>' request for the same type

  if (!a > 0)     {} // expected error: Binary operator '>' request for the same type
  if (!a > 1)     {} // expected error: Binary operator '>' request for the same type
  if (!a > 2)     {} // expected error: Binary operator '>' request for the same type
  if (!a > y)     {} // expected error: Binary operator '>' request for the same type
  if (!a > b)     {} // expected error: Binary operator '>' cannot be applied to bool and bool
  if (!a > -1)    {} // expected error: Binary operator '>' request for the same type

  if (!a < 0)     {} // expected error: Binary operator '<' request for the same type
  if (!a < 1)     {} // expected error: Binary operator '<' request for the same type
  if (!a < y)     {} // expected error: Binary operator '<' request for the same type
  if (!a < b)     {} // expected error: Binary operator '>' cannot be applied to bool and bool

  if ((a||b) > 0) {} // expected error: Binary operator '>' request for the same type
  if ((a||b) > 1) {} // expected error: Binary operator '>' request for the same type


  if ((a&&b) > 0) {} // expected error: Binary operator '>' request for the same type
  if ((a&&b) > 1) {} // expected error: Binary operator '>' request for the same type

  if ((a<y) == z) {} // expected error: Binary operator '<' request for the same type
  // if (x>y<z)      {} // no warning
  if ((a<y) > z)  {} // expected error: Binary operator '<' request for the same type
  if((x<y)==(z<y)){} // no warning
  if((x<y)!=(z<y)){} // no warning
  if((z==x)<(y==z)){}  // expected error: Binary operator '<' request for the same type

  if (0 > !a)     {} // expected error: Binary operator request for the same type
  if (1 > !a)     {} // expected error: Binary operator request for the same type
  if (2 > !a)     {} // expected error: Binary operator request for the same type
  if (y > !a)     {} // expected error: Binary operator request for the same type
  if (-1 > !a)    {} // expected error: Binary operator request for the same type

  if (0 < !a)     {} // expected error: Binary operator request for the same type
  if (1 < !a)     {} // expected error: Binary operator request for the same type
  if (2 < !a)     {} // expected error: Binary operator request for the same type
  if (y < !a)     {} // expected error: Binary operator request for the same type
  if (-1 < !a)    {} // expected error: Binary operator request for the same type

  if (0 > (a||b)) {} // expected error: Binary operator request for the same type
  if (1 > (a||b)) {} // expected error: Binary operator request for the same type
  if (4 > (a||b)) {} // expected error: Binary operator request for the same type

  if (0 > (a&&b)) {} // expected error: Binary operator request for the same type
  if (1 > (a&&b)) {} // expected error: Binary operator request for the same type
  if (4 > (a&&b)) {} // expected error: Binary operator request for the same type

  if (0 > (a<y))  {} // expected error: Binary operator request for the same type
  if (1 > (a<y))  {} // expected error: Binary operator request for the same type
  if (4 > (a<y))  {} // expected error: Binary operator request for the same type
  if (z > (a<y))  {} // expected error: Binary operator request for the same type
  if (-1 > (a<y)) {} // expected error: Binary operator request for the same type
  if((y==z)<(z==x)){} // accepted

  if(((z==x)<(-1==z))!=(x<y)){} // expected error: Binary operator request for the same type
  if(((z==x)<(z==-1))!=(x<y)){} // expected error: Binary operator request for the same type
  if(((z==x)<-1)!=(x<y)){} // expected error: Binary operator request for the same type
  if(((z==x)< 2)!=(x<y)){} // expected error: Binary operator request for the same type
  if(((z==x)<(z>2))!=(x<y)){} // expected error: Binary operator request for the same type
}

int main(){
  f(1,2,3);
}