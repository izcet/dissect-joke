### Dissecting joke.c
_Explaining a joke is like dissecting a frog. You understand it better but the frog dies in the process."
- E.B White_

A bit ago I came across this code snippet in a channel dedicated to technical funnies:
```
#include <stdio.h>

int main () {
  int a = 5;
  printf("%d %d %d\n", a++, ++a, a++);
  return 0;
}
```
If you compile this with `gcc`, this program outputs `7 8 5`, presumably following the old classic "Why is 6 afraid of 7?"

Now that the punchline is out of the way... what just actually happened? Why is that our answer?

This project exists to document my exploration into the compiler mechanics that produce this output, and highlight insights discovered along the way.


