// Create a zombie process that
// must be reparented at exit.

#include "types.h"
#include "stat.h"
#include "user.h"

#define FAIL_STATUS 0
#define PASS_STATUS 1

int
main(void)
{
  if(fork() > 0)
    sleep(5);  // Let child exit before parent.
  exit(PASS_STATUS);
}
