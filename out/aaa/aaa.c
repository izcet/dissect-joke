#include <stdio.h>

int main () {
  int x = 5;
  printf(
    "%d %d %d \n",
    x++, x++, x++
  );
  return 0;
}

