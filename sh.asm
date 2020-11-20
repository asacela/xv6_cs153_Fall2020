
_sh:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
  return 0;
}

int
main(void)
{
       0:	8d 4c 24 04          	lea    0x4(%esp),%ecx
       4:	83 e4 f0             	and    $0xfffffff0,%esp
       7:	ff 71 fc             	pushl  -0x4(%ecx)
       a:	55                   	push   %ebp
       b:	89 e5                	mov    %esp,%ebp
       d:	53                   	push   %ebx
       e:	51                   	push   %ecx
       f:	83 ec 10             	sub    $0x10,%esp
  static char buf[100];
  int fd;
  int status;

  // Ensure that three file descriptors are open.
  while((fd = open("console", O_RDWR)) >= 0){
      12:	eb 0d                	jmp    21 <main+0x21>
      14:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    if(fd >= 3){
      18:	83 f8 02             	cmp    $0x2,%eax
      1b:	0f 8f b0 00 00 00    	jg     d1 <main+0xd1>
  static char buf[100];
  int fd;
  int status;

  // Ensure that three file descriptors are open.
  while((fd = open("console", O_RDWR)) >= 0){
      21:	83 ec 08             	sub    $0x8,%esp
      24:	6a 02                	push   $0x2
      26:	68 71 12 00 00       	push   $0x1271
      2b:	e8 62 0d 00 00       	call   d92 <open>
      30:	83 c4 10             	add    $0x10,%esp
      33:	85 c0                	test   %eax,%eax
      35:	79 e1                	jns    18 <main+0x18>
        printf(2, "cannot cd %s\n", buf+3);
      continue;
    }
    if(fork1() == 0)
      runcmd(parsecmd(buf));
    wait(&status);
      37:	8d 5d f4             	lea    -0xc(%ebp),%ebx
      3a:	eb 26                	jmp    62 <main+0x62>
      3c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
int
fork1(void)
{
  int pid;

  pid = fork();
      40:	e8 05 0d 00 00       	call   d4a <fork>
  if(pid == -1)
      45:	83 f8 ff             	cmp    $0xffffffff,%eax
      48:	0f 84 9e 00 00 00    	je     ec <main+0xec>
      buf[strlen(buf)-1] = 0;  // chop \n
      if(chdir(buf+3) < 0)
        printf(2, "cannot cd %s\n", buf+3);
      continue;
    }
    if(fork1() == 0)
      4e:	85 c0                	test   %eax,%eax
      50:	0f 84 a3 00 00 00    	je     f9 <main+0xf9>
      runcmd(parsecmd(buf));
    wait(&status);
      56:	83 ec 0c             	sub    $0xc,%esp
      59:	53                   	push   %ebx
      5a:	e8 fb 0c 00 00       	call   d5a <wait>
      5f:	83 c4 10             	add    $0x10,%esp
      break;
    }
  }

  // Read and run input commands.
  while(getcmd(buf, sizeof(buf)) >= 0){
      62:	83 ec 08             	sub    $0x8,%esp
      65:	6a 64                	push   $0x64
      67:	68 a0 18 00 00       	push   $0x18a0
      6c:	e8 9f 00 00 00       	call   110 <getcmd>
      71:	83 c4 10             	add    $0x10,%esp
      74:	85 c0                	test   %eax,%eax
      76:	78 6a                	js     e2 <main+0xe2>
    if(buf[0] == 'c' && buf[1] == 'd' && buf[2] == ' '){
      78:	80 3d a0 18 00 00 63 	cmpb   $0x63,0x18a0
      7f:	75 bf                	jne    40 <main+0x40>
      81:	80 3d a1 18 00 00 64 	cmpb   $0x64,0x18a1
      88:	75 b6                	jne    40 <main+0x40>
      8a:	80 3d a2 18 00 00 20 	cmpb   $0x20,0x18a2
      91:	75 ad                	jne    40 <main+0x40>
      // Chdir must be called by the parent, not the child.
      buf[strlen(buf)-1] = 0;  // chop \n
      93:	83 ec 0c             	sub    $0xc,%esp
      96:	68 a0 18 00 00       	push   $0x18a0
      9b:	e8 f0 0a 00 00       	call   b90 <strlen>
      if(chdir(buf+3) < 0)
      a0:	c7 04 24 a3 18 00 00 	movl   $0x18a3,(%esp)

  // Read and run input commands.
  while(getcmd(buf, sizeof(buf)) >= 0){
    if(buf[0] == 'c' && buf[1] == 'd' && buf[2] == ' '){
      // Chdir must be called by the parent, not the child.
      buf[strlen(buf)-1] = 0;  // chop \n
      a7:	c6 80 9f 18 00 00 00 	movb   $0x0,0x189f(%eax)
      if(chdir(buf+3) < 0)
      ae:	e8 0f 0d 00 00       	call   dc2 <chdir>
      b3:	83 c4 10             	add    $0x10,%esp
      b6:	85 c0                	test   %eax,%eax
      b8:	79 a8                	jns    62 <main+0x62>
        printf(2, "cannot cd %s\n", buf+3);
      ba:	50                   	push   %eax
      bb:	68 a3 18 00 00       	push   $0x18a3
      c0:	68 79 12 00 00       	push   $0x1279
      c5:	6a 02                	push   $0x2
      c7:	e8 e4 0d 00 00       	call   eb0 <printf>
      cc:	83 c4 10             	add    $0x10,%esp
      cf:	eb 91                	jmp    62 <main+0x62>
  int status;

  // Ensure that three file descriptors are open.
  while((fd = open("console", O_RDWR)) >= 0){
    if(fd >= 3){
      close(fd);
      d1:	83 ec 0c             	sub    $0xc,%esp
      d4:	50                   	push   %eax
      d5:	e8 a0 0c 00 00       	call   d7a <close>
      break;
      da:	83 c4 10             	add    $0x10,%esp
      dd:	e9 55 ff ff ff       	jmp    37 <main+0x37>
    }
    if(fork1() == 0)
      runcmd(parsecmd(buf));
    wait(&status);
  }
  exit(PASS_STATUS);
      e2:	83 ec 0c             	sub    $0xc,%esp
      e5:	6a 01                	push   $0x1
      e7:	e8 66 0c 00 00       	call   d52 <exit>
{
  int pid;

  pid = fork();
  if(pid == -1)
    panic("fork");
      ec:	83 ec 0c             	sub    $0xc,%esp
      ef:	68 fa 11 00 00       	push   $0x11fa
      f4:	e8 67 00 00 00       	call   160 <panic>
      if(chdir(buf+3) < 0)
        printf(2, "cannot cd %s\n", buf+3);
      continue;
    }
    if(fork1() == 0)
      runcmd(parsecmd(buf));
      f9:	83 ec 0c             	sub    $0xc,%esp
      fc:	68 a0 18 00 00       	push   $0x18a0
     101:	e8 9a 09 00 00       	call   aa0 <parsecmd>
     106:	89 04 24             	mov    %eax,(%esp)
     109:	e8 82 00 00 00       	call   190 <runcmd>
     10e:	66 90                	xchg   %ax,%ax

00000110 <getcmd>:
  exit(PASS_STATUS);
}

int
getcmd(char *buf, int nbuf)
{
     110:	55                   	push   %ebp
     111:	89 e5                	mov    %esp,%ebp
     113:	56                   	push   %esi
     114:	53                   	push   %ebx
     115:	8b 75 0c             	mov    0xc(%ebp),%esi
     118:	8b 5d 08             	mov    0x8(%ebp),%ebx
  printf(2, "$ ");
     11b:	83 ec 08             	sub    $0x8,%esp
     11e:	68 d0 11 00 00       	push   $0x11d0
     123:	6a 02                	push   $0x2
     125:	e8 86 0d 00 00       	call   eb0 <printf>
  memset(buf, 0, nbuf);
     12a:	83 c4 0c             	add    $0xc,%esp
     12d:	56                   	push   %esi
     12e:	6a 00                	push   $0x0
     130:	53                   	push   %ebx
     131:	e8 8a 0a 00 00       	call   bc0 <memset>
  gets(buf, nbuf);
     136:	58                   	pop    %eax
     137:	5a                   	pop    %edx
     138:	56                   	push   %esi
     139:	53                   	push   %ebx
     13a:	e8 e1 0a 00 00       	call   c20 <gets>
     13f:	83 c4 10             	add    $0x10,%esp
     142:	31 c0                	xor    %eax,%eax
     144:	80 3b 00             	cmpb   $0x0,(%ebx)
     147:	0f 94 c0             	sete   %al
  if(buf[0] == 0) // EOF
    return -1;
  return 0;
}
     14a:	8d 65 f8             	lea    -0x8(%ebp),%esp
     14d:	f7 d8                	neg    %eax
     14f:	5b                   	pop    %ebx
     150:	5e                   	pop    %esi
     151:	5d                   	pop    %ebp
     152:	c3                   	ret    
     153:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
     159:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000160 <panic>:
  exit(PASS_STATUS);
}

void
panic(char *s)
{
     160:	55                   	push   %ebp
     161:	89 e5                	mov    %esp,%ebp
     163:	83 ec 0c             	sub    $0xc,%esp
  printf(2, "%s\n", s);
     166:	ff 75 08             	pushl  0x8(%ebp)
     169:	68 6d 12 00 00       	push   $0x126d
     16e:	6a 02                	push   $0x2
     170:	e8 3b 0d 00 00       	call   eb0 <printf>
  exit(PASS_STATUS);
     175:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
     17c:	e8 d1 0b 00 00       	call   d52 <exit>
     181:	eb 0d                	jmp    190 <runcmd>
     183:	90                   	nop
     184:	90                   	nop
     185:	90                   	nop
     186:	90                   	nop
     187:	90                   	nop
     188:	90                   	nop
     189:	90                   	nop
     18a:	90                   	nop
     18b:	90                   	nop
     18c:	90                   	nop
     18d:	90                   	nop
     18e:	90                   	nop
     18f:	90                   	nop

00000190 <runcmd>:
struct cmd *parsecmd(char*);

// Execute cmd.  Never returns.
void
runcmd(struct cmd *cmd)
{
     190:	55                   	push   %ebp
     191:	89 e5                	mov    %esp,%ebp
     193:	53                   	push   %ebx
     194:	83 ec 14             	sub    $0x14,%esp
     197:	8b 5d 08             	mov    0x8(%ebp),%ebx
  struct listcmd *lcmd;
  struct pipecmd *pcmd;
  struct redircmd *rcmd;
  int status;

  if(cmd == 0)
     19a:	85 db                	test   %ebx,%ebx
     19c:	74 7f                	je     21d <runcmd+0x8d>
    exit(PASS_STATUS);

  switch(cmd->type){
     19e:	83 3b 05             	cmpl   $0x5,(%ebx)
     1a1:	0f 87 0b 01 00 00    	ja     2b2 <runcmd+0x122>
     1a7:	8b 03                	mov    (%ebx),%eax
     1a9:	ff 24 85 88 12 00 00 	jmp    *0x1288(,%eax,4)
    runcmd(lcmd->right);
    break;

  case PIPE:
    pcmd = (struct pipecmd*)cmd;
    if(pipe(p) < 0)
     1b0:	8d 45 f0             	lea    -0x10(%ebp),%eax
     1b3:	83 ec 0c             	sub    $0xc,%esp
     1b6:	50                   	push   %eax
     1b7:	e8 a6 0b 00 00       	call   d62 <pipe>
     1bc:	83 c4 10             	add    $0x10,%esp
     1bf:	85 c0                	test   %eax,%eax
     1c1:	0f 88 21 01 00 00    	js     2e8 <runcmd+0x158>
int
fork1(void)
{
  int pid;

  pid = fork();
     1c7:	e8 7e 0b 00 00       	call   d4a <fork>
  if(pid == -1)
     1cc:	83 f8 ff             	cmp    $0xffffffff,%eax
     1cf:	0f 84 ea 00 00 00    	je     2bf <runcmd+0x12f>

  case PIPE:
    pcmd = (struct pipecmd*)cmd;
    if(pipe(p) < 0)
      panic("pipe");
    if(fork1() == 0){
     1d5:	85 c0                	test   %eax,%eax
     1d7:	0f 84 18 01 00 00    	je     2f5 <runcmd+0x165>
int
fork1(void)
{
  int pid;

  pid = fork();
     1dd:	e8 68 0b 00 00       	call   d4a <fork>
  if(pid == -1)
     1e2:	83 f8 ff             	cmp    $0xffffffff,%eax
     1e5:	0f 84 d4 00 00 00    	je     2bf <runcmd+0x12f>
      dup(p[1]);
      close(p[0]);
      close(p[1]);
      runcmd(pcmd->left);
    }
    if(fork1() == 0){
     1eb:	85 c0                	test   %eax,%eax
     1ed:	0f 84 30 01 00 00    	je     323 <runcmd+0x193>
      dup(p[0]);
      close(p[0]);
      close(p[1]);
      runcmd(pcmd->right);
    }
    close(p[0]);
     1f3:	83 ec 0c             	sub    $0xc,%esp
     1f6:	ff 75 f0             	pushl  -0x10(%ebp)
    close(p[1]);
    wait(&status);
     1f9:	8d 5d ec             	lea    -0x14(%ebp),%ebx
      dup(p[0]);
      close(p[0]);
      close(p[1]);
      runcmd(pcmd->right);
    }
    close(p[0]);
     1fc:	e8 79 0b 00 00       	call   d7a <close>
    close(p[1]);
     201:	58                   	pop    %eax
     202:	ff 75 f4             	pushl  -0xc(%ebp)
     205:	e8 70 0b 00 00       	call   d7a <close>
    wait(&status);
     20a:	89 1c 24             	mov    %ebx,(%esp)
     20d:	e8 48 0b 00 00       	call   d5a <wait>
    wait(&status);
     212:	89 1c 24             	mov    %ebx,(%esp)
     215:	e8 40 0b 00 00       	call   d5a <wait>
    break;
     21a:	83 c4 10             	add    $0x10,%esp
  struct pipecmd *pcmd;
  struct redircmd *rcmd;
  int status;

  if(cmd == 0)
    exit(PASS_STATUS);
     21d:	83 ec 0c             	sub    $0xc,%esp
     220:	6a 01                	push   $0x1
     222:	e8 2b 0b 00 00       	call   d52 <exit>
int
fork1(void)
{
  int pid;

  pid = fork();
     227:	e8 1e 0b 00 00       	call   d4a <fork>
  if(pid == -1)
     22c:	83 f8 ff             	cmp    $0xffffffff,%eax
     22f:	0f 84 8a 00 00 00    	je     2bf <runcmd+0x12f>
    wait(&status);
    break;

  case BACK:
    bcmd = (struct backcmd*)cmd;
    if(fork1() == 0)
     235:	85 c0                	test   %eax,%eax
     237:	75 e4                	jne    21d <runcmd+0x8d>
     239:	eb 49                	jmp    284 <runcmd+0xf4>
  default:
    panic("runcmd");

  case EXEC:
    ecmd = (struct execcmd*)cmd;
    if(ecmd->argv[0] == 0)
     23b:	8b 43 04             	mov    0x4(%ebx),%eax
     23e:	85 c0                	test   %eax,%eax
     240:	74 db                	je     21d <runcmd+0x8d>
      exit(PASS_STATUS);
    exec(ecmd->argv[0], ecmd->argv);
     242:	8d 53 04             	lea    0x4(%ebx),%edx
     245:	51                   	push   %ecx
     246:	51                   	push   %ecx
     247:	52                   	push   %edx
     248:	50                   	push   %eax
     249:	e8 3c 0b 00 00       	call   d8a <exec>
    printf(2, "exec %s failed\n", ecmd->argv[0]);
     24e:	83 c4 0c             	add    $0xc,%esp
     251:	ff 73 04             	pushl  0x4(%ebx)
     254:	68 da 11 00 00       	push   $0x11da
     259:	6a 02                	push   $0x2
     25b:	e8 50 0c 00 00       	call   eb0 <printf>
    break;
     260:	83 c4 10             	add    $0x10,%esp
     263:	eb b8                	jmp    21d <runcmd+0x8d>

  case REDIR:
    rcmd = (struct redircmd*)cmd;
    close(rcmd->fd);
     265:	83 ec 0c             	sub    $0xc,%esp
     268:	ff 73 14             	pushl  0x14(%ebx)
     26b:	e8 0a 0b 00 00       	call   d7a <close>
    if(open(rcmd->file, rcmd->mode) < 0){
     270:	58                   	pop    %eax
     271:	5a                   	pop    %edx
     272:	ff 73 10             	pushl  0x10(%ebx)
     275:	ff 73 08             	pushl  0x8(%ebx)
     278:	e8 15 0b 00 00       	call   d92 <open>
     27d:	83 c4 10             	add    $0x10,%esp
     280:	85 c0                	test   %eax,%eax
     282:	78 48                	js     2cc <runcmd+0x13c>
    break;

  case BACK:
    bcmd = (struct backcmd*)cmd;
    if(fork1() == 0)
      runcmd(bcmd->cmd);
     284:	83 ec 0c             	sub    $0xc,%esp
     287:	ff 73 04             	pushl  0x4(%ebx)
     28a:	e8 01 ff ff ff       	call   190 <runcmd>
int
fork1(void)
{
  int pid;

  pid = fork();
     28f:	e8 b6 0a 00 00       	call   d4a <fork>
  if(pid == -1)
     294:	83 f8 ff             	cmp    $0xffffffff,%eax
     297:	74 26                	je     2bf <runcmd+0x12f>
    runcmd(rcmd->cmd);
    break;

  case LIST:
    lcmd = (struct listcmd*)cmd;
    if(fork1() == 0)
     299:	85 c0                	test   %eax,%eax
     29b:	74 e7                	je     284 <runcmd+0xf4>
      runcmd(lcmd->left);
    wait(&status);
     29d:	8d 45 ec             	lea    -0x14(%ebp),%eax
     2a0:	83 ec 0c             	sub    $0xc,%esp
     2a3:	50                   	push   %eax
     2a4:	e8 b1 0a 00 00       	call   d5a <wait>
    runcmd(lcmd->right);
     2a9:	5a                   	pop    %edx
     2aa:	ff 73 08             	pushl  0x8(%ebx)
     2ad:	e8 de fe ff ff       	call   190 <runcmd>
  if(cmd == 0)
    exit(PASS_STATUS);

  switch(cmd->type){
  default:
    panic("runcmd");
     2b2:	83 ec 0c             	sub    $0xc,%esp
     2b5:	68 d3 11 00 00       	push   $0x11d3
     2ba:	e8 a1 fe ff ff       	call   160 <panic>
{
  int pid;

  pid = fork();
  if(pid == -1)
    panic("fork");
     2bf:	83 ec 0c             	sub    $0xc,%esp
     2c2:	68 fa 11 00 00       	push   $0x11fa
     2c7:	e8 94 fe ff ff       	call   160 <panic>

  case REDIR:
    rcmd = (struct redircmd*)cmd;
    close(rcmd->fd);
    if(open(rcmd->file, rcmd->mode) < 0){
      printf(2, "open %s failed\n", rcmd->file);
     2cc:	51                   	push   %ecx
     2cd:	ff 73 08             	pushl  0x8(%ebx)
     2d0:	68 ea 11 00 00       	push   $0x11ea
     2d5:	6a 02                	push   $0x2
     2d7:	e8 d4 0b 00 00       	call   eb0 <printf>
      exit(FAIL_STATUS);
     2dc:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
     2e3:	e8 6a 0a 00 00       	call   d52 <exit>
    break;

  case PIPE:
    pcmd = (struct pipecmd*)cmd;
    if(pipe(p) < 0)
      panic("pipe");
     2e8:	83 ec 0c             	sub    $0xc,%esp
     2eb:	68 ff 11 00 00       	push   $0x11ff
     2f0:	e8 6b fe ff ff       	call   160 <panic>
    if(fork1() == 0){
      close(1);
     2f5:	83 ec 0c             	sub    $0xc,%esp
     2f8:	6a 01                	push   $0x1
     2fa:	e8 7b 0a 00 00       	call   d7a <close>
      dup(p[1]);
     2ff:	58                   	pop    %eax
     300:	ff 75 f4             	pushl  -0xc(%ebp)
     303:	e8 c2 0a 00 00       	call   dca <dup>
      close(p[0]);
     308:	58                   	pop    %eax
     309:	ff 75 f0             	pushl  -0x10(%ebp)
     30c:	e8 69 0a 00 00       	call   d7a <close>
      close(p[1]);
     311:	58                   	pop    %eax
     312:	ff 75 f4             	pushl  -0xc(%ebp)
     315:	e8 60 0a 00 00       	call   d7a <close>
      runcmd(pcmd->left);
     31a:	58                   	pop    %eax
     31b:	ff 73 04             	pushl  0x4(%ebx)
     31e:	e8 6d fe ff ff       	call   190 <runcmd>
    }
    if(fork1() == 0){
      close(0);
     323:	83 ec 0c             	sub    $0xc,%esp
     326:	6a 00                	push   $0x0
     328:	e8 4d 0a 00 00       	call   d7a <close>
      dup(p[0]);
     32d:	5a                   	pop    %edx
     32e:	ff 75 f0             	pushl  -0x10(%ebp)
     331:	e8 94 0a 00 00       	call   dca <dup>
      close(p[0]);
     336:	59                   	pop    %ecx
     337:	ff 75 f0             	pushl  -0x10(%ebp)
     33a:	e8 3b 0a 00 00       	call   d7a <close>
      close(p[1]);
     33f:	58                   	pop    %eax
     340:	ff 75 f4             	pushl  -0xc(%ebp)
     343:	e8 32 0a 00 00       	call   d7a <close>
      runcmd(pcmd->right);
     348:	58                   	pop    %eax
     349:	ff 73 08             	pushl  0x8(%ebx)
     34c:	e8 3f fe ff ff       	call   190 <runcmd>
     351:	eb 0d                	jmp    360 <fork1>
     353:	90                   	nop
     354:	90                   	nop
     355:	90                   	nop
     356:	90                   	nop
     357:	90                   	nop
     358:	90                   	nop
     359:	90                   	nop
     35a:	90                   	nop
     35b:	90                   	nop
     35c:	90                   	nop
     35d:	90                   	nop
     35e:	90                   	nop
     35f:	90                   	nop

00000360 <fork1>:
  exit(PASS_STATUS);
}

int
fork1(void)
{
     360:	55                   	push   %ebp
     361:	89 e5                	mov    %esp,%ebp
     363:	83 ec 08             	sub    $0x8,%esp
  int pid;

  pid = fork();
     366:	e8 df 09 00 00       	call   d4a <fork>
  if(pid == -1)
     36b:	83 f8 ff             	cmp    $0xffffffff,%eax
     36e:	74 02                	je     372 <fork1+0x12>
    panic("fork");
  return pid;
}
     370:	c9                   	leave  
     371:	c3                   	ret    
{
  int pid;

  pid = fork();
  if(pid == -1)
    panic("fork");
     372:	83 ec 0c             	sub    $0xc,%esp
     375:	68 fa 11 00 00       	push   $0x11fa
     37a:	e8 e1 fd ff ff       	call   160 <panic>
     37f:	90                   	nop

00000380 <execcmd>:
//PAGEBREAK!
// Constructors

struct cmd*
execcmd(void)
{
     380:	55                   	push   %ebp
     381:	89 e5                	mov    %esp,%ebp
     383:	53                   	push   %ebx
     384:	83 ec 10             	sub    $0x10,%esp
  struct execcmd *cmd;

  cmd = malloc(sizeof(*cmd));
     387:	6a 54                	push   $0x54
     389:	e8 52 0d 00 00       	call   10e0 <malloc>
  memset(cmd, 0, sizeof(*cmd));
     38e:	83 c4 0c             	add    $0xc,%esp
struct cmd*
execcmd(void)
{
  struct execcmd *cmd;

  cmd = malloc(sizeof(*cmd));
     391:	89 c3                	mov    %eax,%ebx
  memset(cmd, 0, sizeof(*cmd));
     393:	6a 54                	push   $0x54
     395:	6a 00                	push   $0x0
     397:	50                   	push   %eax
     398:	e8 23 08 00 00       	call   bc0 <memset>
  cmd->type = EXEC;
     39d:	c7 03 01 00 00 00    	movl   $0x1,(%ebx)
  return (struct cmd*)cmd;
}
     3a3:	89 d8                	mov    %ebx,%eax
     3a5:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     3a8:	c9                   	leave  
     3a9:	c3                   	ret    
     3aa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

000003b0 <redircmd>:

struct cmd*
redircmd(struct cmd *subcmd, char *file, char *efile, int mode, int fd)
{
     3b0:	55                   	push   %ebp
     3b1:	89 e5                	mov    %esp,%ebp
     3b3:	53                   	push   %ebx
     3b4:	83 ec 10             	sub    $0x10,%esp
  struct redircmd *cmd;

  cmd = malloc(sizeof(*cmd));
     3b7:	6a 18                	push   $0x18
     3b9:	e8 22 0d 00 00       	call   10e0 <malloc>
  memset(cmd, 0, sizeof(*cmd));
     3be:	83 c4 0c             	add    $0xc,%esp
struct cmd*
redircmd(struct cmd *subcmd, char *file, char *efile, int mode, int fd)
{
  struct redircmd *cmd;

  cmd = malloc(sizeof(*cmd));
     3c1:	89 c3                	mov    %eax,%ebx
  memset(cmd, 0, sizeof(*cmd));
     3c3:	6a 18                	push   $0x18
     3c5:	6a 00                	push   $0x0
     3c7:	50                   	push   %eax
     3c8:	e8 f3 07 00 00       	call   bc0 <memset>
  cmd->type = REDIR;
  cmd->cmd = subcmd;
     3cd:	8b 45 08             	mov    0x8(%ebp),%eax
{
  struct redircmd *cmd;

  cmd = malloc(sizeof(*cmd));
  memset(cmd, 0, sizeof(*cmd));
  cmd->type = REDIR;
     3d0:	c7 03 02 00 00 00    	movl   $0x2,(%ebx)
  cmd->cmd = subcmd;
     3d6:	89 43 04             	mov    %eax,0x4(%ebx)
  cmd->file = file;
     3d9:	8b 45 0c             	mov    0xc(%ebp),%eax
     3dc:	89 43 08             	mov    %eax,0x8(%ebx)
  cmd->efile = efile;
     3df:	8b 45 10             	mov    0x10(%ebp),%eax
     3e2:	89 43 0c             	mov    %eax,0xc(%ebx)
  cmd->mode = mode;
     3e5:	8b 45 14             	mov    0x14(%ebp),%eax
     3e8:	89 43 10             	mov    %eax,0x10(%ebx)
  cmd->fd = fd;
     3eb:	8b 45 18             	mov    0x18(%ebp),%eax
     3ee:	89 43 14             	mov    %eax,0x14(%ebx)
  return (struct cmd*)cmd;
}
     3f1:	89 d8                	mov    %ebx,%eax
     3f3:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     3f6:	c9                   	leave  
     3f7:	c3                   	ret    
     3f8:	90                   	nop
     3f9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000400 <pipecmd>:

struct cmd*
pipecmd(struct cmd *left, struct cmd *right)
{
     400:	55                   	push   %ebp
     401:	89 e5                	mov    %esp,%ebp
     403:	53                   	push   %ebx
     404:	83 ec 10             	sub    $0x10,%esp
  struct pipecmd *cmd;

  cmd = malloc(sizeof(*cmd));
     407:	6a 0c                	push   $0xc
     409:	e8 d2 0c 00 00       	call   10e0 <malloc>
  memset(cmd, 0, sizeof(*cmd));
     40e:	83 c4 0c             	add    $0xc,%esp
struct cmd*
pipecmd(struct cmd *left, struct cmd *right)
{
  struct pipecmd *cmd;

  cmd = malloc(sizeof(*cmd));
     411:	89 c3                	mov    %eax,%ebx
  memset(cmd, 0, sizeof(*cmd));
     413:	6a 0c                	push   $0xc
     415:	6a 00                	push   $0x0
     417:	50                   	push   %eax
     418:	e8 a3 07 00 00       	call   bc0 <memset>
  cmd->type = PIPE;
  cmd->left = left;
     41d:	8b 45 08             	mov    0x8(%ebp),%eax
{
  struct pipecmd *cmd;

  cmd = malloc(sizeof(*cmd));
  memset(cmd, 0, sizeof(*cmd));
  cmd->type = PIPE;
     420:	c7 03 03 00 00 00    	movl   $0x3,(%ebx)
  cmd->left = left;
     426:	89 43 04             	mov    %eax,0x4(%ebx)
  cmd->right = right;
     429:	8b 45 0c             	mov    0xc(%ebp),%eax
     42c:	89 43 08             	mov    %eax,0x8(%ebx)
  return (struct cmd*)cmd;
}
     42f:	89 d8                	mov    %ebx,%eax
     431:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     434:	c9                   	leave  
     435:	c3                   	ret    
     436:	8d 76 00             	lea    0x0(%esi),%esi
     439:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000440 <listcmd>:

struct cmd*
listcmd(struct cmd *left, struct cmd *right)
{
     440:	55                   	push   %ebp
     441:	89 e5                	mov    %esp,%ebp
     443:	53                   	push   %ebx
     444:	83 ec 10             	sub    $0x10,%esp
  struct listcmd *cmd;

  cmd = malloc(sizeof(*cmd));
     447:	6a 0c                	push   $0xc
     449:	e8 92 0c 00 00       	call   10e0 <malloc>
  memset(cmd, 0, sizeof(*cmd));
     44e:	83 c4 0c             	add    $0xc,%esp
struct cmd*
listcmd(struct cmd *left, struct cmd *right)
{
  struct listcmd *cmd;

  cmd = malloc(sizeof(*cmd));
     451:	89 c3                	mov    %eax,%ebx
  memset(cmd, 0, sizeof(*cmd));
     453:	6a 0c                	push   $0xc
     455:	6a 00                	push   $0x0
     457:	50                   	push   %eax
     458:	e8 63 07 00 00       	call   bc0 <memset>
  cmd->type = LIST;
  cmd->left = left;
     45d:	8b 45 08             	mov    0x8(%ebp),%eax
{
  struct listcmd *cmd;

  cmd = malloc(sizeof(*cmd));
  memset(cmd, 0, sizeof(*cmd));
  cmd->type = LIST;
     460:	c7 03 04 00 00 00    	movl   $0x4,(%ebx)
  cmd->left = left;
     466:	89 43 04             	mov    %eax,0x4(%ebx)
  cmd->right = right;
     469:	8b 45 0c             	mov    0xc(%ebp),%eax
     46c:	89 43 08             	mov    %eax,0x8(%ebx)
  return (struct cmd*)cmd;
}
     46f:	89 d8                	mov    %ebx,%eax
     471:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     474:	c9                   	leave  
     475:	c3                   	ret    
     476:	8d 76 00             	lea    0x0(%esi),%esi
     479:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000480 <backcmd>:

struct cmd*
backcmd(struct cmd *subcmd)
{
     480:	55                   	push   %ebp
     481:	89 e5                	mov    %esp,%ebp
     483:	53                   	push   %ebx
     484:	83 ec 10             	sub    $0x10,%esp
  struct backcmd *cmd;

  cmd = malloc(sizeof(*cmd));
     487:	6a 08                	push   $0x8
     489:	e8 52 0c 00 00       	call   10e0 <malloc>
  memset(cmd, 0, sizeof(*cmd));
     48e:	83 c4 0c             	add    $0xc,%esp
struct cmd*
backcmd(struct cmd *subcmd)
{
  struct backcmd *cmd;

  cmd = malloc(sizeof(*cmd));
     491:	89 c3                	mov    %eax,%ebx
  memset(cmd, 0, sizeof(*cmd));
     493:	6a 08                	push   $0x8
     495:	6a 00                	push   $0x0
     497:	50                   	push   %eax
     498:	e8 23 07 00 00       	call   bc0 <memset>
  cmd->type = BACK;
  cmd->cmd = subcmd;
     49d:	8b 45 08             	mov    0x8(%ebp),%eax
{
  struct backcmd *cmd;

  cmd = malloc(sizeof(*cmd));
  memset(cmd, 0, sizeof(*cmd));
  cmd->type = BACK;
     4a0:	c7 03 05 00 00 00    	movl   $0x5,(%ebx)
  cmd->cmd = subcmd;
     4a6:	89 43 04             	mov    %eax,0x4(%ebx)
  return (struct cmd*)cmd;
}
     4a9:	89 d8                	mov    %ebx,%eax
     4ab:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     4ae:	c9                   	leave  
     4af:	c3                   	ret    

000004b0 <gettoken>:
char whitespace[] = " \t\r\n\v";
char symbols[] = "<|>&;()";

int
gettoken(char **ps, char *es, char **q, char **eq)
{
     4b0:	55                   	push   %ebp
     4b1:	89 e5                	mov    %esp,%ebp
     4b3:	57                   	push   %edi
     4b4:	56                   	push   %esi
     4b5:	53                   	push   %ebx
     4b6:	83 ec 0c             	sub    $0xc,%esp
  char *s;
  int ret;

  s = *ps;
     4b9:	8b 45 08             	mov    0x8(%ebp),%eax
char whitespace[] = " \t\r\n\v";
char symbols[] = "<|>&;()";

int
gettoken(char **ps, char *es, char **q, char **eq)
{
     4bc:	8b 5d 0c             	mov    0xc(%ebp),%ebx
     4bf:	8b 75 10             	mov    0x10(%ebp),%esi
  char *s;
  int ret;

  s = *ps;
     4c2:	8b 38                	mov    (%eax),%edi
  while(s < es && strchr(whitespace, *s))
     4c4:	39 df                	cmp    %ebx,%edi
     4c6:	72 13                	jb     4db <gettoken+0x2b>
     4c8:	eb 29                	jmp    4f3 <gettoken+0x43>
     4ca:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    s++;
     4d0:	83 c7 01             	add    $0x1,%edi
{
  char *s;
  int ret;

  s = *ps;
  while(s < es && strchr(whitespace, *s))
     4d3:	39 fb                	cmp    %edi,%ebx
     4d5:	0f 84 ed 00 00 00    	je     5c8 <gettoken+0x118>
     4db:	0f be 07             	movsbl (%edi),%eax
     4de:	83 ec 08             	sub    $0x8,%esp
     4e1:	50                   	push   %eax
     4e2:	68 7c 18 00 00       	push   $0x187c
     4e7:	e8 f4 06 00 00       	call   be0 <strchr>
     4ec:	83 c4 10             	add    $0x10,%esp
     4ef:	85 c0                	test   %eax,%eax
     4f1:	75 dd                	jne    4d0 <gettoken+0x20>
    s++;
  if(q)
     4f3:	85 f6                	test   %esi,%esi
     4f5:	74 02                	je     4f9 <gettoken+0x49>
    *q = s;
     4f7:	89 3e                	mov    %edi,(%esi)
  ret = *s;
     4f9:	0f be 37             	movsbl (%edi),%esi
     4fc:	89 f1                	mov    %esi,%ecx
     4fe:	89 f0                	mov    %esi,%eax
  switch(*s){
     500:	80 f9 29             	cmp    $0x29,%cl
     503:	7f 5b                	jg     560 <gettoken+0xb0>
     505:	80 f9 28             	cmp    $0x28,%cl
     508:	7d 61                	jge    56b <gettoken+0xbb>
     50a:	84 c9                	test   %cl,%cl
     50c:	0f 85 de 00 00 00    	jne    5f0 <gettoken+0x140>
    ret = 'a';
    while(s < es && !strchr(whitespace, *s) && !strchr(symbols, *s))
      s++;
    break;
  }
  if(eq)
     512:	8b 55 14             	mov    0x14(%ebp),%edx
     515:	85 d2                	test   %edx,%edx
     517:	74 05                	je     51e <gettoken+0x6e>
    *eq = s;
     519:	8b 45 14             	mov    0x14(%ebp),%eax
     51c:	89 38                	mov    %edi,(%eax)

  while(s < es && strchr(whitespace, *s))
     51e:	39 fb                	cmp    %edi,%ebx
     520:	77 0d                	ja     52f <gettoken+0x7f>
     522:	eb 23                	jmp    547 <gettoken+0x97>
     524:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    s++;
     528:	83 c7 01             	add    $0x1,%edi
    break;
  }
  if(eq)
    *eq = s;

  while(s < es && strchr(whitespace, *s))
     52b:	39 fb                	cmp    %edi,%ebx
     52d:	74 18                	je     547 <gettoken+0x97>
     52f:	0f be 07             	movsbl (%edi),%eax
     532:	83 ec 08             	sub    $0x8,%esp
     535:	50                   	push   %eax
     536:	68 7c 18 00 00       	push   $0x187c
     53b:	e8 a0 06 00 00       	call   be0 <strchr>
     540:	83 c4 10             	add    $0x10,%esp
     543:	85 c0                	test   %eax,%eax
     545:	75 e1                	jne    528 <gettoken+0x78>
    s++;
  *ps = s;
     547:	8b 45 08             	mov    0x8(%ebp),%eax
     54a:	89 38                	mov    %edi,(%eax)
  return ret;
}
     54c:	8d 65 f4             	lea    -0xc(%ebp),%esp
     54f:	89 f0                	mov    %esi,%eax
     551:	5b                   	pop    %ebx
     552:	5e                   	pop    %esi
     553:	5f                   	pop    %edi
     554:	5d                   	pop    %ebp
     555:	c3                   	ret    
     556:	8d 76 00             	lea    0x0(%esi),%esi
     559:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
  while(s < es && strchr(whitespace, *s))
    s++;
  if(q)
    *q = s;
  ret = *s;
  switch(*s){
     560:	80 f9 3e             	cmp    $0x3e,%cl
     563:	75 0b                	jne    570 <gettoken+0xc0>
  case '<':
    s++;
    break;
  case '>':
    s++;
    if(*s == '>'){
     565:	80 7f 01 3e          	cmpb   $0x3e,0x1(%edi)
     569:	74 75                	je     5e0 <gettoken+0x130>
  case '&':
  case '<':
    s++;
    break;
  case '>':
    s++;
     56b:	83 c7 01             	add    $0x1,%edi
     56e:	eb a2                	jmp    512 <gettoken+0x62>
  while(s < es && strchr(whitespace, *s))
    s++;
  if(q)
    *q = s;
  ret = *s;
  switch(*s){
     570:	7f 5e                	jg     5d0 <gettoken+0x120>
     572:	83 e9 3b             	sub    $0x3b,%ecx
     575:	80 f9 01             	cmp    $0x1,%cl
     578:	76 f1                	jbe    56b <gettoken+0xbb>
      s++;
    }
    break;
  default:
    ret = 'a';
    while(s < es && !strchr(whitespace, *s) && !strchr(symbols, *s))
     57a:	39 fb                	cmp    %edi,%ebx
     57c:	77 24                	ja     5a2 <gettoken+0xf2>
     57e:	eb 7c                	jmp    5fc <gettoken+0x14c>
     580:	0f be 07             	movsbl (%edi),%eax
     583:	83 ec 08             	sub    $0x8,%esp
     586:	50                   	push   %eax
     587:	68 74 18 00 00       	push   $0x1874
     58c:	e8 4f 06 00 00       	call   be0 <strchr>
     591:	83 c4 10             	add    $0x10,%esp
     594:	85 c0                	test   %eax,%eax
     596:	75 1f                	jne    5b7 <gettoken+0x107>
      s++;
     598:	83 c7 01             	add    $0x1,%edi
      s++;
    }
    break;
  default:
    ret = 'a';
    while(s < es && !strchr(whitespace, *s) && !strchr(symbols, *s))
     59b:	39 fb                	cmp    %edi,%ebx
     59d:	74 5b                	je     5fa <gettoken+0x14a>
     59f:	0f be 07             	movsbl (%edi),%eax
     5a2:	83 ec 08             	sub    $0x8,%esp
     5a5:	50                   	push   %eax
     5a6:	68 7c 18 00 00       	push   $0x187c
     5ab:	e8 30 06 00 00       	call   be0 <strchr>
     5b0:	83 c4 10             	add    $0x10,%esp
     5b3:	85 c0                	test   %eax,%eax
     5b5:	74 c9                	je     580 <gettoken+0xd0>
      ret = '+';
      s++;
    }
    break;
  default:
    ret = 'a';
     5b7:	be 61 00 00 00       	mov    $0x61,%esi
     5bc:	e9 51 ff ff ff       	jmp    512 <gettoken+0x62>
     5c1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     5c8:	89 df                	mov    %ebx,%edi
     5ca:	e9 24 ff ff ff       	jmp    4f3 <gettoken+0x43>
     5cf:	90                   	nop
  while(s < es && strchr(whitespace, *s))
    s++;
  if(q)
    *q = s;
  ret = *s;
  switch(*s){
     5d0:	80 f9 7c             	cmp    $0x7c,%cl
     5d3:	74 96                	je     56b <gettoken+0xbb>
     5d5:	eb a3                	jmp    57a <gettoken+0xca>
     5d7:	89 f6                	mov    %esi,%esi
     5d9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    break;
  case '>':
    s++;
    if(*s == '>'){
      ret = '+';
      s++;
     5e0:	83 c7 02             	add    $0x2,%edi
    s++;
    break;
  case '>':
    s++;
    if(*s == '>'){
      ret = '+';
     5e3:	be 2b 00 00 00       	mov    $0x2b,%esi
     5e8:	e9 25 ff ff ff       	jmp    512 <gettoken+0x62>
     5ed:	8d 76 00             	lea    0x0(%esi),%esi
  while(s < es && strchr(whitespace, *s))
    s++;
  if(q)
    *q = s;
  ret = *s;
  switch(*s){
     5f0:	80 f9 26             	cmp    $0x26,%cl
     5f3:	75 85                	jne    57a <gettoken+0xca>
     5f5:	e9 71 ff ff ff       	jmp    56b <gettoken+0xbb>
     5fa:	89 df                	mov    %ebx,%edi
    ret = 'a';
    while(s < es && !strchr(whitespace, *s) && !strchr(symbols, *s))
      s++;
    break;
  }
  if(eq)
     5fc:	8b 45 14             	mov    0x14(%ebp),%eax
     5ff:	be 61 00 00 00       	mov    $0x61,%esi
     604:	85 c0                	test   %eax,%eax
     606:	0f 85 0d ff ff ff    	jne    519 <gettoken+0x69>
     60c:	e9 36 ff ff ff       	jmp    547 <gettoken+0x97>
     611:	eb 0d                	jmp    620 <peek>
     613:	90                   	nop
     614:	90                   	nop
     615:	90                   	nop
     616:	90                   	nop
     617:	90                   	nop
     618:	90                   	nop
     619:	90                   	nop
     61a:	90                   	nop
     61b:	90                   	nop
     61c:	90                   	nop
     61d:	90                   	nop
     61e:	90                   	nop
     61f:	90                   	nop

00000620 <peek>:
  return ret;
}

int
peek(char **ps, char *es, char *toks)
{
     620:	55                   	push   %ebp
     621:	89 e5                	mov    %esp,%ebp
     623:	57                   	push   %edi
     624:	56                   	push   %esi
     625:	53                   	push   %ebx
     626:	83 ec 0c             	sub    $0xc,%esp
     629:	8b 7d 08             	mov    0x8(%ebp),%edi
     62c:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *s;

  s = *ps;
     62f:	8b 1f                	mov    (%edi),%ebx
  while(s < es && strchr(whitespace, *s))
     631:	39 f3                	cmp    %esi,%ebx
     633:	72 12                	jb     647 <peek+0x27>
     635:	eb 28                	jmp    65f <peek+0x3f>
     637:	89 f6                	mov    %esi,%esi
     639:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    s++;
     640:	83 c3 01             	add    $0x1,%ebx
peek(char **ps, char *es, char *toks)
{
  char *s;

  s = *ps;
  while(s < es && strchr(whitespace, *s))
     643:	39 de                	cmp    %ebx,%esi
     645:	74 18                	je     65f <peek+0x3f>
     647:	0f be 03             	movsbl (%ebx),%eax
     64a:	83 ec 08             	sub    $0x8,%esp
     64d:	50                   	push   %eax
     64e:	68 7c 18 00 00       	push   $0x187c
     653:	e8 88 05 00 00       	call   be0 <strchr>
     658:	83 c4 10             	add    $0x10,%esp
     65b:	85 c0                	test   %eax,%eax
     65d:	75 e1                	jne    640 <peek+0x20>
    s++;
  *ps = s;
     65f:	89 1f                	mov    %ebx,(%edi)
  return *s && strchr(toks, *s);
     661:	0f be 13             	movsbl (%ebx),%edx
     664:	31 c0                	xor    %eax,%eax
     666:	84 d2                	test   %dl,%dl
     668:	74 17                	je     681 <peek+0x61>
     66a:	83 ec 08             	sub    $0x8,%esp
     66d:	52                   	push   %edx
     66e:	ff 75 10             	pushl  0x10(%ebp)
     671:	e8 6a 05 00 00       	call   be0 <strchr>
     676:	83 c4 10             	add    $0x10,%esp
     679:	85 c0                	test   %eax,%eax
     67b:	0f 95 c0             	setne  %al
     67e:	0f b6 c0             	movzbl %al,%eax
}
     681:	8d 65 f4             	lea    -0xc(%ebp),%esp
     684:	5b                   	pop    %ebx
     685:	5e                   	pop    %esi
     686:	5f                   	pop    %edi
     687:	5d                   	pop    %ebp
     688:	c3                   	ret    
     689:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000690 <parseredirs>:
  return cmd;
}

struct cmd*
parseredirs(struct cmd *cmd, char **ps, char *es)
{
     690:	55                   	push   %ebp
     691:	89 e5                	mov    %esp,%ebp
     693:	57                   	push   %edi
     694:	56                   	push   %esi
     695:	53                   	push   %ebx
     696:	83 ec 1c             	sub    $0x1c,%esp
     699:	8b 75 0c             	mov    0xc(%ebp),%esi
     69c:	8b 5d 10             	mov    0x10(%ebp),%ebx
     69f:	90                   	nop
  int tok;
  char *q, *eq;

  while(peek(ps, es, "<>")){
     6a0:	83 ec 04             	sub    $0x4,%esp
     6a3:	68 21 12 00 00       	push   $0x1221
     6a8:	53                   	push   %ebx
     6a9:	56                   	push   %esi
     6aa:	e8 71 ff ff ff       	call   620 <peek>
     6af:	83 c4 10             	add    $0x10,%esp
     6b2:	85 c0                	test   %eax,%eax
     6b4:	74 6a                	je     720 <parseredirs+0x90>
    tok = gettoken(ps, es, 0, 0);
     6b6:	6a 00                	push   $0x0
     6b8:	6a 00                	push   $0x0
     6ba:	53                   	push   %ebx
     6bb:	56                   	push   %esi
     6bc:	e8 ef fd ff ff       	call   4b0 <gettoken>
     6c1:	89 c7                	mov    %eax,%edi
    if(gettoken(ps, es, &q, &eq) != 'a')
     6c3:	8d 45 e4             	lea    -0x1c(%ebp),%eax
     6c6:	50                   	push   %eax
     6c7:	8d 45 e0             	lea    -0x20(%ebp),%eax
     6ca:	50                   	push   %eax
     6cb:	53                   	push   %ebx
     6cc:	56                   	push   %esi
     6cd:	e8 de fd ff ff       	call   4b0 <gettoken>
     6d2:	83 c4 20             	add    $0x20,%esp
     6d5:	83 f8 61             	cmp    $0x61,%eax
     6d8:	75 51                	jne    72b <parseredirs+0x9b>
      panic("missing file for redirection");
    switch(tok){
     6da:	83 ff 3c             	cmp    $0x3c,%edi
     6dd:	74 31                	je     710 <parseredirs+0x80>
     6df:	83 ff 3e             	cmp    $0x3e,%edi
     6e2:	74 05                	je     6e9 <parseredirs+0x59>
     6e4:	83 ff 2b             	cmp    $0x2b,%edi
     6e7:	75 b7                	jne    6a0 <parseredirs+0x10>
      break;
    case '>':
      cmd = redircmd(cmd, q, eq, O_WRONLY|O_CREATE, 1);
      break;
    case '+':  // >>
      cmd = redircmd(cmd, q, eq, O_WRONLY|O_CREATE, 1);
     6e9:	83 ec 0c             	sub    $0xc,%esp
     6ec:	6a 01                	push   $0x1
     6ee:	68 01 02 00 00       	push   $0x201
     6f3:	ff 75 e4             	pushl  -0x1c(%ebp)
     6f6:	ff 75 e0             	pushl  -0x20(%ebp)
     6f9:	ff 75 08             	pushl  0x8(%ebp)
     6fc:	e8 af fc ff ff       	call   3b0 <redircmd>
      break;
     701:	83 c4 20             	add    $0x20,%esp
      break;
    case '>':
      cmd = redircmd(cmd, q, eq, O_WRONLY|O_CREATE, 1);
      break;
    case '+':  // >>
      cmd = redircmd(cmd, q, eq, O_WRONLY|O_CREATE, 1);
     704:	89 45 08             	mov    %eax,0x8(%ebp)
      break;
     707:	eb 97                	jmp    6a0 <parseredirs+0x10>
     709:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    tok = gettoken(ps, es, 0, 0);
    if(gettoken(ps, es, &q, &eq) != 'a')
      panic("missing file for redirection");
    switch(tok){
    case '<':
      cmd = redircmd(cmd, q, eq, O_RDONLY, 0);
     710:	83 ec 0c             	sub    $0xc,%esp
     713:	6a 00                	push   $0x0
     715:	6a 00                	push   $0x0
     717:	eb da                	jmp    6f3 <parseredirs+0x63>
     719:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      cmd = redircmd(cmd, q, eq, O_WRONLY|O_CREATE, 1);
      break;
    }
  }
  return cmd;
}
     720:	8b 45 08             	mov    0x8(%ebp),%eax
     723:	8d 65 f4             	lea    -0xc(%ebp),%esp
     726:	5b                   	pop    %ebx
     727:	5e                   	pop    %esi
     728:	5f                   	pop    %edi
     729:	5d                   	pop    %ebp
     72a:	c3                   	ret    
  char *q, *eq;

  while(peek(ps, es, "<>")){
    tok = gettoken(ps, es, 0, 0);
    if(gettoken(ps, es, &q, &eq) != 'a')
      panic("missing file for redirection");
     72b:	83 ec 0c             	sub    $0xc,%esp
     72e:	68 04 12 00 00       	push   $0x1204
     733:	e8 28 fa ff ff       	call   160 <panic>
     738:	90                   	nop
     739:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000740 <parseexec>:
  return cmd;
}

struct cmd*
parseexec(char **ps, char *es)
{
     740:	55                   	push   %ebp
     741:	89 e5                	mov    %esp,%ebp
     743:	57                   	push   %edi
     744:	56                   	push   %esi
     745:	53                   	push   %ebx
     746:	83 ec 30             	sub    $0x30,%esp
     749:	8b 75 08             	mov    0x8(%ebp),%esi
     74c:	8b 7d 0c             	mov    0xc(%ebp),%edi
  char *q, *eq;
  int tok, argc;
  struct execcmd *cmd;
  struct cmd *ret;

  if(peek(ps, es, "("))
     74f:	68 24 12 00 00       	push   $0x1224
     754:	57                   	push   %edi
     755:	56                   	push   %esi
     756:	e8 c5 fe ff ff       	call   620 <peek>
     75b:	83 c4 10             	add    $0x10,%esp
     75e:	85 c0                	test   %eax,%eax
     760:	0f 85 9a 00 00 00    	jne    800 <parseexec+0xc0>
    return parseblock(ps, es);

  ret = execcmd();
     766:	e8 15 fc ff ff       	call   380 <execcmd>
  cmd = (struct execcmd*)ret;

  argc = 0;
  ret = parseredirs(ret, ps, es);
     76b:	83 ec 04             	sub    $0x4,%esp
  struct cmd *ret;

  if(peek(ps, es, "("))
    return parseblock(ps, es);

  ret = execcmd();
     76e:	89 c3                	mov    %eax,%ebx
     770:	89 45 cc             	mov    %eax,-0x34(%ebp)
  cmd = (struct execcmd*)ret;

  argc = 0;
  ret = parseredirs(ret, ps, es);
     773:	57                   	push   %edi
     774:	56                   	push   %esi
     775:	8d 5b 04             	lea    0x4(%ebx),%ebx
     778:	50                   	push   %eax
     779:	e8 12 ff ff ff       	call   690 <parseredirs>
     77e:	83 c4 10             	add    $0x10,%esp
     781:	89 45 d0             	mov    %eax,-0x30(%ebp)
    return parseblock(ps, es);

  ret = execcmd();
  cmd = (struct execcmd*)ret;

  argc = 0;
     784:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
     78b:	eb 16                	jmp    7a3 <parseexec+0x63>
     78d:	8d 76 00             	lea    0x0(%esi),%esi
    cmd->argv[argc] = q;
    cmd->eargv[argc] = eq;
    argc++;
    if(argc >= MAXARGS)
      panic("too many args");
    ret = parseredirs(ret, ps, es);
     790:	83 ec 04             	sub    $0x4,%esp
     793:	57                   	push   %edi
     794:	56                   	push   %esi
     795:	ff 75 d0             	pushl  -0x30(%ebp)
     798:	e8 f3 fe ff ff       	call   690 <parseredirs>
     79d:	83 c4 10             	add    $0x10,%esp
     7a0:	89 45 d0             	mov    %eax,-0x30(%ebp)
  ret = execcmd();
  cmd = (struct execcmd*)ret;

  argc = 0;
  ret = parseredirs(ret, ps, es);
  while(!peek(ps, es, "|)&;")){
     7a3:	83 ec 04             	sub    $0x4,%esp
     7a6:	68 3b 12 00 00       	push   $0x123b
     7ab:	57                   	push   %edi
     7ac:	56                   	push   %esi
     7ad:	e8 6e fe ff ff       	call   620 <peek>
     7b2:	83 c4 10             	add    $0x10,%esp
     7b5:	85 c0                	test   %eax,%eax
     7b7:	75 5f                	jne    818 <parseexec+0xd8>
    if((tok=gettoken(ps, es, &q, &eq)) == 0)
     7b9:	8d 45 e4             	lea    -0x1c(%ebp),%eax
     7bc:	50                   	push   %eax
     7bd:	8d 45 e0             	lea    -0x20(%ebp),%eax
     7c0:	50                   	push   %eax
     7c1:	57                   	push   %edi
     7c2:	56                   	push   %esi
     7c3:	e8 e8 fc ff ff       	call   4b0 <gettoken>
     7c8:	83 c4 10             	add    $0x10,%esp
     7cb:	85 c0                	test   %eax,%eax
     7cd:	74 49                	je     818 <parseexec+0xd8>
      break;
    if(tok != 'a')
     7cf:	83 f8 61             	cmp    $0x61,%eax
     7d2:	75 66                	jne    83a <parseexec+0xfa>
      panic("syntax");
    cmd->argv[argc] = q;
     7d4:	8b 45 e0             	mov    -0x20(%ebp),%eax
    cmd->eargv[argc] = eq;
    argc++;
     7d7:	83 45 d4 01          	addl   $0x1,-0x2c(%ebp)
     7db:	83 c3 04             	add    $0x4,%ebx
  while(!peek(ps, es, "|)&;")){
    if((tok=gettoken(ps, es, &q, &eq)) == 0)
      break;
    if(tok != 'a')
      panic("syntax");
    cmd->argv[argc] = q;
     7de:	89 43 fc             	mov    %eax,-0x4(%ebx)
    cmd->eargv[argc] = eq;
     7e1:	8b 45 e4             	mov    -0x1c(%ebp),%eax
     7e4:	89 43 24             	mov    %eax,0x24(%ebx)
    argc++;
     7e7:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    if(argc >= MAXARGS)
     7ea:	83 f8 0a             	cmp    $0xa,%eax
     7ed:	75 a1                	jne    790 <parseexec+0x50>
      panic("too many args");
     7ef:	83 ec 0c             	sub    $0xc,%esp
     7f2:	68 2d 12 00 00       	push   $0x122d
     7f7:	e8 64 f9 ff ff       	call   160 <panic>
     7fc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  int tok, argc;
  struct execcmd *cmd;
  struct cmd *ret;

  if(peek(ps, es, "("))
    return parseblock(ps, es);
     800:	83 ec 08             	sub    $0x8,%esp
     803:	57                   	push   %edi
     804:	56                   	push   %esi
     805:	e8 56 01 00 00       	call   960 <parseblock>
     80a:	83 c4 10             	add    $0x10,%esp
    ret = parseredirs(ret, ps, es);
  }
  cmd->argv[argc] = 0;
  cmd->eargv[argc] = 0;
  return ret;
}
     80d:	8d 65 f4             	lea    -0xc(%ebp),%esp
     810:	5b                   	pop    %ebx
     811:	5e                   	pop    %esi
     812:	5f                   	pop    %edi
     813:	5d                   	pop    %ebp
     814:	c3                   	ret    
     815:	8d 76 00             	lea    0x0(%esi),%esi
     818:	8b 45 cc             	mov    -0x34(%ebp),%eax
     81b:	8b 55 d4             	mov    -0x2c(%ebp),%edx
     81e:	8d 04 90             	lea    (%eax,%edx,4),%eax
    argc++;
    if(argc >= MAXARGS)
      panic("too many args");
    ret = parseredirs(ret, ps, es);
  }
  cmd->argv[argc] = 0;
     821:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
  cmd->eargv[argc] = 0;
     828:	c7 40 2c 00 00 00 00 	movl   $0x0,0x2c(%eax)
     82f:	8b 45 d0             	mov    -0x30(%ebp),%eax
  return ret;
}
     832:	8d 65 f4             	lea    -0xc(%ebp),%esp
     835:	5b                   	pop    %ebx
     836:	5e                   	pop    %esi
     837:	5f                   	pop    %edi
     838:	5d                   	pop    %ebp
     839:	c3                   	ret    
  ret = parseredirs(ret, ps, es);
  while(!peek(ps, es, "|)&;")){
    if((tok=gettoken(ps, es, &q, &eq)) == 0)
      break;
    if(tok != 'a')
      panic("syntax");
     83a:	83 ec 0c             	sub    $0xc,%esp
     83d:	68 26 12 00 00       	push   $0x1226
     842:	e8 19 f9 ff ff       	call   160 <panic>
     847:	89 f6                	mov    %esi,%esi
     849:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000850 <parsepipe>:
  return cmd;
}

struct cmd*
parsepipe(char **ps, char *es)
{
     850:	55                   	push   %ebp
     851:	89 e5                	mov    %esp,%ebp
     853:	57                   	push   %edi
     854:	56                   	push   %esi
     855:	53                   	push   %ebx
     856:	83 ec 14             	sub    $0x14,%esp
     859:	8b 5d 08             	mov    0x8(%ebp),%ebx
     85c:	8b 75 0c             	mov    0xc(%ebp),%esi
  struct cmd *cmd;

  cmd = parseexec(ps, es);
     85f:	56                   	push   %esi
     860:	53                   	push   %ebx
     861:	e8 da fe ff ff       	call   740 <parseexec>
  if(peek(ps, es, "|")){
     866:	83 c4 0c             	add    $0xc,%esp
struct cmd*
parsepipe(char **ps, char *es)
{
  struct cmd *cmd;

  cmd = parseexec(ps, es);
     869:	89 c7                	mov    %eax,%edi
  if(peek(ps, es, "|")){
     86b:	68 40 12 00 00       	push   $0x1240
     870:	56                   	push   %esi
     871:	53                   	push   %ebx
     872:	e8 a9 fd ff ff       	call   620 <peek>
     877:	83 c4 10             	add    $0x10,%esp
     87a:	85 c0                	test   %eax,%eax
     87c:	75 12                	jne    890 <parsepipe+0x40>
    gettoken(ps, es, 0, 0);
    cmd = pipecmd(cmd, parsepipe(ps, es));
  }
  return cmd;
}
     87e:	8d 65 f4             	lea    -0xc(%ebp),%esp
     881:	89 f8                	mov    %edi,%eax
     883:	5b                   	pop    %ebx
     884:	5e                   	pop    %esi
     885:	5f                   	pop    %edi
     886:	5d                   	pop    %ebp
     887:	c3                   	ret    
     888:	90                   	nop
     889:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
{
  struct cmd *cmd;

  cmd = parseexec(ps, es);
  if(peek(ps, es, "|")){
    gettoken(ps, es, 0, 0);
     890:	6a 00                	push   $0x0
     892:	6a 00                	push   $0x0
     894:	56                   	push   %esi
     895:	53                   	push   %ebx
     896:	e8 15 fc ff ff       	call   4b0 <gettoken>
    cmd = pipecmd(cmd, parsepipe(ps, es));
     89b:	58                   	pop    %eax
     89c:	5a                   	pop    %edx
     89d:	56                   	push   %esi
     89e:	53                   	push   %ebx
     89f:	e8 ac ff ff ff       	call   850 <parsepipe>
     8a4:	89 7d 08             	mov    %edi,0x8(%ebp)
     8a7:	89 45 0c             	mov    %eax,0xc(%ebp)
     8aa:	83 c4 10             	add    $0x10,%esp
  }
  return cmd;
}
     8ad:	8d 65 f4             	lea    -0xc(%ebp),%esp
     8b0:	5b                   	pop    %ebx
     8b1:	5e                   	pop    %esi
     8b2:	5f                   	pop    %edi
     8b3:	5d                   	pop    %ebp
  struct cmd *cmd;

  cmd = parseexec(ps, es);
  if(peek(ps, es, "|")){
    gettoken(ps, es, 0, 0);
    cmd = pipecmd(cmd, parsepipe(ps, es));
     8b4:	e9 47 fb ff ff       	jmp    400 <pipecmd>
     8b9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

000008c0 <parseline>:
  return cmd;
}

struct cmd*
parseline(char **ps, char *es)
{
     8c0:	55                   	push   %ebp
     8c1:	89 e5                	mov    %esp,%ebp
     8c3:	57                   	push   %edi
     8c4:	56                   	push   %esi
     8c5:	53                   	push   %ebx
     8c6:	83 ec 14             	sub    $0x14,%esp
     8c9:	8b 5d 08             	mov    0x8(%ebp),%ebx
     8cc:	8b 75 0c             	mov    0xc(%ebp),%esi
  struct cmd *cmd;

  cmd = parsepipe(ps, es);
     8cf:	56                   	push   %esi
     8d0:	53                   	push   %ebx
     8d1:	e8 7a ff ff ff       	call   850 <parsepipe>
  while(peek(ps, es, "&")){
     8d6:	83 c4 10             	add    $0x10,%esp
struct cmd*
parseline(char **ps, char *es)
{
  struct cmd *cmd;

  cmd = parsepipe(ps, es);
     8d9:	89 c7                	mov    %eax,%edi
  while(peek(ps, es, "&")){
     8db:	eb 1b                	jmp    8f8 <parseline+0x38>
     8dd:	8d 76 00             	lea    0x0(%esi),%esi
    gettoken(ps, es, 0, 0);
     8e0:	6a 00                	push   $0x0
     8e2:	6a 00                	push   $0x0
     8e4:	56                   	push   %esi
     8e5:	53                   	push   %ebx
     8e6:	e8 c5 fb ff ff       	call   4b0 <gettoken>
    cmd = backcmd(cmd);
     8eb:	89 3c 24             	mov    %edi,(%esp)
     8ee:	e8 8d fb ff ff       	call   480 <backcmd>
     8f3:	83 c4 10             	add    $0x10,%esp
     8f6:	89 c7                	mov    %eax,%edi
parseline(char **ps, char *es)
{
  struct cmd *cmd;

  cmd = parsepipe(ps, es);
  while(peek(ps, es, "&")){
     8f8:	83 ec 04             	sub    $0x4,%esp
     8fb:	68 42 12 00 00       	push   $0x1242
     900:	56                   	push   %esi
     901:	53                   	push   %ebx
     902:	e8 19 fd ff ff       	call   620 <peek>
     907:	83 c4 10             	add    $0x10,%esp
     90a:	85 c0                	test   %eax,%eax
     90c:	75 d2                	jne    8e0 <parseline+0x20>
    gettoken(ps, es, 0, 0);
    cmd = backcmd(cmd);
  }
  if(peek(ps, es, ";")){
     90e:	83 ec 04             	sub    $0x4,%esp
     911:	68 3e 12 00 00       	push   $0x123e
     916:	56                   	push   %esi
     917:	53                   	push   %ebx
     918:	e8 03 fd ff ff       	call   620 <peek>
     91d:	83 c4 10             	add    $0x10,%esp
     920:	85 c0                	test   %eax,%eax
     922:	75 0c                	jne    930 <parseline+0x70>
    gettoken(ps, es, 0, 0);
    cmd = listcmd(cmd, parseline(ps, es));
  }
  return cmd;
}
     924:	8d 65 f4             	lea    -0xc(%ebp),%esp
     927:	89 f8                	mov    %edi,%eax
     929:	5b                   	pop    %ebx
     92a:	5e                   	pop    %esi
     92b:	5f                   	pop    %edi
     92c:	5d                   	pop    %ebp
     92d:	c3                   	ret    
     92e:	66 90                	xchg   %ax,%ax
  while(peek(ps, es, "&")){
    gettoken(ps, es, 0, 0);
    cmd = backcmd(cmd);
  }
  if(peek(ps, es, ";")){
    gettoken(ps, es, 0, 0);
     930:	6a 00                	push   $0x0
     932:	6a 00                	push   $0x0
     934:	56                   	push   %esi
     935:	53                   	push   %ebx
     936:	e8 75 fb ff ff       	call   4b0 <gettoken>
    cmd = listcmd(cmd, parseline(ps, es));
     93b:	58                   	pop    %eax
     93c:	5a                   	pop    %edx
     93d:	56                   	push   %esi
     93e:	53                   	push   %ebx
     93f:	e8 7c ff ff ff       	call   8c0 <parseline>
     944:	89 7d 08             	mov    %edi,0x8(%ebp)
     947:	89 45 0c             	mov    %eax,0xc(%ebp)
     94a:	83 c4 10             	add    $0x10,%esp
  }
  return cmd;
}
     94d:	8d 65 f4             	lea    -0xc(%ebp),%esp
     950:	5b                   	pop    %ebx
     951:	5e                   	pop    %esi
     952:	5f                   	pop    %edi
     953:	5d                   	pop    %ebp
    gettoken(ps, es, 0, 0);
    cmd = backcmd(cmd);
  }
  if(peek(ps, es, ";")){
    gettoken(ps, es, 0, 0);
    cmd = listcmd(cmd, parseline(ps, es));
     954:	e9 e7 fa ff ff       	jmp    440 <listcmd>
     959:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000960 <parseblock>:
  return cmd;
}

struct cmd*
parseblock(char **ps, char *es)
{
     960:	55                   	push   %ebp
     961:	89 e5                	mov    %esp,%ebp
     963:	57                   	push   %edi
     964:	56                   	push   %esi
     965:	53                   	push   %ebx
     966:	83 ec 10             	sub    $0x10,%esp
     969:	8b 5d 08             	mov    0x8(%ebp),%ebx
     96c:	8b 75 0c             	mov    0xc(%ebp),%esi
  struct cmd *cmd;

  if(!peek(ps, es, "("))
     96f:	68 24 12 00 00       	push   $0x1224
     974:	56                   	push   %esi
     975:	53                   	push   %ebx
     976:	e8 a5 fc ff ff       	call   620 <peek>
     97b:	83 c4 10             	add    $0x10,%esp
     97e:	85 c0                	test   %eax,%eax
     980:	74 4a                	je     9cc <parseblock+0x6c>
    panic("parseblock");
  gettoken(ps, es, 0, 0);
     982:	6a 00                	push   $0x0
     984:	6a 00                	push   $0x0
     986:	56                   	push   %esi
     987:	53                   	push   %ebx
     988:	e8 23 fb ff ff       	call   4b0 <gettoken>
  cmd = parseline(ps, es);
     98d:	58                   	pop    %eax
     98e:	5a                   	pop    %edx
     98f:	56                   	push   %esi
     990:	53                   	push   %ebx
     991:	e8 2a ff ff ff       	call   8c0 <parseline>
  if(!peek(ps, es, ")"))
     996:	83 c4 0c             	add    $0xc,%esp
  struct cmd *cmd;

  if(!peek(ps, es, "("))
    panic("parseblock");
  gettoken(ps, es, 0, 0);
  cmd = parseline(ps, es);
     999:	89 c7                	mov    %eax,%edi
  if(!peek(ps, es, ")"))
     99b:	68 60 12 00 00       	push   $0x1260
     9a0:	56                   	push   %esi
     9a1:	53                   	push   %ebx
     9a2:	e8 79 fc ff ff       	call   620 <peek>
     9a7:	83 c4 10             	add    $0x10,%esp
     9aa:	85 c0                	test   %eax,%eax
     9ac:	74 2b                	je     9d9 <parseblock+0x79>
    panic("syntax - missing )");
  gettoken(ps, es, 0, 0);
     9ae:	6a 00                	push   $0x0
     9b0:	6a 00                	push   $0x0
     9b2:	56                   	push   %esi
     9b3:	53                   	push   %ebx
     9b4:	e8 f7 fa ff ff       	call   4b0 <gettoken>
  cmd = parseredirs(cmd, ps, es);
     9b9:	83 c4 0c             	add    $0xc,%esp
     9bc:	56                   	push   %esi
     9bd:	53                   	push   %ebx
     9be:	57                   	push   %edi
     9bf:	e8 cc fc ff ff       	call   690 <parseredirs>
  return cmd;
}
     9c4:	8d 65 f4             	lea    -0xc(%ebp),%esp
     9c7:	5b                   	pop    %ebx
     9c8:	5e                   	pop    %esi
     9c9:	5f                   	pop    %edi
     9ca:	5d                   	pop    %ebp
     9cb:	c3                   	ret    
parseblock(char **ps, char *es)
{
  struct cmd *cmd;

  if(!peek(ps, es, "("))
    panic("parseblock");
     9cc:	83 ec 0c             	sub    $0xc,%esp
     9cf:	68 44 12 00 00       	push   $0x1244
     9d4:	e8 87 f7 ff ff       	call   160 <panic>
  gettoken(ps, es, 0, 0);
  cmd = parseline(ps, es);
  if(!peek(ps, es, ")"))
    panic("syntax - missing )");
     9d9:	83 ec 0c             	sub    $0xc,%esp
     9dc:	68 4f 12 00 00       	push   $0x124f
     9e1:	e8 7a f7 ff ff       	call   160 <panic>
     9e6:	8d 76 00             	lea    0x0(%esi),%esi
     9e9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000009f0 <nulterminate>:
}

// NUL-terminate all the counted strings.
struct cmd*
nulterminate(struct cmd *cmd)
{
     9f0:	55                   	push   %ebp
     9f1:	89 e5                	mov    %esp,%ebp
     9f3:	53                   	push   %ebx
     9f4:	83 ec 04             	sub    $0x4,%esp
     9f7:	8b 5d 08             	mov    0x8(%ebp),%ebx
  struct execcmd *ecmd;
  struct listcmd *lcmd;
  struct pipecmd *pcmd;
  struct redircmd *rcmd;

  if(cmd == 0)
     9fa:	85 db                	test   %ebx,%ebx
     9fc:	0f 84 96 00 00 00    	je     a98 <nulterminate+0xa8>
    return 0;

  switch(cmd->type){
     a02:	83 3b 05             	cmpl   $0x5,(%ebx)
     a05:	77 48                	ja     a4f <nulterminate+0x5f>
     a07:	8b 03                	mov    (%ebx),%eax
     a09:	ff 24 85 a0 12 00 00 	jmp    *0x12a0(,%eax,4)
    nulterminate(pcmd->right);
    break;

  case LIST:
    lcmd = (struct listcmd*)cmd;
    nulterminate(lcmd->left);
     a10:	83 ec 0c             	sub    $0xc,%esp
     a13:	ff 73 04             	pushl  0x4(%ebx)
     a16:	e8 d5 ff ff ff       	call   9f0 <nulterminate>
    nulterminate(lcmd->right);
     a1b:	58                   	pop    %eax
     a1c:	ff 73 08             	pushl  0x8(%ebx)
     a1f:	e8 cc ff ff ff       	call   9f0 <nulterminate>
    break;
     a24:	83 c4 10             	add    $0x10,%esp
     a27:	89 d8                	mov    %ebx,%eax
    bcmd = (struct backcmd*)cmd;
    nulterminate(bcmd->cmd);
    break;
  }
  return cmd;
}
     a29:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     a2c:	c9                   	leave  
     a2d:	c3                   	ret    
     a2e:	66 90                	xchg   %ax,%ax
    return 0;

  switch(cmd->type){
  case EXEC:
    ecmd = (struct execcmd*)cmd;
    for(i=0; ecmd->argv[i]; i++)
     a30:	8b 4b 04             	mov    0x4(%ebx),%ecx
     a33:	8d 43 2c             	lea    0x2c(%ebx),%eax
     a36:	85 c9                	test   %ecx,%ecx
     a38:	74 15                	je     a4f <nulterminate+0x5f>
     a3a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      *ecmd->eargv[i] = 0;
     a40:	8b 10                	mov    (%eax),%edx
     a42:	83 c0 04             	add    $0x4,%eax
     a45:	c6 02 00             	movb   $0x0,(%edx)
    return 0;

  switch(cmd->type){
  case EXEC:
    ecmd = (struct execcmd*)cmd;
    for(i=0; ecmd->argv[i]; i++)
     a48:	8b 50 d8             	mov    -0x28(%eax),%edx
     a4b:	85 d2                	test   %edx,%edx
     a4d:	75 f1                	jne    a40 <nulterminate+0x50>
  struct redircmd *rcmd;

  if(cmd == 0)
    return 0;

  switch(cmd->type){
     a4f:	89 d8                	mov    %ebx,%eax
    bcmd = (struct backcmd*)cmd;
    nulterminate(bcmd->cmd);
    break;
  }
  return cmd;
}
     a51:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     a54:	c9                   	leave  
     a55:	c3                   	ret    
     a56:	8d 76 00             	lea    0x0(%esi),%esi
     a59:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    nulterminate(lcmd->right);
    break;

  case BACK:
    bcmd = (struct backcmd*)cmd;
    nulterminate(bcmd->cmd);
     a60:	83 ec 0c             	sub    $0xc,%esp
     a63:	ff 73 04             	pushl  0x4(%ebx)
     a66:	e8 85 ff ff ff       	call   9f0 <nulterminate>
    break;
     a6b:	89 d8                	mov    %ebx,%eax
     a6d:	83 c4 10             	add    $0x10,%esp
  }
  return cmd;
}
     a70:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     a73:	c9                   	leave  
     a74:	c3                   	ret    
     a75:	8d 76 00             	lea    0x0(%esi),%esi
      *ecmd->eargv[i] = 0;
    break;

  case REDIR:
    rcmd = (struct redircmd*)cmd;
    nulterminate(rcmd->cmd);
     a78:	83 ec 0c             	sub    $0xc,%esp
     a7b:	ff 73 04             	pushl  0x4(%ebx)
     a7e:	e8 6d ff ff ff       	call   9f0 <nulterminate>
    *rcmd->efile = 0;
     a83:	8b 43 0c             	mov    0xc(%ebx),%eax
    break;
     a86:	83 c4 10             	add    $0x10,%esp
    break;

  case REDIR:
    rcmd = (struct redircmd*)cmd;
    nulterminate(rcmd->cmd);
    *rcmd->efile = 0;
     a89:	c6 00 00             	movb   $0x0,(%eax)
    break;
     a8c:	89 d8                	mov    %ebx,%eax
    bcmd = (struct backcmd*)cmd;
    nulterminate(bcmd->cmd);
    break;
  }
  return cmd;
}
     a8e:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     a91:	c9                   	leave  
     a92:	c3                   	ret    
     a93:	90                   	nop
     a94:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  struct listcmd *lcmd;
  struct pipecmd *pcmd;
  struct redircmd *rcmd;

  if(cmd == 0)
    return 0;
     a98:	31 c0                	xor    %eax,%eax
     a9a:	eb 8d                	jmp    a29 <nulterminate+0x39>
     a9c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000aa0 <parsecmd>:
struct cmd *parseexec(char**, char*);
struct cmd *nulterminate(struct cmd*);

struct cmd*
parsecmd(char *s)
{
     aa0:	55                   	push   %ebp
     aa1:	89 e5                	mov    %esp,%ebp
     aa3:	56                   	push   %esi
     aa4:	53                   	push   %ebx
  char *es;
  struct cmd *cmd;

  es = s + strlen(s);
     aa5:	8b 5d 08             	mov    0x8(%ebp),%ebx
     aa8:	83 ec 0c             	sub    $0xc,%esp
     aab:	53                   	push   %ebx
     aac:	e8 df 00 00 00       	call   b90 <strlen>
  cmd = parseline(&s, es);
     ab1:	59                   	pop    %ecx
parsecmd(char *s)
{
  char *es;
  struct cmd *cmd;

  es = s + strlen(s);
     ab2:	01 c3                	add    %eax,%ebx
  cmd = parseline(&s, es);
     ab4:	8d 45 08             	lea    0x8(%ebp),%eax
     ab7:	5e                   	pop    %esi
     ab8:	53                   	push   %ebx
     ab9:	50                   	push   %eax
     aba:	e8 01 fe ff ff       	call   8c0 <parseline>
     abf:	89 c6                	mov    %eax,%esi
  peek(&s, es, "");
     ac1:	8d 45 08             	lea    0x8(%ebp),%eax
     ac4:	83 c4 0c             	add    $0xc,%esp
     ac7:	68 e9 11 00 00       	push   $0x11e9
     acc:	53                   	push   %ebx
     acd:	50                   	push   %eax
     ace:	e8 4d fb ff ff       	call   620 <peek>
  if(s != es){
     ad3:	8b 45 08             	mov    0x8(%ebp),%eax
     ad6:	83 c4 10             	add    $0x10,%esp
     ad9:	39 c3                	cmp    %eax,%ebx
     adb:	75 12                	jne    aef <parsecmd+0x4f>
    printf(2, "leftovers: %s\n", s);
    panic("syntax");
  }
  nulterminate(cmd);
     add:	83 ec 0c             	sub    $0xc,%esp
     ae0:	56                   	push   %esi
     ae1:	e8 0a ff ff ff       	call   9f0 <nulterminate>
  return cmd;
}
     ae6:	8d 65 f8             	lea    -0x8(%ebp),%esp
     ae9:	89 f0                	mov    %esi,%eax
     aeb:	5b                   	pop    %ebx
     aec:	5e                   	pop    %esi
     aed:	5d                   	pop    %ebp
     aee:	c3                   	ret    

  es = s + strlen(s);
  cmd = parseline(&s, es);
  peek(&s, es, "");
  if(s != es){
    printf(2, "leftovers: %s\n", s);
     aef:	52                   	push   %edx
     af0:	50                   	push   %eax
     af1:	68 62 12 00 00       	push   $0x1262
     af6:	6a 02                	push   $0x2
     af8:	e8 b3 03 00 00       	call   eb0 <printf>
    panic("syntax");
     afd:	c7 04 24 26 12 00 00 	movl   $0x1226,(%esp)
     b04:	e8 57 f6 ff ff       	call   160 <panic>
     b09:	66 90                	xchg   %ax,%ax
     b0b:	66 90                	xchg   %ax,%ax
     b0d:	66 90                	xchg   %ax,%ax
     b0f:	90                   	nop

00000b10 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, const char *t)
{
     b10:	55                   	push   %ebp
     b11:	89 e5                	mov    %esp,%ebp
     b13:	53                   	push   %ebx
     b14:	8b 45 08             	mov    0x8(%ebp),%eax
     b17:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
     b1a:	89 c2                	mov    %eax,%edx
     b1c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
     b20:	83 c1 01             	add    $0x1,%ecx
     b23:	0f b6 59 ff          	movzbl -0x1(%ecx),%ebx
     b27:	83 c2 01             	add    $0x1,%edx
     b2a:	84 db                	test   %bl,%bl
     b2c:	88 5a ff             	mov    %bl,-0x1(%edx)
     b2f:	75 ef                	jne    b20 <strcpy+0x10>
    ;
  return os;
}
     b31:	5b                   	pop    %ebx
     b32:	5d                   	pop    %ebp
     b33:	c3                   	ret    
     b34:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
     b3a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

00000b40 <strcmp>:

int
strcmp(const char *p, const char *q)
{
     b40:	55                   	push   %ebp
     b41:	89 e5                	mov    %esp,%ebp
     b43:	56                   	push   %esi
     b44:	53                   	push   %ebx
     b45:	8b 55 08             	mov    0x8(%ebp),%edx
     b48:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  while(*p && *p == *q)
     b4b:	0f b6 02             	movzbl (%edx),%eax
     b4e:	0f b6 19             	movzbl (%ecx),%ebx
     b51:	84 c0                	test   %al,%al
     b53:	75 1e                	jne    b73 <strcmp+0x33>
     b55:	eb 29                	jmp    b80 <strcmp+0x40>
     b57:	89 f6                	mov    %esi,%esi
     b59:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    p++, q++;
     b60:	83 c2 01             	add    $0x1,%edx
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
     b63:	0f b6 02             	movzbl (%edx),%eax
    p++, q++;
     b66:	8d 71 01             	lea    0x1(%ecx),%esi
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
     b69:	0f b6 59 01          	movzbl 0x1(%ecx),%ebx
     b6d:	84 c0                	test   %al,%al
     b6f:	74 0f                	je     b80 <strcmp+0x40>
     b71:	89 f1                	mov    %esi,%ecx
     b73:	38 d8                	cmp    %bl,%al
     b75:	74 e9                	je     b60 <strcmp+0x20>
    p++, q++;
  return (uchar)*p - (uchar)*q;
     b77:	29 d8                	sub    %ebx,%eax
}
     b79:	5b                   	pop    %ebx
     b7a:	5e                   	pop    %esi
     b7b:	5d                   	pop    %ebp
     b7c:	c3                   	ret    
     b7d:	8d 76 00             	lea    0x0(%esi),%esi
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
     b80:	31 c0                	xor    %eax,%eax
    p++, q++;
  return (uchar)*p - (uchar)*q;
     b82:	29 d8                	sub    %ebx,%eax
}
     b84:	5b                   	pop    %ebx
     b85:	5e                   	pop    %esi
     b86:	5d                   	pop    %ebp
     b87:	c3                   	ret    
     b88:	90                   	nop
     b89:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000b90 <strlen>:

uint
strlen(const char *s)
{
     b90:	55                   	push   %ebp
     b91:	89 e5                	mov    %esp,%ebp
     b93:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
     b96:	80 39 00             	cmpb   $0x0,(%ecx)
     b99:	74 12                	je     bad <strlen+0x1d>
     b9b:	31 d2                	xor    %edx,%edx
     b9d:	8d 76 00             	lea    0x0(%esi),%esi
     ba0:	83 c2 01             	add    $0x1,%edx
     ba3:	80 3c 11 00          	cmpb   $0x0,(%ecx,%edx,1)
     ba7:	89 d0                	mov    %edx,%eax
     ba9:	75 f5                	jne    ba0 <strlen+0x10>
    ;
  return n;
}
     bab:	5d                   	pop    %ebp
     bac:	c3                   	ret    
uint
strlen(const char *s)
{
  int n;

  for(n = 0; s[n]; n++)
     bad:	31 c0                	xor    %eax,%eax
    ;
  return n;
}
     baf:	5d                   	pop    %ebp
     bb0:	c3                   	ret    
     bb1:	eb 0d                	jmp    bc0 <memset>
     bb3:	90                   	nop
     bb4:	90                   	nop
     bb5:	90                   	nop
     bb6:	90                   	nop
     bb7:	90                   	nop
     bb8:	90                   	nop
     bb9:	90                   	nop
     bba:	90                   	nop
     bbb:	90                   	nop
     bbc:	90                   	nop
     bbd:	90                   	nop
     bbe:	90                   	nop
     bbf:	90                   	nop

00000bc0 <memset>:

void*
memset(void *dst, int c, uint n)
{
     bc0:	55                   	push   %ebp
     bc1:	89 e5                	mov    %esp,%ebp
     bc3:	57                   	push   %edi
     bc4:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
     bc7:	8b 4d 10             	mov    0x10(%ebp),%ecx
     bca:	8b 45 0c             	mov    0xc(%ebp),%eax
     bcd:	89 d7                	mov    %edx,%edi
     bcf:	fc                   	cld    
     bd0:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
     bd2:	89 d0                	mov    %edx,%eax
     bd4:	5f                   	pop    %edi
     bd5:	5d                   	pop    %ebp
     bd6:	c3                   	ret    
     bd7:	89 f6                	mov    %esi,%esi
     bd9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000be0 <strchr>:

char*
strchr(const char *s, char c)
{
     be0:	55                   	push   %ebp
     be1:	89 e5                	mov    %esp,%ebp
     be3:	53                   	push   %ebx
     be4:	8b 45 08             	mov    0x8(%ebp),%eax
     be7:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  for(; *s; s++)
     bea:	0f b6 10             	movzbl (%eax),%edx
     bed:	84 d2                	test   %dl,%dl
     bef:	74 1d                	je     c0e <strchr+0x2e>
    if(*s == c)
     bf1:	38 d3                	cmp    %dl,%bl
     bf3:	89 d9                	mov    %ebx,%ecx
     bf5:	75 0d                	jne    c04 <strchr+0x24>
     bf7:	eb 17                	jmp    c10 <strchr+0x30>
     bf9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     c00:	38 ca                	cmp    %cl,%dl
     c02:	74 0c                	je     c10 <strchr+0x30>
}

char*
strchr(const char *s, char c)
{
  for(; *s; s++)
     c04:	83 c0 01             	add    $0x1,%eax
     c07:	0f b6 10             	movzbl (%eax),%edx
     c0a:	84 d2                	test   %dl,%dl
     c0c:	75 f2                	jne    c00 <strchr+0x20>
    if(*s == c)
      return (char*)s;
  return 0;
     c0e:	31 c0                	xor    %eax,%eax
}
     c10:	5b                   	pop    %ebx
     c11:	5d                   	pop    %ebp
     c12:	c3                   	ret    
     c13:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
     c19:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000c20 <gets>:

char*
gets(char *buf, int max)
{
     c20:	55                   	push   %ebp
     c21:	89 e5                	mov    %esp,%ebp
     c23:	57                   	push   %edi
     c24:	56                   	push   %esi
     c25:	53                   	push   %ebx
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
     c26:	31 f6                	xor    %esi,%esi
    cc = read(0, &c, 1);
     c28:	8d 7d e7             	lea    -0x19(%ebp),%edi
  return 0;
}

char*
gets(char *buf, int max)
{
     c2b:	83 ec 1c             	sub    $0x1c,%esp
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
     c2e:	eb 29                	jmp    c59 <gets+0x39>
    cc = read(0, &c, 1);
     c30:	83 ec 04             	sub    $0x4,%esp
     c33:	6a 01                	push   $0x1
     c35:	57                   	push   %edi
     c36:	6a 00                	push   $0x0
     c38:	e8 2d 01 00 00       	call   d6a <read>
    if(cc < 1)
     c3d:	83 c4 10             	add    $0x10,%esp
     c40:	85 c0                	test   %eax,%eax
     c42:	7e 1d                	jle    c61 <gets+0x41>
      break;
    buf[i++] = c;
     c44:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
     c48:	8b 55 08             	mov    0x8(%ebp),%edx
     c4b:	89 de                	mov    %ebx,%esi
    if(c == '\n' || c == '\r')
     c4d:	3c 0a                	cmp    $0xa,%al

  for(i=0; i+1 < max; ){
    cc = read(0, &c, 1);
    if(cc < 1)
      break;
    buf[i++] = c;
     c4f:	88 44 1a ff          	mov    %al,-0x1(%edx,%ebx,1)
    if(c == '\n' || c == '\r')
     c53:	74 1b                	je     c70 <gets+0x50>
     c55:	3c 0d                	cmp    $0xd,%al
     c57:	74 17                	je     c70 <gets+0x50>
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
     c59:	8d 5e 01             	lea    0x1(%esi),%ebx
     c5c:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
     c5f:	7c cf                	jl     c30 <gets+0x10>
      break;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
     c61:	8b 45 08             	mov    0x8(%ebp),%eax
     c64:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
  return buf;
}
     c68:	8d 65 f4             	lea    -0xc(%ebp),%esp
     c6b:	5b                   	pop    %ebx
     c6c:	5e                   	pop    %esi
     c6d:	5f                   	pop    %edi
     c6e:	5d                   	pop    %ebp
     c6f:	c3                   	ret    
      break;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
     c70:	8b 45 08             	mov    0x8(%ebp),%eax
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
     c73:	89 de                	mov    %ebx,%esi
      break;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
     c75:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
  return buf;
}
     c79:	8d 65 f4             	lea    -0xc(%ebp),%esp
     c7c:	5b                   	pop    %ebx
     c7d:	5e                   	pop    %esi
     c7e:	5f                   	pop    %edi
     c7f:	5d                   	pop    %ebp
     c80:	c3                   	ret    
     c81:	eb 0d                	jmp    c90 <stat>
     c83:	90                   	nop
     c84:	90                   	nop
     c85:	90                   	nop
     c86:	90                   	nop
     c87:	90                   	nop
     c88:	90                   	nop
     c89:	90                   	nop
     c8a:	90                   	nop
     c8b:	90                   	nop
     c8c:	90                   	nop
     c8d:	90                   	nop
     c8e:	90                   	nop
     c8f:	90                   	nop

00000c90 <stat>:

int
stat(const char *n, struct stat *st)
{
     c90:	55                   	push   %ebp
     c91:	89 e5                	mov    %esp,%ebp
     c93:	56                   	push   %esi
     c94:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
     c95:	83 ec 08             	sub    $0x8,%esp
     c98:	6a 00                	push   $0x0
     c9a:	ff 75 08             	pushl  0x8(%ebp)
     c9d:	e8 f0 00 00 00       	call   d92 <open>
  if(fd < 0)
     ca2:	83 c4 10             	add    $0x10,%esp
     ca5:	85 c0                	test   %eax,%eax
     ca7:	78 27                	js     cd0 <stat+0x40>
    return -1;
  r = fstat(fd, st);
     ca9:	83 ec 08             	sub    $0x8,%esp
     cac:	ff 75 0c             	pushl  0xc(%ebp)
     caf:	89 c3                	mov    %eax,%ebx
     cb1:	50                   	push   %eax
     cb2:	e8 f3 00 00 00       	call   daa <fstat>
     cb7:	89 c6                	mov    %eax,%esi
  close(fd);
     cb9:	89 1c 24             	mov    %ebx,(%esp)
     cbc:	e8 b9 00 00 00       	call   d7a <close>
  return r;
     cc1:	83 c4 10             	add    $0x10,%esp
     cc4:	89 f0                	mov    %esi,%eax
}
     cc6:	8d 65 f8             	lea    -0x8(%ebp),%esp
     cc9:	5b                   	pop    %ebx
     cca:	5e                   	pop    %esi
     ccb:	5d                   	pop    %ebp
     ccc:	c3                   	ret    
     ccd:	8d 76 00             	lea    0x0(%esi),%esi
  int fd;
  int r;

  fd = open(n, O_RDONLY);
  if(fd < 0)
    return -1;
     cd0:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
     cd5:	eb ef                	jmp    cc6 <stat+0x36>
     cd7:	89 f6                	mov    %esi,%esi
     cd9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000ce0 <atoi>:
  return r;
}

int
atoi(const char *s)
{
     ce0:	55                   	push   %ebp
     ce1:	89 e5                	mov    %esp,%ebp
     ce3:	53                   	push   %ebx
     ce4:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
     ce7:	0f be 11             	movsbl (%ecx),%edx
     cea:	8d 42 d0             	lea    -0x30(%edx),%eax
     ced:	3c 09                	cmp    $0x9,%al
     cef:	b8 00 00 00 00       	mov    $0x0,%eax
     cf4:	77 1f                	ja     d15 <atoi+0x35>
     cf6:	8d 76 00             	lea    0x0(%esi),%esi
     cf9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    n = n*10 + *s++ - '0';
     d00:	8d 04 80             	lea    (%eax,%eax,4),%eax
     d03:	83 c1 01             	add    $0x1,%ecx
     d06:	8d 44 42 d0          	lea    -0x30(%edx,%eax,2),%eax
atoi(const char *s)
{
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
     d0a:	0f be 11             	movsbl (%ecx),%edx
     d0d:	8d 5a d0             	lea    -0x30(%edx),%ebx
     d10:	80 fb 09             	cmp    $0x9,%bl
     d13:	76 eb                	jbe    d00 <atoi+0x20>
    n = n*10 + *s++ - '0';
  return n;
}
     d15:	5b                   	pop    %ebx
     d16:	5d                   	pop    %ebp
     d17:	c3                   	ret    
     d18:	90                   	nop
     d19:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000d20 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
     d20:	55                   	push   %ebp
     d21:	89 e5                	mov    %esp,%ebp
     d23:	56                   	push   %esi
     d24:	53                   	push   %ebx
     d25:	8b 5d 10             	mov    0x10(%ebp),%ebx
     d28:	8b 45 08             	mov    0x8(%ebp),%eax
     d2b:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
     d2e:	85 db                	test   %ebx,%ebx
     d30:	7e 14                	jle    d46 <memmove+0x26>
     d32:	31 d2                	xor    %edx,%edx
     d34:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    *dst++ = *src++;
     d38:	0f b6 0c 16          	movzbl (%esi,%edx,1),%ecx
     d3c:	88 0c 10             	mov    %cl,(%eax,%edx,1)
     d3f:	83 c2 01             	add    $0x1,%edx
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
     d42:	39 da                	cmp    %ebx,%edx
     d44:	75 f2                	jne    d38 <memmove+0x18>
    *dst++ = *src++;
  return vdst;
}
     d46:	5b                   	pop    %ebx
     d47:	5e                   	pop    %esi
     d48:	5d                   	pop    %ebp
     d49:	c3                   	ret    

00000d4a <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
     d4a:	b8 01 00 00 00       	mov    $0x1,%eax
     d4f:	cd 40                	int    $0x40
     d51:	c3                   	ret    

00000d52 <exit>:
SYSCALL(exit)
     d52:	b8 02 00 00 00       	mov    $0x2,%eax
     d57:	cd 40                	int    $0x40
     d59:	c3                   	ret    

00000d5a <wait>:
SYSCALL(wait)
     d5a:	b8 03 00 00 00       	mov    $0x3,%eax
     d5f:	cd 40                	int    $0x40
     d61:	c3                   	ret    

00000d62 <pipe>:
SYSCALL(pipe)
     d62:	b8 04 00 00 00       	mov    $0x4,%eax
     d67:	cd 40                	int    $0x40
     d69:	c3                   	ret    

00000d6a <read>:
SYSCALL(read)
     d6a:	b8 05 00 00 00       	mov    $0x5,%eax
     d6f:	cd 40                	int    $0x40
     d71:	c3                   	ret    

00000d72 <write>:
SYSCALL(write)
     d72:	b8 10 00 00 00       	mov    $0x10,%eax
     d77:	cd 40                	int    $0x40
     d79:	c3                   	ret    

00000d7a <close>:
SYSCALL(close)
     d7a:	b8 15 00 00 00       	mov    $0x15,%eax
     d7f:	cd 40                	int    $0x40
     d81:	c3                   	ret    

00000d82 <kill>:
SYSCALL(kill)
     d82:	b8 06 00 00 00       	mov    $0x6,%eax
     d87:	cd 40                	int    $0x40
     d89:	c3                   	ret    

00000d8a <exec>:
SYSCALL(exec)
     d8a:	b8 07 00 00 00       	mov    $0x7,%eax
     d8f:	cd 40                	int    $0x40
     d91:	c3                   	ret    

00000d92 <open>:
SYSCALL(open)
     d92:	b8 0f 00 00 00       	mov    $0xf,%eax
     d97:	cd 40                	int    $0x40
     d99:	c3                   	ret    

00000d9a <mknod>:
SYSCALL(mknod)
     d9a:	b8 11 00 00 00       	mov    $0x11,%eax
     d9f:	cd 40                	int    $0x40
     da1:	c3                   	ret    

00000da2 <unlink>:
SYSCALL(unlink)
     da2:	b8 12 00 00 00       	mov    $0x12,%eax
     da7:	cd 40                	int    $0x40
     da9:	c3                   	ret    

00000daa <fstat>:
SYSCALL(fstat)
     daa:	b8 08 00 00 00       	mov    $0x8,%eax
     daf:	cd 40                	int    $0x40
     db1:	c3                   	ret    

00000db2 <link>:
SYSCALL(link)
     db2:	b8 13 00 00 00       	mov    $0x13,%eax
     db7:	cd 40                	int    $0x40
     db9:	c3                   	ret    

00000dba <mkdir>:
SYSCALL(mkdir)
     dba:	b8 14 00 00 00       	mov    $0x14,%eax
     dbf:	cd 40                	int    $0x40
     dc1:	c3                   	ret    

00000dc2 <chdir>:
SYSCALL(chdir)
     dc2:	b8 09 00 00 00       	mov    $0x9,%eax
     dc7:	cd 40                	int    $0x40
     dc9:	c3                   	ret    

00000dca <dup>:
SYSCALL(dup)
     dca:	b8 0a 00 00 00       	mov    $0xa,%eax
     dcf:	cd 40                	int    $0x40
     dd1:	c3                   	ret    

00000dd2 <getpid>:
SYSCALL(getpid)
     dd2:	b8 0b 00 00 00       	mov    $0xb,%eax
     dd7:	cd 40                	int    $0x40
     dd9:	c3                   	ret    

00000dda <sbrk>:
SYSCALL(sbrk)
     dda:	b8 0c 00 00 00       	mov    $0xc,%eax
     ddf:	cd 40                	int    $0x40
     de1:	c3                   	ret    

00000de2 <sleep>:
SYSCALL(sleep)
     de2:	b8 0d 00 00 00       	mov    $0xd,%eax
     de7:	cd 40                	int    $0x40
     de9:	c3                   	ret    

00000dea <uptime>:
SYSCALL(uptime)
     dea:	b8 0e 00 00 00       	mov    $0xe,%eax
     def:	cd 40                	int    $0x40
     df1:	c3                   	ret    

00000df2 <waitpid>:
SYSCALL(waitpid)
     df2:	b8 16 00 00 00       	mov    $0x16,%eax
     df7:	cd 40                	int    $0x40
     df9:	c3                   	ret    

00000dfa <setpriority>:
     dfa:	b8 17 00 00 00       	mov    $0x17,%eax
     dff:	cd 40                	int    $0x40
     e01:	c3                   	ret    
     e02:	66 90                	xchg   %ax,%ax
     e04:	66 90                	xchg   %ax,%ax
     e06:	66 90                	xchg   %ax,%ax
     e08:	66 90                	xchg   %ax,%ax
     e0a:	66 90                	xchg   %ax,%ax
     e0c:	66 90                	xchg   %ax,%ax
     e0e:	66 90                	xchg   %ax,%ax

00000e10 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
     e10:	55                   	push   %ebp
     e11:	89 e5                	mov    %esp,%ebp
     e13:	57                   	push   %edi
     e14:	56                   	push   %esi
     e15:	53                   	push   %ebx
     e16:	89 c6                	mov    %eax,%esi
     e18:	83 ec 3c             	sub    $0x3c,%esp
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
     e1b:	8b 5d 08             	mov    0x8(%ebp),%ebx
     e1e:	85 db                	test   %ebx,%ebx
     e20:	74 7e                	je     ea0 <printint+0x90>
     e22:	89 d0                	mov    %edx,%eax
     e24:	c1 e8 1f             	shr    $0x1f,%eax
     e27:	84 c0                	test   %al,%al
     e29:	74 75                	je     ea0 <printint+0x90>
    neg = 1;
    x = -xx;
     e2b:	89 d0                	mov    %edx,%eax
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
     e2d:	c7 45 c4 01 00 00 00 	movl   $0x1,-0x3c(%ebp)
    x = -xx;
     e34:	f7 d8                	neg    %eax
     e36:	89 75 c0             	mov    %esi,-0x40(%ebp)
  } else {
    x = xx;
  }

  i = 0;
     e39:	31 ff                	xor    %edi,%edi
     e3b:	8d 5d d7             	lea    -0x29(%ebp),%ebx
     e3e:	89 ce                	mov    %ecx,%esi
     e40:	eb 08                	jmp    e4a <printint+0x3a>
     e42:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  do{
    buf[i++] = digits[x % base];
     e48:	89 cf                	mov    %ecx,%edi
     e4a:	31 d2                	xor    %edx,%edx
     e4c:	8d 4f 01             	lea    0x1(%edi),%ecx
     e4f:	f7 f6                	div    %esi
     e51:	0f b6 92 c0 12 00 00 	movzbl 0x12c0(%edx),%edx
  }while((x /= base) != 0);
     e58:	85 c0                	test   %eax,%eax
    x = xx;
  }

  i = 0;
  do{
    buf[i++] = digits[x % base];
     e5a:	88 14 0b             	mov    %dl,(%ebx,%ecx,1)
  }while((x /= base) != 0);
     e5d:	75 e9                	jne    e48 <printint+0x38>
  if(neg)
     e5f:	8b 45 c4             	mov    -0x3c(%ebp),%eax
     e62:	8b 75 c0             	mov    -0x40(%ebp),%esi
     e65:	85 c0                	test   %eax,%eax
     e67:	74 08                	je     e71 <printint+0x61>
    buf[i++] = '-';
     e69:	c6 44 0d d8 2d       	movb   $0x2d,-0x28(%ebp,%ecx,1)
     e6e:	8d 4f 02             	lea    0x2(%edi),%ecx
     e71:	8d 7c 0d d7          	lea    -0x29(%ebp,%ecx,1),%edi
     e75:	8d 76 00             	lea    0x0(%esi),%esi
     e78:	0f b6 07             	movzbl (%edi),%eax
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
     e7b:	83 ec 04             	sub    $0x4,%esp
     e7e:	83 ef 01             	sub    $0x1,%edi
     e81:	6a 01                	push   $0x1
     e83:	53                   	push   %ebx
     e84:	56                   	push   %esi
     e85:	88 45 d7             	mov    %al,-0x29(%ebp)
     e88:	e8 e5 fe ff ff       	call   d72 <write>
    buf[i++] = digits[x % base];
  }while((x /= base) != 0);
  if(neg)
    buf[i++] = '-';

  while(--i >= 0)
     e8d:	83 c4 10             	add    $0x10,%esp
     e90:	39 df                	cmp    %ebx,%edi
     e92:	75 e4                	jne    e78 <printint+0x68>
    putc(fd, buf[i]);
}
     e94:	8d 65 f4             	lea    -0xc(%ebp),%esp
     e97:	5b                   	pop    %ebx
     e98:	5e                   	pop    %esi
     e99:	5f                   	pop    %edi
     e9a:	5d                   	pop    %ebp
     e9b:	c3                   	ret    
     e9c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
    x = -xx;
  } else {
    x = xx;
     ea0:	89 d0                	mov    %edx,%eax
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
     ea2:	c7 45 c4 00 00 00 00 	movl   $0x0,-0x3c(%ebp)
     ea9:	eb 8b                	jmp    e36 <printint+0x26>
     eab:	90                   	nop
     eac:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000eb0 <printf>:
}

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
     eb0:	55                   	push   %ebp
     eb1:	89 e5                	mov    %esp,%ebp
     eb3:	57                   	push   %edi
     eb4:	56                   	push   %esi
     eb5:	53                   	push   %ebx
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
     eb6:	8d 45 10             	lea    0x10(%ebp),%eax
}

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
     eb9:	83 ec 2c             	sub    $0x2c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
     ebc:	8b 75 0c             	mov    0xc(%ebp),%esi
}

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
     ebf:	8b 7d 08             	mov    0x8(%ebp),%edi
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
     ec2:	89 45 d0             	mov    %eax,-0x30(%ebp)
     ec5:	0f b6 1e             	movzbl (%esi),%ebx
     ec8:	83 c6 01             	add    $0x1,%esi
     ecb:	84 db                	test   %bl,%bl
     ecd:	0f 84 b0 00 00 00    	je     f83 <printf+0xd3>
     ed3:	31 d2                	xor    %edx,%edx
     ed5:	eb 39                	jmp    f10 <printf+0x60>
     ed7:	89 f6                	mov    %esi,%esi
     ed9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
     ee0:	83 f8 25             	cmp    $0x25,%eax
     ee3:	89 55 d4             	mov    %edx,-0x2c(%ebp)
        state = '%';
     ee6:	ba 25 00 00 00       	mov    $0x25,%edx
  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
     eeb:	74 18                	je     f05 <printf+0x55>
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
     eed:	8d 45 e2             	lea    -0x1e(%ebp),%eax
     ef0:	83 ec 04             	sub    $0x4,%esp
     ef3:	88 5d e2             	mov    %bl,-0x1e(%ebp)
     ef6:	6a 01                	push   $0x1
     ef8:	50                   	push   %eax
     ef9:	57                   	push   %edi
     efa:	e8 73 fe ff ff       	call   d72 <write>
     eff:	8b 55 d4             	mov    -0x2c(%ebp),%edx
     f02:	83 c4 10             	add    $0x10,%esp
     f05:	83 c6 01             	add    $0x1,%esi
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
     f08:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
     f0c:	84 db                	test   %bl,%bl
     f0e:	74 73                	je     f83 <printf+0xd3>
    c = fmt[i] & 0xff;
    if(state == 0){
     f10:	85 d2                	test   %edx,%edx
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    c = fmt[i] & 0xff;
     f12:	0f be cb             	movsbl %bl,%ecx
     f15:	0f b6 c3             	movzbl %bl,%eax
    if(state == 0){
     f18:	74 c6                	je     ee0 <printf+0x30>
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
     f1a:	83 fa 25             	cmp    $0x25,%edx
     f1d:	75 e6                	jne    f05 <printf+0x55>
      if(c == 'd'){
     f1f:	83 f8 64             	cmp    $0x64,%eax
     f22:	0f 84 f8 00 00 00    	je     1020 <printf+0x170>
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
     f28:	81 e1 f7 00 00 00    	and    $0xf7,%ecx
     f2e:	83 f9 70             	cmp    $0x70,%ecx
     f31:	74 5d                	je     f90 <printf+0xe0>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
     f33:	83 f8 73             	cmp    $0x73,%eax
     f36:	0f 84 84 00 00 00    	je     fc0 <printf+0x110>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
     f3c:	83 f8 63             	cmp    $0x63,%eax
     f3f:	0f 84 ea 00 00 00    	je     102f <printf+0x17f>
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
     f45:	83 f8 25             	cmp    $0x25,%eax
     f48:	0f 84 c2 00 00 00    	je     1010 <printf+0x160>
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
     f4e:	8d 45 e7             	lea    -0x19(%ebp),%eax
     f51:	83 ec 04             	sub    $0x4,%esp
     f54:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
     f58:	6a 01                	push   $0x1
     f5a:	50                   	push   %eax
     f5b:	57                   	push   %edi
     f5c:	e8 11 fe ff ff       	call   d72 <write>
     f61:	83 c4 0c             	add    $0xc,%esp
     f64:	8d 45 e6             	lea    -0x1a(%ebp),%eax
     f67:	88 5d e6             	mov    %bl,-0x1a(%ebp)
     f6a:	6a 01                	push   $0x1
     f6c:	50                   	push   %eax
     f6d:	57                   	push   %edi
     f6e:	83 c6 01             	add    $0x1,%esi
     f71:	e8 fc fd ff ff       	call   d72 <write>
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
     f76:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
     f7a:	83 c4 10             	add    $0x10,%esp
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
     f7d:	31 d2                	xor    %edx,%edx
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
     f7f:	84 db                	test   %bl,%bl
     f81:	75 8d                	jne    f10 <printf+0x60>
        putc(fd, c);
      }
      state = 0;
    }
  }
}
     f83:	8d 65 f4             	lea    -0xc(%ebp),%esp
     f86:	5b                   	pop    %ebx
     f87:	5e                   	pop    %esi
     f88:	5f                   	pop    %edi
     f89:	5d                   	pop    %ebp
     f8a:	c3                   	ret    
     f8b:	90                   	nop
     f8c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    } else if(state == '%'){
      if(c == 'd'){
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
        printint(fd, *ap, 16, 0);
     f90:	83 ec 0c             	sub    $0xc,%esp
     f93:	b9 10 00 00 00       	mov    $0x10,%ecx
     f98:	6a 00                	push   $0x0
     f9a:	8b 5d d0             	mov    -0x30(%ebp),%ebx
     f9d:	89 f8                	mov    %edi,%eax
     f9f:	8b 13                	mov    (%ebx),%edx
     fa1:	e8 6a fe ff ff       	call   e10 <printint>
        ap++;
     fa6:	89 d8                	mov    %ebx,%eax
     fa8:	83 c4 10             	add    $0x10,%esp
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
     fab:	31 d2                	xor    %edx,%edx
      if(c == 'd'){
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
        printint(fd, *ap, 16, 0);
        ap++;
     fad:	83 c0 04             	add    $0x4,%eax
     fb0:	89 45 d0             	mov    %eax,-0x30(%ebp)
     fb3:	e9 4d ff ff ff       	jmp    f05 <printf+0x55>
     fb8:	90                   	nop
     fb9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      } else if(c == 's'){
        s = (char*)*ap;
     fc0:	8b 45 d0             	mov    -0x30(%ebp),%eax
     fc3:	8b 18                	mov    (%eax),%ebx
        ap++;
     fc5:	83 c0 04             	add    $0x4,%eax
     fc8:	89 45 d0             	mov    %eax,-0x30(%ebp)
        if(s == 0)
          s = "(null)";
     fcb:	b8 b8 12 00 00       	mov    $0x12b8,%eax
     fd0:	85 db                	test   %ebx,%ebx
     fd2:	0f 44 d8             	cmove  %eax,%ebx
        while(*s != 0){
     fd5:	0f b6 03             	movzbl (%ebx),%eax
     fd8:	84 c0                	test   %al,%al
     fda:	74 23                	je     fff <printf+0x14f>
     fdc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
     fe0:	88 45 e3             	mov    %al,-0x1d(%ebp)
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
     fe3:	8d 45 e3             	lea    -0x1d(%ebp),%eax
     fe6:	83 ec 04             	sub    $0x4,%esp
     fe9:	6a 01                	push   $0x1
        ap++;
        if(s == 0)
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
     feb:	83 c3 01             	add    $0x1,%ebx
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
     fee:	50                   	push   %eax
     fef:	57                   	push   %edi
     ff0:	e8 7d fd ff ff       	call   d72 <write>
      } else if(c == 's'){
        s = (char*)*ap;
        ap++;
        if(s == 0)
          s = "(null)";
        while(*s != 0){
     ff5:	0f b6 03             	movzbl (%ebx),%eax
     ff8:	83 c4 10             	add    $0x10,%esp
     ffb:	84 c0                	test   %al,%al
     ffd:	75 e1                	jne    fe0 <printf+0x130>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
     fff:	31 d2                	xor    %edx,%edx
    1001:	e9 ff fe ff ff       	jmp    f05 <printf+0x55>
    1006:	8d 76 00             	lea    0x0(%esi),%esi
    1009:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
    1010:	83 ec 04             	sub    $0x4,%esp
    1013:	88 5d e5             	mov    %bl,-0x1b(%ebp)
    1016:	8d 45 e5             	lea    -0x1b(%ebp),%eax
    1019:	6a 01                	push   $0x1
    101b:	e9 4c ff ff ff       	jmp    f6c <printf+0xbc>
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
      if(c == 'd'){
        printint(fd, *ap, 10, 1);
    1020:	83 ec 0c             	sub    $0xc,%esp
    1023:	b9 0a 00 00 00       	mov    $0xa,%ecx
    1028:	6a 01                	push   $0x1
    102a:	e9 6b ff ff ff       	jmp    f9a <printf+0xea>
    102f:	8b 5d d0             	mov    -0x30(%ebp),%ebx
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
    1032:	83 ec 04             	sub    $0x4,%esp
    1035:	8b 03                	mov    (%ebx),%eax
    1037:	6a 01                	push   $0x1
    1039:	88 45 e4             	mov    %al,-0x1c(%ebp)
    103c:	8d 45 e4             	lea    -0x1c(%ebp),%eax
    103f:	50                   	push   %eax
    1040:	57                   	push   %edi
    1041:	e8 2c fd ff ff       	call   d72 <write>
    1046:	e9 5b ff ff ff       	jmp    fa6 <printf+0xf6>
    104b:	66 90                	xchg   %ax,%ax
    104d:	66 90                	xchg   %ax,%ax
    104f:	90                   	nop

00001050 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
    1050:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    1051:	a1 04 19 00 00       	mov    0x1904,%eax
static Header base;
static Header *freep;

void
free(void *ap)
{
    1056:	89 e5                	mov    %esp,%ebp
    1058:	57                   	push   %edi
    1059:	56                   	push   %esi
    105a:	53                   	push   %ebx
    105b:	8b 5d 08             	mov    0x8(%ebp),%ebx
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    105e:	8b 10                	mov    (%eax),%edx
void
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
    1060:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    1063:	39 c8                	cmp    %ecx,%eax
    1065:	73 19                	jae    1080 <free+0x30>
    1067:	89 f6                	mov    %esi,%esi
    1069:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    1070:	39 d1                	cmp    %edx,%ecx
    1072:	72 1c                	jb     1090 <free+0x40>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    1074:	39 d0                	cmp    %edx,%eax
    1076:	73 18                	jae    1090 <free+0x40>
static Header base;
static Header *freep;

void
free(void *ap)
{
    1078:	89 d0                	mov    %edx,%eax
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    107a:	39 c8                	cmp    %ecx,%eax
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    107c:	8b 10                	mov    (%eax),%edx
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    107e:	72 f0                	jb     1070 <free+0x20>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    1080:	39 d0                	cmp    %edx,%eax
    1082:	72 f4                	jb     1078 <free+0x28>
    1084:	39 d1                	cmp    %edx,%ecx
    1086:	73 f0                	jae    1078 <free+0x28>
    1088:	90                   	nop
    1089:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      break;
  if(bp + bp->s.size == p->s.ptr){
    1090:	8b 73 fc             	mov    -0x4(%ebx),%esi
    1093:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
    1096:	39 d7                	cmp    %edx,%edi
    1098:	74 19                	je     10b3 <free+0x63>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
    109a:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
    109d:	8b 50 04             	mov    0x4(%eax),%edx
    10a0:	8d 34 d0             	lea    (%eax,%edx,8),%esi
    10a3:	39 f1                	cmp    %esi,%ecx
    10a5:	74 23                	je     10ca <free+0x7a>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
    10a7:	89 08                	mov    %ecx,(%eax)
  freep = p;
    10a9:	a3 04 19 00 00       	mov    %eax,0x1904
}
    10ae:	5b                   	pop    %ebx
    10af:	5e                   	pop    %esi
    10b0:	5f                   	pop    %edi
    10b1:	5d                   	pop    %ebp
    10b2:	c3                   	ret    
  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
    bp->s.size += p->s.ptr->s.size;
    10b3:	03 72 04             	add    0x4(%edx),%esi
    10b6:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
    10b9:	8b 10                	mov    (%eax),%edx
    10bb:	8b 12                	mov    (%edx),%edx
    10bd:	89 53 f8             	mov    %edx,-0x8(%ebx)
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
    10c0:	8b 50 04             	mov    0x4(%eax),%edx
    10c3:	8d 34 d0             	lea    (%eax,%edx,8),%esi
    10c6:	39 f1                	cmp    %esi,%ecx
    10c8:	75 dd                	jne    10a7 <free+0x57>
    p->s.size += bp->s.size;
    10ca:	03 53 fc             	add    -0x4(%ebx),%edx
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
  freep = p;
    10cd:	a3 04 19 00 00       	mov    %eax,0x1904
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
    p->s.size += bp->s.size;
    10d2:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
    10d5:	8b 53 f8             	mov    -0x8(%ebx),%edx
    10d8:	89 10                	mov    %edx,(%eax)
  } else
    p->s.ptr = bp;
  freep = p;
}
    10da:	5b                   	pop    %ebx
    10db:	5e                   	pop    %esi
    10dc:	5f                   	pop    %edi
    10dd:	5d                   	pop    %ebp
    10de:	c3                   	ret    
    10df:	90                   	nop

000010e0 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
    10e0:	55                   	push   %ebp
    10e1:	89 e5                	mov    %esp,%ebp
    10e3:	57                   	push   %edi
    10e4:	56                   	push   %esi
    10e5:	53                   	push   %ebx
    10e6:	83 ec 0c             	sub    $0xc,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
    10e9:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
    10ec:	8b 15 04 19 00 00    	mov    0x1904,%edx
malloc(uint nbytes)
{
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
    10f2:	8d 78 07             	lea    0x7(%eax),%edi
    10f5:	c1 ef 03             	shr    $0x3,%edi
    10f8:	83 c7 01             	add    $0x1,%edi
  if((prevp = freep) == 0){
    10fb:	85 d2                	test   %edx,%edx
    10fd:	0f 84 a3 00 00 00    	je     11a6 <malloc+0xc6>
    1103:	8b 02                	mov    (%edx),%eax
    1105:	8b 48 04             	mov    0x4(%eax),%ecx
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
    1108:	39 cf                	cmp    %ecx,%edi
    110a:	76 74                	jbe    1180 <malloc+0xa0>
    110c:	81 ff 00 10 00 00    	cmp    $0x1000,%edi
    1112:	be 00 10 00 00       	mov    $0x1000,%esi
    1117:	8d 1c fd 00 00 00 00 	lea    0x0(,%edi,8),%ebx
    111e:	0f 43 f7             	cmovae %edi,%esi
    1121:	ba 00 80 00 00       	mov    $0x8000,%edx
    1126:	81 ff ff 0f 00 00    	cmp    $0xfff,%edi
    112c:	0f 46 da             	cmovbe %edx,%ebx
    112f:	eb 10                	jmp    1141 <malloc+0x61>
    1131:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    1138:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
    113a:	8b 48 04             	mov    0x4(%eax),%ecx
    113d:	39 cf                	cmp    %ecx,%edi
    113f:	76 3f                	jbe    1180 <malloc+0xa0>
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
    1141:	39 05 04 19 00 00    	cmp    %eax,0x1904
    1147:	89 c2                	mov    %eax,%edx
    1149:	75 ed                	jne    1138 <malloc+0x58>
  char *p;
  Header *hp;

  if(nu < 4096)
    nu = 4096;
  p = sbrk(nu * sizeof(Header));
    114b:	83 ec 0c             	sub    $0xc,%esp
    114e:	53                   	push   %ebx
    114f:	e8 86 fc ff ff       	call   dda <sbrk>
  if(p == (char*)-1)
    1154:	83 c4 10             	add    $0x10,%esp
    1157:	83 f8 ff             	cmp    $0xffffffff,%eax
    115a:	74 1c                	je     1178 <malloc+0x98>
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
    115c:	89 70 04             	mov    %esi,0x4(%eax)
  free((void*)(hp + 1));
    115f:	83 ec 0c             	sub    $0xc,%esp
    1162:	83 c0 08             	add    $0x8,%eax
    1165:	50                   	push   %eax
    1166:	e8 e5 fe ff ff       	call   1050 <free>
  return freep;
    116b:	8b 15 04 19 00 00    	mov    0x1904,%edx
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
    1171:	83 c4 10             	add    $0x10,%esp
    1174:	85 d2                	test   %edx,%edx
    1176:	75 c0                	jne    1138 <malloc+0x58>
        return 0;
    1178:	31 c0                	xor    %eax,%eax
    117a:	eb 1c                	jmp    1198 <malloc+0xb8>
    117c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
    1180:	39 cf                	cmp    %ecx,%edi
    1182:	74 1c                	je     11a0 <malloc+0xc0>
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
    1184:	29 f9                	sub    %edi,%ecx
    1186:	89 48 04             	mov    %ecx,0x4(%eax)
        p += p->s.size;
    1189:	8d 04 c8             	lea    (%eax,%ecx,8),%eax
        p->s.size = nunits;
    118c:	89 78 04             	mov    %edi,0x4(%eax)
      }
      freep = prevp;
    118f:	89 15 04 19 00 00    	mov    %edx,0x1904
      return (void*)(p + 1);
    1195:	83 c0 08             	add    $0x8,%eax
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
    1198:	8d 65 f4             	lea    -0xc(%ebp),%esp
    119b:	5b                   	pop    %ebx
    119c:	5e                   	pop    %esi
    119d:	5f                   	pop    %edi
    119e:	5d                   	pop    %ebp
    119f:	c3                   	ret    
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
        prevp->s.ptr = p->s.ptr;
    11a0:	8b 08                	mov    (%eax),%ecx
    11a2:	89 0a                	mov    %ecx,(%edx)
    11a4:	eb e9                	jmp    118f <malloc+0xaf>
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
    11a6:	c7 05 04 19 00 00 08 	movl   $0x1908,0x1904
    11ad:	19 00 00 
    11b0:	c7 05 08 19 00 00 08 	movl   $0x1908,0x1908
    11b7:	19 00 00 
    base.s.size = 0;
    11ba:	b8 08 19 00 00       	mov    $0x1908,%eax
    11bf:	c7 05 0c 19 00 00 00 	movl   $0x0,0x190c
    11c6:	00 00 00 
    11c9:	e9 3e ff ff ff       	jmp    110c <malloc+0x2c>
