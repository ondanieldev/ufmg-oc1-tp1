void bubble_sort(int a[], int n)
{
  int i = 0, j = 0, tmp;
  for (i = 0; i < n; i++)
  {
    for (j = 0; j < n - i - 1; j++)
    {
      if (a[j] > a[j + 1])
      {
        tmp = a[j];
        a[j] = a[j + 1];
        a[j + 1] = tmp;
      }
    }
  }
}

int main()
{
  int arr[] = {27, 16, 20, 49, 39, 48, 38, 7, 5, 19};
  int n = sizeof(arr) / sizeof(arr[0]);
  bubble_sort(arr, n);
  return 0;
}