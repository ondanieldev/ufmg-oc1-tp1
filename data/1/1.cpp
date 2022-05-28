#include <iostream>

int main()
{
  int c = 0, q = 1, v = 2;

  if (c == 0 && q != 0 && v != 0)
  {
    return q / v;
  }

  else if (c != 0 && q == 0 && v != 0)
  {
    return c * v;
  }

  else if (c != 0 && q != 0 && v == 0)
  {
    return q / c;
  }

  else
  {
    return 0;
  }

  return 0;
}
