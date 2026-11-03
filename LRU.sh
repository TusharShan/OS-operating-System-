GNU nano 8.7.1                                                                                                    LPU.c                                                                                                             

#include <stdio.h>

int main() {
    int p[] = {1,2,3,1,4,5,2,1,2,3};
    int f[3] = {-1,-1,-1}, last[3] = {0};
    int i, j, pos, found, time = 0, faults = 0;

    for (i = 0; i < 10; i++) {
        time++;
        found = 0;

        for (j = 0; j < 3; j++)
            if (f[j] == p[i]) {
                found = 1;
                last[j] = time;
                break;
            }

        if (!found) {
            faults++;
            pos = -1;

            for (j = 0; j < 3; j++)
                if (f[j] == -1) {
                    pos = j;
                    break;
                }

            if (pos == -1) {
                pos = 0;
                for (j = 1; j < 3; j++)
                    if (last[j] < last[pos])
                        pos = j;
            }

            f[pos] = p[i];
            last[pos] = time;
        }

        printf("%d: ", p[i]);
        for (j = 0; j < 3; j++)
        
