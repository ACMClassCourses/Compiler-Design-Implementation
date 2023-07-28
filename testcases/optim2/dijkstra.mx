/*
Test Package: Optim
Author: Yunwei Ren, 17
//#input dijkstra.in
//#output dijkstra.ans
ExitCode: 0
InstLimit: -1
*/

class Edge {
  int from;
  int to;
  int weight;
};

class EdgeList {
  void init(int n, int m) {
    edges = new Edge[m];
    next = new int[m];
    first = new int[n];
    int i;
    for (i = 0; i < m; ++i)
      next[i] = -1;
    for (i = 0; i < n; ++i)
      first[i] = -1;
    size = 0;
  }

  void addEdge(int u, int v, int w) {
    Edge e = new Edge();
    e.from = u;
    e.to = v;
    e.weight = w;

    edges[size] = e;
    next[size] = first[u];
    first[u] = size;
    ++size;
  }

  int nVertices() {
    return first.size();
  }

  int nEdges() {
    return edges.size();
  }


  Edge[] edges;
  int[] next;
  int[] first;
  int size;
};
class Array_Node {
  Array_Node() {
    sz = 0;
    storage = new Node[16];
  }

  void push_back(Node v) {
    if (size() == storage.size()) {
      doubleStorage();
    }
    storage[sz] = v;
    ++sz;
  }

  Node pop_back() {
    --sz;
    return storage[sz];
  }

  Node back() {
    return storage[sz - 1];
  }

  Node front() {
    return storage[0];
  }

  int size() {
    return sz;
  }

  void resize(int newSize) {
    while (storage.size() < newSize)
      doubleStorage();
    sz = newSize;
  }

  Node get(int i) {
    return storage[i];
  }

  void set(int i, Node v) {
    storage[i] = v;
  }

  void swap(int i, int j) {
    Node t = storage[i];
    storage[i] = storage[j];
    storage[j] = t;
  }


//private:
  void doubleStorage() {
    Node[] copy = storage;
    int szCopy = sz;

    storage = new Node[copy.size() * 2];
    sz = 0;

    for (; sz != szCopy; ++sz) {
      storage[sz] = copy[sz];
    }
  }


  Node[] storage;
  int sz;
};


class Heap_Node {
  Heap_Node() {
    storage = new Array_Node();
  }

  void push(Node v) {
    storage.push_back(v);
    int x = size() - 1;
    while (x > 0) {
      int p = pnt(x);
      if (storage.get(p).key_() >= storage.get(x).key_())
        break;
      storage.swap(p, x);
      x = p;
    }
  }

  Node pop() {
    Node res = storage.front();
    storage.swap(0, size() - 1);
    storage.pop_back();
    maxHeapify(0);
    return res;
  }

  Node top() {
    return storage.front();
  }

  int size() {
    return storage.size();
  }

// private:
  int lchild(int x) {
    return x * 2 + 1;
  }

  int rchild(int x) {
    return x * 2 + 2;
  }

  int pnt(int x) {
    return (x - 1) / 2;
  }

  void maxHeapify(int x) {
    int l = lchild(x);
    int r = rchild(x);
    int largest = x;

    if (l < size() && storage.get(l).key_() > storage.get(largest).key_())
      largest = l;
    if (r < size() && storage.get(r).key_() > storage.get(largest).key_())
      largest = r;

    if (largest == x)
      return;

    storage.swap(x, largest);
    maxHeapify(largest);
  }

  Array_Node storage;
};


int n;
int m;
EdgeList g;
int INF = 10000000;

void init() {
  n = getInt();
  m = getInt();
  g = new EdgeList();
  g.init(n, m);

  int i;
  for (i = 0; i < m; ++i) {
    int u = getInt();
    int v = getInt();
    int w = getInt();
    g.addEdge(u, v, w);
  }
}

class Node {
  int key_() {
    return -dist;
  }

  int node;
  int dist;
};


int[] dijkstra(int s) {
  int[] visited = new int[n];
  int[] d = new int[n];
  int i;
  for (i = 0; i < n; ++i) {
    d[i] = INF;
    visited[i] = 0;
  }
  d[s] = 0;

  Heap_Node q = new Heap_Node();
  Node src = new Node();
  src.dist = 0;
  src.node = s;
  q.push(src);

  while (q.size() != 0) {
    Node node = q.pop();
    int u = node.node;
    if (visited[u] == 1)
      continue;
    visited[u] = 1;
    int k;
    for (k = g.first[u]; k != -1; k = g.next[k]) {
      int v = g.edges[k].to;
      int w = g.edges[k].weight;
      int alt = d[u] + w;
      if (alt >= d[v])
        continue;
      d[v] = alt;
      node = new Node();
      node.node = v;
      node.dist = d[v];
      q.push(node);
    }
  }

  return d;
}



int main() {
  init();
  int i;
  int j;
  for (i = 0; i < n; ++i) {
    int[] d = dijkstra(i);
    for (j = 0; j < n; ++j) {
      if (d[j] == INF) {
        print("-1");
      } else {
        print(toString(d[j]));
      }
      print(" ");
    }
    println("");
  }

  return 0;
}