#define _GNU_SOURCE
#include <stdio.h>
#include <stdlib.h>
#include "tasks.h"
#include <time.h>
#include <string.h>
#include <linux/futex.h>
#include <sys/syscall.h>
#include <sched.h>
#include <sys/mman.h>
#include <unistd.h>
#include <signal.h>
#include <errno.h>

typedef void (*asm_fun)(void*);

int nbLoop = 0;
    volatile int* spinlock;

static int run_tests(void* function){
    struct timespec ts;
    void* mem = mmap(NULL, 1, PROT_WRITE | PROT_READ, MAP_ANONYMOUS, -1, 0);
    unsigned long int times[nbLoop];

    while (*spinlock != 1) {
    }

    for (int i = 0; i < nbLoop; i++) {
        ((asm_fun) function)((void*) mem);
        timespec_get(&ts, TIME_UTC);
        times[i] = ts.tv_nsec;
    }
    sleep(1); // so every thread has time to end

    char* filename = malloc(64);
    if (!sprintf(filename, "./result/%d.csv", getpid()))
        perror("sprint");

    printf("%s\n", filename);
    FILE *fd = fopen(filename, "w");
    if (!fd)
        perror("fopen error");

    if (fprintf(fd,"measure,time\n" ) == -1)
        perror("fprintf");

    for (int i = 0; i < nbLoop; i++) {
        fprintf(fd,"%d,%ld\n", i, times[i] - times[0]);
        // printf("%d , %d , %ld\n", getpid() , i, times[i] - times[0]);
    }
    fclose(fd);

    return 0;
}

int main(int argc, char *argv[]) {
    if (argc != 4) {
        fprintf(stderr, "usage : %s <LoopCount> <TaskType>\n", argv[0]);
    }
    nbLoop = atoi(argv[1]);
    char* taskType = argv[2];
    int taskCount = atoi(argv[3]);

    spinlock = mmap(NULL, sizeof(int), PROT_WRITE | PROT_READ, MAP_SHARED | MAP_ANONYMOUS, -1, 0);
    *spinlock = 0;

    int* mem = malloc(1);

    asm_fun function;
    if (strcmp(taskType, "nop") == 0) {
        function = nopTask;
    } else if (strcmp(taskType, "load") == 0) {
     function = loadTask;
    } else if (strcmp(taskType, "calc") == 0) {
        function = calcTask;
    } else {
        fprintf(stderr, "task type %s doesn't exist\n", taskType);
        return 1;
    }
    for (int i = 0; i < taskCount; i++) {
        void* stack = malloc(1024 );
        int i = clone(run_tests,stack + 1024 ,SIGCHLD ,(void*)function);


    }
    *spinlock = 1;
    sleep(10);
    return 0;
}
