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

class Queue_int {
  Queue_int() {
    beg = 0;
    end = 0;
    storage = new int[16];
  }

  void push(int v) {
    if (size() == storage.size() - 1) {
      doubleStorage();
    }
    storage[end] = v;
    end = (end + 1) % storage.size();
  }

  int top() {
    return storage[beg];
  }

  int pop() {
    if (size() == 0) {
      println("Warning: Queue_int::pop: empty queue");
    }
    int res = top();
    beg = (beg + 1) % storage.size();
    return res;
  }

  int size() {
    return (end + storage.size() - beg) % storage.size();
  }

  void doubleStorage() {
    int[] copy = storage;
    int begCopy = beg;
    int endCopy = end;

    storage = new int[copy.size() * 2];
    beg = 0;
    end = 0;

    int i = begCopy;
    while (i != endCopy) {
      storage[end] = copy[i];
      end++;
      i = (i + 1) % copy.size();
    }
  }


  int[] storage;
  int beg;
  int end;
};

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
