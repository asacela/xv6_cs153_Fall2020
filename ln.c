#include "types.h"
#include "stat.h"
#include "user.h"

#define FAIL_STATUS 0
#define PASS_STATUS 1

int
main(int argc, char *argv[])
{
  if(argc != 3){
    printf(2, "Usage: ln old new\n");
    exit(FAIL_STATUS);
  }
  if(link(argv[1], argv[2]) < 0)
    printf(2, "link %s %s: failed\n", argv[1], argv[2]);
  exit(FAIL_STATUS);
}
