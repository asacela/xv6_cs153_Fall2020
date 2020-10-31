#include "types.h"
#include "stat.h"
#include "user.h"

#define FAIL_STATUS 0
#define PASS_STATUS 1

int
main(int argc, char **argv)
{
  int i;

  if(argc < 2){
    printf(2, "usage: kill pid...\n");
    exit(FAIL_STATUS);
  }
  for(i=1; i<argc; i++)
    kill(atoi(argv[i]));
  exit(PASS_STATUS);
}
