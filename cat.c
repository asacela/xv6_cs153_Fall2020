#include "types.h"
#include "stat.h"
#include "user.h"

#define FAIL_STATUS 0
#define PASS_STATUS 1

char buf[512];

void
cat(int fd)
{
  int n;

  while((n = read(fd, buf, sizeof(buf))) > 0) {
    if (write(1, buf, n) != n) {
      printf(1, "cat: write error\n");
      exit(FAIL_STATUS);
    }
  }
  if(n < 0){
    printf(1, "cat: read error\n");
    exit(FAIL_STATUS);
  }
}

int
main(int argc, char *argv[])
{
  int fd, i;

  if(argc <= 1){
    cat(0);
    exit(PASS_STATUS);
  }

  for(i = 1; i < argc; i++){
    if((fd = open(argv[i], 0)) < 0){
      printf(1, "cat: cannot open %s\n", argv[i]);
      exit(FAIL_STATUS);
    }
    cat(fd);
    close(fd);
  }
  exit(PASS_STATUS);
}
