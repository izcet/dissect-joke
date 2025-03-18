### Dissecting joke.c
_Explaining a joke is like dissecting a frog. You understand it better but the frog dies in the process."
- E.B White_

A bit ago I came across this code snippet distributed in the file `joke.c`:
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

##### Links
- Slides for a whimsical talk I gave about this are [here](https://docs.google.com/presentation/d/1yG5rKZt_CGa4Rf67s3sVXJQeDD1e-aKckuRR18OwlBw/edit?usp=sharing)
- Clang output is visualized [here](https://docs.google.com/spreadsheets/d/1gU6ICCzszey-t_UoE9Qg6gnDlBPkE2_xYpWnBtSzkcM/edit?usp=sharing)
- GCC output is visualized [here](https://docs.google.com/spreadsheets/d/1pCscCgFTgC84gTdIKU0ZvqlEkkXuMIhiTJF_OH17SO8/edit?usp=sharing)
