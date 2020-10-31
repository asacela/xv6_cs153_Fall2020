#include "types.h" 
#include "user.h" 
#include "stat.h"

int main(void) 
{ 
	int pid0;
	int status0;
	if ((pid0 = fork()) < 0) { 
		printf(1,"fork has failed...\n");
		exit(1);
	}
	else if (pid0 == 0) {
		printf(1,"the child process has begun...\n");
		exit(1); }
	else {
		while (wait(&status0) != pid0); 
	}
	printf(1, "successful wait test. exiting..."); 
	exit(0);
}