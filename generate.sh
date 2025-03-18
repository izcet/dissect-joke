#!/bin/bash

# a b aa ab ba bb aaa [...] bbbbbba bbbbbbb
BABBLE="$(\
  RANGE="" ; \
  for i in {1..7} ; do \
    RANGE="$RANGE"'{a..b}' ; \
    NESTED={,$RANGE}; \
    bash -c 'echo "echo '$NESTED'"' | bash ; \
  done)"

mkdir -p "out"

for I in $BABBLE ; do 
  DIR="out/$I"
  mkdir -p "$DIR"
  echo -e "#include <stdio.h>\n\nint main () {\n  int x = 5;\n  printf(" > "$DIR/$I.c"
  echo "    \"$I\n\"," | sed 's/[ab]/%d /g' >> "$DIR/$I.c"
  echo "    $I" | sed 's/a/x++, /g' | sed 's/b/++x, /g' | sed 's/, $//' >> "$DIR/$I.c"
  echo -e "  );\n  return 0;\n}\n" >> "$DIR/$I.c"

  gcc "$DIR/$I.c" -o "$DIR/gcc-$I.bin" 2> /dev/null
  clang "$DIR/$I.c" -o "$DIR/clang-$I.bin" 2> /dev/null

  "./$DIR/gcc-$I.bin" > "$DIR/gcc-$I.out"
  "./$DIR/clang-$I.bin" > "$DIR/clang-$I.out"

  # aligning text the cheap way
  PADDING="         "  
  PADDED="$I$PADDING"
  PADDED="${PADDED:0:10}"

  echo "$PADDED" `cat "$DIR/gcc-$I.out"` >> gcc.out
  echo "$PADDED" `cat "$DIR/clang-$I.out"` >> clang.out

done
