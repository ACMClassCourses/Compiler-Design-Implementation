//#include heap.mh TYPE:Kv

class Kv {
  int key_() {
    return k;
  }

  int k;
  int v;
};

int main() {
  Heap_Kv heap = new Heap_Kv();

  int i;
  int top = 0;
  int prime = 7;
  for (i = 0; i < 100; ++i) {
    int k = (prime * i) % 100;
    Kv kv = new Kv();
    kv.k = -k;
    kv.v = k;
    if (-k > top)
      top = -k;
    heap.push(kv);
    if (heap.top().k != top) {
      println("Failed");
      return 1;
    }
    if (heap.size() != i + 1) {
      println("Failed: size()");
      return 1;
    }
  }

  for (i = 0; i < 100; ++i) {
    Kv kv = heap.pop();
    if (kv.v != i) {
      println("Failed!");
      return 1;
    }
    if (heap.size() != 99 - i) {
      println("Failed: size()");
      return 1;
    }
  }

  println("Passed!");

  return 0;
}
