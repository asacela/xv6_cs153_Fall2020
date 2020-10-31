#include "types.h"
#include "stat.h"
#include "user.h"

#define FAIL_STATUS 0
#define PASS_STATUS 1

int
main(int argc, char *argv[])
{
  int i;

  if(argc < 2){
    printf(2, "Usage: mkdir files...\n");
    exit(FAIL_STATUS);
  }

  for(i = 1; i < argc; i++){
    if(mkdir(argv[i]) < 0){
      printf(2, "mkdir: %s failed to create\n", argv[i]);
      break;
    }
  }

  exit(PASS_STATUS);
}
