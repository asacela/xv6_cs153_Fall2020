
#include "types.h"
#include "user.h"
#include "stat.h"

int main(void) {

    int pid0, wpid0;
    int status0;

    printf(1, "starting the test...");
    if ((pid0 = fork()) < 0) {

        printf(1,"the fork has failed\n");
        exit(1);
    }
    else if (pid0 == 0) {
        printf(1,"the child process started\n");
        printf(1,"exit status: %d\n", 0);
        exit(0); // setting child exit status0 as 0
    }
    else {
    	
        wpid0 = waitpid(pid0, &status0, 0);
        printf(1,"child pid: %d\n", pid0);
        if (wpid0 == -1) {
            printf(1,"wait failed. exiting...\n");
            exit(1);
        }
    }
    printf(1, "waitpid test successful. exit status: %d...", status0); // checking exit status 
    exit(0);
}