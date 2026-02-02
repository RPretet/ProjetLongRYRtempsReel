#include <stdio.h>
#include "NopLoop.h"
#include "LoadLoop.h"
#include "CalcLoop.h"
#include <time.h>

int main(int argc, char *argv[]) {
    int nbLoop = argv[1];
    int typeLoop = argv[2];
    if (typeLoop == 0) {
        float startTime = time.time;
        for (int i = 0 ; i < nbLoop ; i++) {NopLoop();}
        printf("NopLoop time = %f\n", startTime - time.time);

    } else if (typeLoop == 1) {
        int startTime = time.time;
        for (int i = 0 ; i < nbLoop ; i++) {LoadLoop();}
        printf("LoadLoop time = %f\n", startTime - time.time);

    } else if (typeLoop == 2) {
        int startTime = time.time;
        for (int i = 0 ; i < nbLoop ; i++) {CalcLoop();}
        printf("CalcLoop time = %f\n", startTime - time.time);

    } else {return 1;}
    return 0;
}
