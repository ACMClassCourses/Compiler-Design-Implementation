int main() {
  int n = getInt();
  int[] a = new int[n];

  int i;
  for (i = 0; i < n; ++i)
    a[i] = getInt();

  SORT(a);

  for (i = 0; i < n; ++i)
    print(toString(a[i]) + " ");
  println("");

  return 0;
}
