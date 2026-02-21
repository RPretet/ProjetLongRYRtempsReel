#include <stdlib.h>

void loadTask(void* mem) {
  for (int i = 0; i < 1000; i++) {
    asm("mov (%rsp), %r8");
    asm("mov (%rsp), %r8");
    asm("mov (%rsp), %r8");
    asm("mov (%rsp), %r8");
    asm("mov (%rsp), %r8");

    asm("mov (%rsp), %r8");
    asm("mov (%rsp), %r8");
    asm("mov (%rsp), %r8");
    asm("mov (%rsp), %r8");
    asm("mov (%rsp), %r8");
  }
}
