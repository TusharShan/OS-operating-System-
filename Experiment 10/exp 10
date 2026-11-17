#include <stdio.h>
#include <unistd.h>

int main() {
    int var = 42;
    printf("PID: %d | Address: %p\n", getpid(), (void*)&var);
    fflush(stdout);
    
    while (1) {
        sleep(1);
    }
    return 0;
}
