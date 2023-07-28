/*
Test Package: Codegen
Author: Yunwei Ren
Input:
=== input ===
=== end ===
Output:
=== output ===
Passed tests.

=== end ===
ExitCode: 0
InstLimit: -1
*/

//#include queue.mh TYPE:int


int main() {
  Queue_int q = new Queue_int();

  int i;
  int N = 100;
  for (i = 0; i < N; ++i)
    q.push(i);
  if (q.size() != N) {
    println("q.size() != N after pushes");
    return 1;
  }

  for (i = 0; i < N; ++i) {
    int head = q.top();
    if (head != i) {
      println("Head != i");
      return 1;
    }

    if (q.pop() != i) {
      println("Failed: q.pop() != i");
      return 1;
    }
    if (q.size() != N - i - 1) {
      println("q.size() != N - i - 1");
      return 1;
    }
  }

  // TODO: stronger tests

  println("Passed tests.");
  return 0;
}
