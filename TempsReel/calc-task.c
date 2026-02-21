#include <stdlib.h>

void calcTask() {
  for (int i = 0; i < 1000; i++) {
    asm("add %r8, %r9");
    asm("add %r8, %r9");
    asm("add %r8, %r9");
    asm("add %r8, %r9");
    asm("add %r8, %r9");

    asm("add %r8, %r9");
    asm("add %r8, %r9");
    asm("add %r8, %r9");
    asm("add %r8, %r9");
    asm("add %r8, %r9");
  }
}
