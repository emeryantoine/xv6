
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
       d:	51                   	push   %ecx
       e:	83 ec 04             	sub    $0x4,%esp
  static char buf[100];
  int fd;

  // Ensure that three file descriptors are open.
  while((fd = open("console", O_RDWR)) >= 0){
      11:	eb 0e                	jmp    21 <main+0x21>
      13:	90                   	nop
      14:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    if(fd >= 3){
      18:	83 f8 02             	cmp    $0x2,%eax
      1b:	0f 8f c3 00 00 00    	jg     e4 <main+0xe4>
  while((fd = open("console", O_RDWR)) >= 0){
      21:	83 ec 08             	sub    $0x8,%esp
      24:	6a 02                	push   $0x2
      26:	68 31 12 00 00       	push   $0x1231
      2b:	e8 22 0d 00 00       	call   d52 <open>
      30:	83 c4 10             	add    $0x10,%esp
      33:	85 c0                	test   %eax,%eax
      35:	79 e1                	jns    18 <main+0x18>
      37:	eb 2e                	jmp    67 <main+0x67>
      39:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    }
  }

  // Read and run input commands.
  while(getcmd(buf, sizeof(buf)) >= 0){
    if(buf[0] == 'c' && buf[1] == 'd' && buf[2] == ' '){
      40:	80 3d 42 18 00 00 20 	cmpb   $0x20,0x1842
      47:	74 5d                	je     a6 <main+0xa6>
      49:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
int
fork1(void)
{
  int pid;

  pid = fork();
      50:	e8 b5 0c 00 00       	call   d0a <fork>
  if(pid == -1)
      55:	83 f8 ff             	cmp    $0xffffffff,%eax
      58:	74 3f                	je     99 <main+0x99>
    if(fork1() == 0)
      5a:	85 c0                	test   %eax,%eax
      5c:	0f 84 98 00 00 00    	je     fa <main+0xfa>
    wait();
      62:	e8 b3 0c 00 00       	call   d1a <wait>
  while(getcmd(buf, sizeof(buf)) >= 0){
      67:	83 ec 08             	sub    $0x8,%esp
      6a:	6a 64                	push   $0x64
      6c:	68 40 18 00 00       	push   $0x1840
      71:	e8 9a 00 00 00       	call   110 <getcmd>
      76:	83 c4 10             	add    $0x10,%esp
      79:	85 c0                	test   %eax,%eax
      7b:	78 78                	js     f5 <main+0xf5>
    if(buf[0] == 'c' && buf[1] == 'd' && buf[2] == ' '){
      7d:	80 3d 40 18 00 00 63 	cmpb   $0x63,0x1840
      84:	75 ca                	jne    50 <main+0x50>
      86:	80 3d 41 18 00 00 64 	cmpb   $0x64,0x1841
      8d:	74 b1                	je     40 <main+0x40>
  pid = fork();
      8f:	e8 76 0c 00 00       	call   d0a <fork>
  if(pid == -1)
      94:	83 f8 ff             	cmp    $0xffffffff,%eax
      97:	75 c1                	jne    5a <main+0x5a>
    panic("fork");
      99:	83 ec 0c             	sub    $0xc,%esp
      9c:	68 ba 11 00 00       	push   $0x11ba
      a1:	e8 ba 00 00 00       	call   160 <panic>
      buf[strlen(buf)-1] = 0;  // chop \n
      a6:	83 ec 0c             	sub    $0xc,%esp
      a9:	68 40 18 00 00       	push   $0x1840
      ae:	e8 9d 0a 00 00       	call   b50 <strlen>
      if(chdir(buf+3) < 0)
      b3:	c7 04 24 43 18 00 00 	movl   $0x1843,(%esp)
      buf[strlen(buf)-1] = 0;  // chop \n
      ba:	c6 80 3f 18 00 00 00 	movb   $0x0,0x183f(%eax)
      if(chdir(buf+3) < 0)
      c1:	e8 bc 0c 00 00       	call   d82 <chdir>
      c6:	83 c4 10             	add    $0x10,%esp
      c9:	85 c0                	test   %eax,%eax
      cb:	79 9a                	jns    67 <main+0x67>
        printf(2, "cannot cd %s\n", buf+3);
      cd:	50                   	push   %eax
      ce:	68 43 18 00 00       	push   $0x1843
      d3:	68 39 12 00 00       	push   $0x1239
      d8:	6a 02                	push   $0x2
      da:	e8 91 0d 00 00       	call   e70 <printf>
      df:	83 c4 10             	add    $0x10,%esp
      e2:	eb 83                	jmp    67 <main+0x67>
      close(fd);
      e4:	83 ec 0c             	sub    $0xc,%esp
      e7:	50                   	push   %eax
      e8:	e8 4d 0c 00 00       	call   d3a <close>
      break;
      ed:	83 c4 10             	add    $0x10,%esp
      f0:	e9 72 ff ff ff       	jmp    67 <main+0x67>
  exit();
      f5:	e8 18 0c 00 00       	call   d12 <exit>
      runcmd(parsecmd(buf));
      fa:	83 ec 0c             	sub    $0xc,%esp
      fd:	68 40 18 00 00       	push   $0x1840
     102:	e8 59 09 00 00       	call   a60 <parsecmd>
     107:	89 04 24             	mov    %eax,(%esp)
     10a:	e8 71 00 00 00       	call   180 <runcmd>
     10f:	90                   	nop

00000110 <getcmd>:
{
     110:	55                   	push   %ebp
     111:	89 e5                	mov    %esp,%ebp
     113:	56                   	push   %esi
     114:	53                   	push   %ebx
     115:	8b 75 0c             	mov    0xc(%ebp),%esi
     118:	8b 5d 08             	mov    0x8(%ebp),%ebx
  printf(2, "$ ");
     11b:	83 ec 08             	sub    $0x8,%esp
     11e:	68 90 11 00 00       	push   $0x1190
     123:	6a 02                	push   $0x2
     125:	e8 46 0d 00 00       	call   e70 <printf>
  memset(buf, 0, nbuf);
     12a:	83 c4 0c             	add    $0xc,%esp
     12d:	56                   	push   %esi
     12e:	6a 00                	push   $0x0
     130:	53                   	push   %ebx
     131:	e8 4a 0a 00 00       	call   b80 <memset>
  gets(buf, nbuf);
     136:	58                   	pop    %eax
     137:	5a                   	pop    %edx
     138:	56                   	push   %esi
     139:	53                   	push   %ebx
     13a:	e8 a1 0a 00 00       	call   be0 <gets>
  if(buf[0] == 0) // EOF
     13f:	83 c4 10             	add    $0x10,%esp
     142:	31 c0                	xor    %eax,%eax
     144:	80 3b 00             	cmpb   $0x0,(%ebx)
     147:	0f 94 c0             	sete   %al
}
     14a:	8d 65 f8             	lea    -0x8(%ebp),%esp
  if(buf[0] == 0) // EOF
     14d:	f7 d8                	neg    %eax
}
     14f:	5b                   	pop    %ebx
     150:	5e                   	pop    %esi
     151:	5d                   	pop    %ebp
     152:	c3                   	ret    
     153:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
     159:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000160 <panic>:
{
     160:	55                   	push   %ebp
     161:	89 e5                	mov    %esp,%ebp
     163:	83 ec 0c             	sub    $0xc,%esp
  printf(2, "%s\n", s);
     166:	ff 75 08             	pushl  0x8(%ebp)
     169:	68 2d 12 00 00       	push   $0x122d
     16e:	6a 02                	push   $0x2
     170:	e8 fb 0c 00 00       	call   e70 <printf>
  exit();
     175:	e8 98 0b 00 00       	call   d12 <exit>
     17a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00000180 <runcmd>:
{
     180:	55                   	push   %ebp
     181:	89 e5                	mov    %esp,%ebp
     183:	53                   	push   %ebx
     184:	83 ec 14             	sub    $0x14,%esp
     187:	8b 5d 08             	mov    0x8(%ebp),%ebx
  if(cmd == 0)
     18a:	85 db                	test   %ebx,%ebx
     18c:	74 76                	je     204 <runcmd+0x84>
  switch(cmd->type){
     18e:	83 3b 05             	cmpl   $0x5,(%ebx)
     191:	0f 87 f8 00 00 00    	ja     28f <runcmd+0x10f>
     197:	8b 03                	mov    (%ebx),%eax
     199:	ff 24 85 48 12 00 00 	jmp    *0x1248(,%eax,4)
    if(pipe(p) < 0)
     1a0:	8d 45 f0             	lea    -0x10(%ebp),%eax
     1a3:	83 ec 0c             	sub    $0xc,%esp
     1a6:	50                   	push   %eax
     1a7:	e8 76 0b 00 00       	call   d22 <pipe>
     1ac:	83 c4 10             	add    $0x10,%esp
     1af:	85 c0                	test   %eax,%eax
     1b1:	0f 88 07 01 00 00    	js     2be <runcmd+0x13e>
  pid = fork();
     1b7:	e8 4e 0b 00 00       	call   d0a <fork>
  if(pid == -1)
     1bc:	83 f8 ff             	cmp    $0xffffffff,%eax
     1bf:	0f 84 d7 00 00 00    	je     29c <runcmd+0x11c>
    if(fork1() == 0){
     1c5:	85 c0                	test   %eax,%eax
     1c7:	0f 84 fe 00 00 00    	je     2cb <runcmd+0x14b>
  pid = fork();
     1cd:	e8 38 0b 00 00       	call   d0a <fork>
  if(pid == -1)
     1d2:	83 f8 ff             	cmp    $0xffffffff,%eax
     1d5:	0f 84 c1 00 00 00    	je     29c <runcmd+0x11c>
    if(fork1() == 0){
     1db:	85 c0                	test   %eax,%eax
     1dd:	0f 84 16 01 00 00    	je     2f9 <runcmd+0x179>
    close(p[0]);
     1e3:	83 ec 0c             	sub    $0xc,%esp
     1e6:	ff 75 f0             	pushl  -0x10(%ebp)
     1e9:	e8 4c 0b 00 00       	call   d3a <close>
    close(p[1]);
     1ee:	58                   	pop    %eax
     1ef:	ff 75 f4             	pushl  -0xc(%ebp)
     1f2:	e8 43 0b 00 00       	call   d3a <close>
    wait();
     1f7:	e8 1e 0b 00 00       	call   d1a <wait>
    wait();
     1fc:	e8 19 0b 00 00       	call   d1a <wait>
    break;
     201:	83 c4 10             	add    $0x10,%esp
    exit();
     204:	e8 09 0b 00 00       	call   d12 <exit>
  pid = fork();
     209:	e8 fc 0a 00 00       	call   d0a <fork>
  if(pid == -1)
     20e:	83 f8 ff             	cmp    $0xffffffff,%eax
     211:	0f 84 85 00 00 00    	je     29c <runcmd+0x11c>
    if(fork1() == 0)
     217:	85 c0                	test   %eax,%eax
     219:	75 e9                	jne    204 <runcmd+0x84>
     21b:	eb 49                	jmp    266 <runcmd+0xe6>
    if(ecmd->argv[0] == 0)
     21d:	8b 43 04             	mov    0x4(%ebx),%eax
     220:	85 c0                	test   %eax,%eax
     222:	74 e0                	je     204 <runcmd+0x84>
    exec(ecmd->argv[0], ecmd->argv);
     224:	52                   	push   %edx
     225:	52                   	push   %edx
     226:	8d 53 04             	lea    0x4(%ebx),%edx
     229:	52                   	push   %edx
     22a:	50                   	push   %eax
     22b:	e8 1a 0b 00 00       	call   d4a <exec>
    printf(2, "exec %s failed\n", ecmd->argv[0]);
     230:	83 c4 0c             	add    $0xc,%esp
     233:	ff 73 04             	pushl  0x4(%ebx)
     236:	68 9a 11 00 00       	push   $0x119a
     23b:	6a 02                	push   $0x2
     23d:	e8 2e 0c 00 00       	call   e70 <printf>
    break;
     242:	83 c4 10             	add    $0x10,%esp
     245:	eb bd                	jmp    204 <runcmd+0x84>
    close(rcmd->fd);
     247:	83 ec 0c             	sub    $0xc,%esp
     24a:	ff 73 14             	pushl  0x14(%ebx)
     24d:	e8 e8 0a 00 00       	call   d3a <close>
    if(open(rcmd->file, rcmd->mode) < 0){
     252:	59                   	pop    %ecx
     253:	58                   	pop    %eax
     254:	ff 73 10             	pushl  0x10(%ebx)
     257:	ff 73 08             	pushl  0x8(%ebx)
     25a:	e8 f3 0a 00 00       	call   d52 <open>
     25f:	83 c4 10             	add    $0x10,%esp
     262:	85 c0                	test   %eax,%eax
     264:	78 43                	js     2a9 <runcmd+0x129>
      runcmd(bcmd->cmd);
     266:	83 ec 0c             	sub    $0xc,%esp
     269:	ff 73 04             	pushl  0x4(%ebx)
     26c:	e8 0f ff ff ff       	call   180 <runcmd>
  pid = fork();
     271:	e8 94 0a 00 00       	call   d0a <fork>
  if(pid == -1)
     276:	83 f8 ff             	cmp    $0xffffffff,%eax
     279:	74 21                	je     29c <runcmd+0x11c>
    if(fork1() == 0)
     27b:	85 c0                	test   %eax,%eax
     27d:	74 e7                	je     266 <runcmd+0xe6>
    wait();
     27f:	e8 96 0a 00 00       	call   d1a <wait>
    runcmd(lcmd->right);
     284:	83 ec 0c             	sub    $0xc,%esp
     287:	ff 73 08             	pushl  0x8(%ebx)
     28a:	e8 f1 fe ff ff       	call   180 <runcmd>
    panic("runcmd");
     28f:	83 ec 0c             	sub    $0xc,%esp
     292:	68 93 11 00 00       	push   $0x1193
     297:	e8 c4 fe ff ff       	call   160 <panic>
    panic("fork");
     29c:	83 ec 0c             	sub    $0xc,%esp
     29f:	68 ba 11 00 00       	push   $0x11ba
     2a4:	e8 b7 fe ff ff       	call   160 <panic>
      printf(2, "open %s failed\n", rcmd->file);
     2a9:	52                   	push   %edx
     2aa:	ff 73 08             	pushl  0x8(%ebx)
     2ad:	68 aa 11 00 00       	push   $0x11aa
     2b2:	6a 02                	push   $0x2
     2b4:	e8 b7 0b 00 00       	call   e70 <printf>
      exit();
     2b9:	e8 54 0a 00 00       	call   d12 <exit>
      panic("pipe");
     2be:	83 ec 0c             	sub    $0xc,%esp
     2c1:	68 bf 11 00 00       	push   $0x11bf
     2c6:	e8 95 fe ff ff       	call   160 <panic>
      close(1);
     2cb:	83 ec 0c             	sub    $0xc,%esp
     2ce:	6a 01                	push   $0x1
     2d0:	e8 65 0a 00 00       	call   d3a <close>
      dup(p[1]);
     2d5:	58                   	pop    %eax
     2d6:	ff 75 f4             	pushl  -0xc(%ebp)
     2d9:	e8 ac 0a 00 00       	call   d8a <dup>
      close(p[0]);
     2de:	58                   	pop    %eax
     2df:	ff 75 f0             	pushl  -0x10(%ebp)
     2e2:	e8 53 0a 00 00       	call   d3a <close>
      close(p[1]);
     2e7:	58                   	pop    %eax
     2e8:	ff 75 f4             	pushl  -0xc(%ebp)
     2eb:	e8 4a 0a 00 00       	call   d3a <close>
      runcmd(pcmd->left);
     2f0:	58                   	pop    %eax
     2f1:	ff 73 04             	pushl  0x4(%ebx)
     2f4:	e8 87 fe ff ff       	call   180 <runcmd>
      close(0);
     2f9:	83 ec 0c             	sub    $0xc,%esp
     2fc:	6a 00                	push   $0x0
     2fe:	e8 37 0a 00 00       	call   d3a <close>
      dup(p[0]);
     303:	5a                   	pop    %edx
     304:	ff 75 f0             	pushl  -0x10(%ebp)
     307:	e8 7e 0a 00 00       	call   d8a <dup>
      close(p[0]);
     30c:	59                   	pop    %ecx
     30d:	ff 75 f0             	pushl  -0x10(%ebp)
     310:	e8 25 0a 00 00       	call   d3a <close>
      close(p[1]);
     315:	58                   	pop    %eax
     316:	ff 75 f4             	pushl  -0xc(%ebp)
     319:	e8 1c 0a 00 00       	call   d3a <close>
      runcmd(pcmd->right);
     31e:	58                   	pop    %eax
     31f:	ff 73 08             	pushl  0x8(%ebx)
     322:	e8 59 fe ff ff       	call   180 <runcmd>
     327:	89 f6                	mov    %esi,%esi
     329:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000330 <fork1>:
{
     330:	55                   	push   %ebp
     331:	89 e5                	mov    %esp,%ebp
     333:	83 ec 08             	sub    $0x8,%esp
  pid = fork();
     336:	e8 cf 09 00 00       	call   d0a <fork>
  if(pid == -1)
     33b:	83 f8 ff             	cmp    $0xffffffff,%eax
     33e:	74 02                	je     342 <fork1+0x12>
  return pid;
}
     340:	c9                   	leave  
     341:	c3                   	ret    
    panic("fork");
     342:	83 ec 0c             	sub    $0xc,%esp
     345:	68 ba 11 00 00       	push   $0x11ba
     34a:	e8 11 fe ff ff       	call   160 <panic>
     34f:	90                   	nop

00000350 <execcmd>:
//PAGEBREAK!
// Constructors

struct cmd*
execcmd(void)
{
     350:	55                   	push   %ebp
     351:	89 e5                	mov    %esp,%ebp
     353:	53                   	push   %ebx
     354:	83 ec 10             	sub    $0x10,%esp
  struct execcmd *cmd;

  cmd = malloc(sizeof(*cmd));
     357:	6a 54                	push   $0x54
     359:	e8 52 0d 00 00       	call   10b0 <malloc>
  memset(cmd, 0, sizeof(*cmd));
     35e:	83 c4 0c             	add    $0xc,%esp
  cmd = malloc(sizeof(*cmd));
     361:	89 c3                	mov    %eax,%ebx
  memset(cmd, 0, sizeof(*cmd));
     363:	6a 54                	push   $0x54
     365:	6a 00                	push   $0x0
     367:	50                   	push   %eax
     368:	e8 13 08 00 00       	call   b80 <memset>
  cmd->type = EXEC;
     36d:	c7 03 01 00 00 00    	movl   $0x1,(%ebx)
  return (struct cmd*)cmd;
}
     373:	89 d8                	mov    %ebx,%eax
     375:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     378:	c9                   	leave  
     379:	c3                   	ret    
     37a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00000380 <redircmd>:

struct cmd*
redircmd(struct cmd *subcmd, char *file, char *efile, int mode, int fd)
{
     380:	55                   	push   %ebp
     381:	89 e5                	mov    %esp,%ebp
     383:	53                   	push   %ebx
     384:	83 ec 10             	sub    $0x10,%esp
  struct redircmd *cmd;

  cmd = malloc(sizeof(*cmd));
     387:	6a 18                	push   $0x18
     389:	e8 22 0d 00 00       	call   10b0 <malloc>
  memset(cmd, 0, sizeof(*cmd));
     38e:	83 c4 0c             	add    $0xc,%esp
  cmd = malloc(sizeof(*cmd));
     391:	89 c3                	mov    %eax,%ebx
  memset(cmd, 0, sizeof(*cmd));
     393:	6a 18                	push   $0x18
     395:	6a 00                	push   $0x0
     397:	50                   	push   %eax
     398:	e8 e3 07 00 00       	call   b80 <memset>
  cmd->type = REDIR;
  cmd->cmd = subcmd;
     39d:	8b 45 08             	mov    0x8(%ebp),%eax
  cmd->type = REDIR;
     3a0:	c7 03 02 00 00 00    	movl   $0x2,(%ebx)
  cmd->cmd = subcmd;
     3a6:	89 43 04             	mov    %eax,0x4(%ebx)
  cmd->file = file;
     3a9:	8b 45 0c             	mov    0xc(%ebp),%eax
     3ac:	89 43 08             	mov    %eax,0x8(%ebx)
  cmd->efile = efile;
     3af:	8b 45 10             	mov    0x10(%ebp),%eax
     3b2:	89 43 0c             	mov    %eax,0xc(%ebx)
  cmd->mode = mode;
     3b5:	8b 45 14             	mov    0x14(%ebp),%eax
     3b8:	89 43 10             	mov    %eax,0x10(%ebx)
  cmd->fd = fd;
     3bb:	8b 45 18             	mov    0x18(%ebp),%eax
     3be:	89 43 14             	mov    %eax,0x14(%ebx)
  return (struct cmd*)cmd;
}
     3c1:	89 d8                	mov    %ebx,%eax
     3c3:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     3c6:	c9                   	leave  
     3c7:	c3                   	ret    
     3c8:	90                   	nop
     3c9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

000003d0 <pipecmd>:

struct cmd*
pipecmd(struct cmd *left, struct cmd *right)
{
     3d0:	55                   	push   %ebp
     3d1:	89 e5                	mov    %esp,%ebp
     3d3:	53                   	push   %ebx
     3d4:	83 ec 10             	sub    $0x10,%esp
  struct pipecmd *cmd;

  cmd = malloc(sizeof(*cmd));
     3d7:	6a 0c                	push   $0xc
     3d9:	e8 d2 0c 00 00       	call   10b0 <malloc>
  memset(cmd, 0, sizeof(*cmd));
     3de:	83 c4 0c             	add    $0xc,%esp
  cmd = malloc(sizeof(*cmd));
     3e1:	89 c3                	mov    %eax,%ebx
  memset(cmd, 0, sizeof(*cmd));
     3e3:	6a 0c                	push   $0xc
     3e5:	6a 00                	push   $0x0
     3e7:	50                   	push   %eax
     3e8:	e8 93 07 00 00       	call   b80 <memset>
  cmd->type = PIPE;
  cmd->left = left;
     3ed:	8b 45 08             	mov    0x8(%ebp),%eax
  cmd->type = PIPE;
     3f0:	c7 03 03 00 00 00    	movl   $0x3,(%ebx)
  cmd->left = left;
     3f6:	89 43 04             	mov    %eax,0x4(%ebx)
  cmd->right = right;
     3f9:	8b 45 0c             	mov    0xc(%ebp),%eax
     3fc:	89 43 08             	mov    %eax,0x8(%ebx)
  return (struct cmd*)cmd;
}
     3ff:	89 d8                	mov    %ebx,%eax
     401:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     404:	c9                   	leave  
     405:	c3                   	ret    
     406:	8d 76 00             	lea    0x0(%esi),%esi
     409:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000410 <listcmd>:

struct cmd*
listcmd(struct cmd *left, struct cmd *right)
{
     410:	55                   	push   %ebp
     411:	89 e5                	mov    %esp,%ebp
     413:	53                   	push   %ebx
     414:	83 ec 10             	sub    $0x10,%esp
  struct listcmd *cmd;

  cmd = malloc(sizeof(*cmd));
     417:	6a 0c                	push   $0xc
     419:	e8 92 0c 00 00       	call   10b0 <malloc>
  memset(cmd, 0, sizeof(*cmd));
     41e:	83 c4 0c             	add    $0xc,%esp
  cmd = malloc(sizeof(*cmd));
     421:	89 c3                	mov    %eax,%ebx
  memset(cmd, 0, sizeof(*cmd));
     423:	6a 0c                	push   $0xc
     425:	6a 00                	push   $0x0
     427:	50                   	push   %eax
     428:	e8 53 07 00 00       	call   b80 <memset>
  cmd->type = LIST;
  cmd->left = left;
     42d:	8b 45 08             	mov    0x8(%ebp),%eax
  cmd->type = LIST;
     430:	c7 03 04 00 00 00    	movl   $0x4,(%ebx)
  cmd->left = left;
     436:	89 43 04             	mov    %eax,0x4(%ebx)
  cmd->right = right;
     439:	8b 45 0c             	mov    0xc(%ebp),%eax
     43c:	89 43 08             	mov    %eax,0x8(%ebx)
  return (struct cmd*)cmd;
}
     43f:	89 d8                	mov    %ebx,%eax
     441:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     444:	c9                   	leave  
     445:	c3                   	ret    
     446:	8d 76 00             	lea    0x0(%esi),%esi
     449:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000450 <backcmd>:

struct cmd*
backcmd(struct cmd *subcmd)
{
     450:	55                   	push   %ebp
     451:	89 e5                	mov    %esp,%ebp
     453:	53                   	push   %ebx
     454:	83 ec 10             	sub    $0x10,%esp
  struct backcmd *cmd;

  cmd = malloc(sizeof(*cmd));
     457:	6a 08                	push   $0x8
     459:	e8 52 0c 00 00       	call   10b0 <malloc>
  memset(cmd, 0, sizeof(*cmd));
     45e:	83 c4 0c             	add    $0xc,%esp
  cmd = malloc(sizeof(*cmd));
     461:	89 c3                	mov    %eax,%ebx
  memset(cmd, 0, sizeof(*cmd));
     463:	6a 08                	push   $0x8
     465:	6a 00                	push   $0x0
     467:	50                   	push   %eax
     468:	e8 13 07 00 00       	call   b80 <memset>
  cmd->type = BACK;
  cmd->cmd = subcmd;
     46d:	8b 45 08             	mov    0x8(%ebp),%eax
  cmd->type = BACK;
     470:	c7 03 05 00 00 00    	movl   $0x5,(%ebx)
  cmd->cmd = subcmd;
     476:	89 43 04             	mov    %eax,0x4(%ebx)
  return (struct cmd*)cmd;
}
     479:	89 d8                	mov    %ebx,%eax
     47b:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     47e:	c9                   	leave  
     47f:	c3                   	ret    

00000480 <gettoken>:
char whitespace[] = " \t\r\n\v";
char symbols[] = "<|>&;()";

int
gettoken(char **ps, char *es, char **q, char **eq)
{
     480:	55                   	push   %ebp
     481:	89 e5                	mov    %esp,%ebp
     483:	57                   	push   %edi
     484:	56                   	push   %esi
     485:	53                   	push   %ebx
     486:	83 ec 0c             	sub    $0xc,%esp
  char *s;
  int ret;

  s = *ps;
     489:	8b 45 08             	mov    0x8(%ebp),%eax
{
     48c:	8b 5d 0c             	mov    0xc(%ebp),%ebx
     48f:	8b 7d 10             	mov    0x10(%ebp),%edi
  s = *ps;
     492:	8b 30                	mov    (%eax),%esi
  while(s < es && strchr(whitespace, *s))
     494:	39 de                	cmp    %ebx,%esi
     496:	72 0f                	jb     4a7 <gettoken+0x27>
     498:	eb 25                	jmp    4bf <gettoken+0x3f>
     49a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    s++;
     4a0:	83 c6 01             	add    $0x1,%esi
  while(s < es && strchr(whitespace, *s))
     4a3:	39 f3                	cmp    %esi,%ebx
     4a5:	74 18                	je     4bf <gettoken+0x3f>
     4a7:	0f be 06             	movsbl (%esi),%eax
     4aa:	83 ec 08             	sub    $0x8,%esp
     4ad:	50                   	push   %eax
     4ae:	68 38 18 00 00       	push   $0x1838
     4b3:	e8 e8 06 00 00       	call   ba0 <strchr>
     4b8:	83 c4 10             	add    $0x10,%esp
     4bb:	85 c0                	test   %eax,%eax
     4bd:	75 e1                	jne    4a0 <gettoken+0x20>
  if(q)
     4bf:	85 ff                	test   %edi,%edi
     4c1:	74 02                	je     4c5 <gettoken+0x45>
    *q = s;
     4c3:	89 37                	mov    %esi,(%edi)
  ret = *s;
     4c5:	0f be 06             	movsbl (%esi),%eax
  switch(*s){
     4c8:	3c 29                	cmp    $0x29,%al
     4ca:	7f 54                	jg     520 <gettoken+0xa0>
     4cc:	3c 28                	cmp    $0x28,%al
     4ce:	0f 8d c8 00 00 00    	jge    59c <gettoken+0x11c>
     4d4:	31 ff                	xor    %edi,%edi
     4d6:	84 c0                	test   %al,%al
     4d8:	0f 85 e2 00 00 00    	jne    5c0 <gettoken+0x140>
    ret = 'a';
    while(s < es && !strchr(whitespace, *s) && !strchr(symbols, *s))
      s++;
    break;
  }
  if(eq)
     4de:	8b 55 14             	mov    0x14(%ebp),%edx
     4e1:	85 d2                	test   %edx,%edx
     4e3:	74 05                	je     4ea <gettoken+0x6a>
    *eq = s;
     4e5:	8b 45 14             	mov    0x14(%ebp),%eax
     4e8:	89 30                	mov    %esi,(%eax)

  while(s < es && strchr(whitespace, *s))
     4ea:	39 f3                	cmp    %esi,%ebx
     4ec:	77 09                	ja     4f7 <gettoken+0x77>
     4ee:	eb 1f                	jmp    50f <gettoken+0x8f>
    s++;
     4f0:	83 c6 01             	add    $0x1,%esi
  while(s < es && strchr(whitespace, *s))
     4f3:	39 f3                	cmp    %esi,%ebx
     4f5:	74 18                	je     50f <gettoken+0x8f>
     4f7:	0f be 06             	movsbl (%esi),%eax
     4fa:	83 ec 08             	sub    $0x8,%esp
     4fd:	50                   	push   %eax
     4fe:	68 38 18 00 00       	push   $0x1838
     503:	e8 98 06 00 00       	call   ba0 <strchr>
     508:	83 c4 10             	add    $0x10,%esp
     50b:	85 c0                	test   %eax,%eax
     50d:	75 e1                	jne    4f0 <gettoken+0x70>
  *ps = s;
     50f:	8b 45 08             	mov    0x8(%ebp),%eax
     512:	89 30                	mov    %esi,(%eax)
  return ret;
}
     514:	8d 65 f4             	lea    -0xc(%ebp),%esp
     517:	89 f8                	mov    %edi,%eax
     519:	5b                   	pop    %ebx
     51a:	5e                   	pop    %esi
     51b:	5f                   	pop    %edi
     51c:	5d                   	pop    %ebp
     51d:	c3                   	ret    
     51e:	66 90                	xchg   %ax,%ax
  switch(*s){
     520:	3c 3e                	cmp    $0x3e,%al
     522:	75 1c                	jne    540 <gettoken+0xc0>
    if(*s == '>'){
     524:	80 7e 01 3e          	cmpb   $0x3e,0x1(%esi)
     528:	0f 84 82 00 00 00    	je     5b0 <gettoken+0x130>
    s++;
     52e:	83 c6 01             	add    $0x1,%esi
     531:	bf 3e 00 00 00       	mov    $0x3e,%edi
     536:	eb a6                	jmp    4de <gettoken+0x5e>
     538:	90                   	nop
     539:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  switch(*s){
     540:	7f 56                	jg     598 <gettoken+0x118>
     542:	8d 48 c5             	lea    -0x3b(%eax),%ecx
     545:	80 f9 01             	cmp    $0x1,%cl
     548:	76 52                	jbe    59c <gettoken+0x11c>
    while(s < es && !strchr(whitespace, *s) && !strchr(symbols, *s))
     54a:	39 f3                	cmp    %esi,%ebx
     54c:	77 24                	ja     572 <gettoken+0xf2>
     54e:	eb 7a                	jmp    5ca <gettoken+0x14a>
     550:	0f be 06             	movsbl (%esi),%eax
     553:	83 ec 08             	sub    $0x8,%esp
     556:	50                   	push   %eax
     557:	68 30 18 00 00       	push   $0x1830
     55c:	e8 3f 06 00 00       	call   ba0 <strchr>
     561:	83 c4 10             	add    $0x10,%esp
     564:	85 c0                	test   %eax,%eax
     566:	75 1f                	jne    587 <gettoken+0x107>
      s++;
     568:	83 c6 01             	add    $0x1,%esi
    while(s < es && !strchr(whitespace, *s) && !strchr(symbols, *s))
     56b:	39 f3                	cmp    %esi,%ebx
     56d:	74 5b                	je     5ca <gettoken+0x14a>
     56f:	0f be 06             	movsbl (%esi),%eax
     572:	83 ec 08             	sub    $0x8,%esp
     575:	50                   	push   %eax
     576:	68 38 18 00 00       	push   $0x1838
     57b:	e8 20 06 00 00       	call   ba0 <strchr>
     580:	83 c4 10             	add    $0x10,%esp
     583:	85 c0                	test   %eax,%eax
     585:	74 c9                	je     550 <gettoken+0xd0>
    ret = 'a';
     587:	bf 61 00 00 00       	mov    $0x61,%edi
     58c:	e9 4d ff ff ff       	jmp    4de <gettoken+0x5e>
     591:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  switch(*s){
     598:	3c 7c                	cmp    $0x7c,%al
     59a:	75 ae                	jne    54a <gettoken+0xca>
  ret = *s;
     59c:	0f be f8             	movsbl %al,%edi
    s++;
     59f:	83 c6 01             	add    $0x1,%esi
    break;
     5a2:	e9 37 ff ff ff       	jmp    4de <gettoken+0x5e>
     5a7:	89 f6                	mov    %esi,%esi
     5a9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
      s++;
     5b0:	83 c6 02             	add    $0x2,%esi
      ret = '+';
     5b3:	bf 2b 00 00 00       	mov    $0x2b,%edi
     5b8:	e9 21 ff ff ff       	jmp    4de <gettoken+0x5e>
     5bd:	8d 76 00             	lea    0x0(%esi),%esi
  switch(*s){
     5c0:	3c 26                	cmp    $0x26,%al
     5c2:	0f 85 82 ff ff ff    	jne    54a <gettoken+0xca>
     5c8:	eb d2                	jmp    59c <gettoken+0x11c>
  if(eq)
     5ca:	8b 45 14             	mov    0x14(%ebp),%eax
     5cd:	bf 61 00 00 00       	mov    $0x61,%edi
     5d2:	85 c0                	test   %eax,%eax
     5d4:	0f 85 0b ff ff ff    	jne    4e5 <gettoken+0x65>
     5da:	e9 30 ff ff ff       	jmp    50f <gettoken+0x8f>
     5df:	90                   	nop

000005e0 <peek>:

int
peek(char **ps, char *es, char *toks)
{
     5e0:	55                   	push   %ebp
     5e1:	89 e5                	mov    %esp,%ebp
     5e3:	57                   	push   %edi
     5e4:	56                   	push   %esi
     5e5:	53                   	push   %ebx
     5e6:	83 ec 0c             	sub    $0xc,%esp
     5e9:	8b 7d 08             	mov    0x8(%ebp),%edi
     5ec:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *s;

  s = *ps;
     5ef:	8b 1f                	mov    (%edi),%ebx
  while(s < es && strchr(whitespace, *s))
     5f1:	39 f3                	cmp    %esi,%ebx
     5f3:	72 12                	jb     607 <peek+0x27>
     5f5:	eb 28                	jmp    61f <peek+0x3f>
     5f7:	89 f6                	mov    %esi,%esi
     5f9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    s++;
     600:	83 c3 01             	add    $0x1,%ebx
  while(s < es && strchr(whitespace, *s))
     603:	39 de                	cmp    %ebx,%esi
     605:	74 18                	je     61f <peek+0x3f>
     607:	0f be 03             	movsbl (%ebx),%eax
     60a:	83 ec 08             	sub    $0x8,%esp
     60d:	50                   	push   %eax
     60e:	68 38 18 00 00       	push   $0x1838
     613:	e8 88 05 00 00       	call   ba0 <strchr>
     618:	83 c4 10             	add    $0x10,%esp
     61b:	85 c0                	test   %eax,%eax
     61d:	75 e1                	jne    600 <peek+0x20>
  *ps = s;
     61f:	89 1f                	mov    %ebx,(%edi)
  return *s && strchr(toks, *s);
     621:	0f be 13             	movsbl (%ebx),%edx
     624:	31 c0                	xor    %eax,%eax
     626:	84 d2                	test   %dl,%dl
     628:	74 17                	je     641 <peek+0x61>
     62a:	83 ec 08             	sub    $0x8,%esp
     62d:	52                   	push   %edx
     62e:	ff 75 10             	pushl  0x10(%ebp)
     631:	e8 6a 05 00 00       	call   ba0 <strchr>
     636:	83 c4 10             	add    $0x10,%esp
     639:	85 c0                	test   %eax,%eax
     63b:	0f 95 c0             	setne  %al
     63e:	0f b6 c0             	movzbl %al,%eax
}
     641:	8d 65 f4             	lea    -0xc(%ebp),%esp
     644:	5b                   	pop    %ebx
     645:	5e                   	pop    %esi
     646:	5f                   	pop    %edi
     647:	5d                   	pop    %ebp
     648:	c3                   	ret    
     649:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000650 <parseredirs>:
  return cmd;
}

struct cmd*
parseredirs(struct cmd *cmd, char **ps, char *es)
{
     650:	55                   	push   %ebp
     651:	89 e5                	mov    %esp,%ebp
     653:	57                   	push   %edi
     654:	56                   	push   %esi
     655:	53                   	push   %ebx
     656:	83 ec 1c             	sub    $0x1c,%esp
     659:	8b 75 0c             	mov    0xc(%ebp),%esi
     65c:	8b 5d 10             	mov    0x10(%ebp),%ebx
     65f:	90                   	nop
  int tok;
  char *q, *eq;

  while(peek(ps, es, "<>")){
     660:	83 ec 04             	sub    $0x4,%esp
     663:	68 e1 11 00 00       	push   $0x11e1
     668:	53                   	push   %ebx
     669:	56                   	push   %esi
     66a:	e8 71 ff ff ff       	call   5e0 <peek>
     66f:	83 c4 10             	add    $0x10,%esp
     672:	85 c0                	test   %eax,%eax
     674:	74 6a                	je     6e0 <parseredirs+0x90>
    tok = gettoken(ps, es, 0, 0);
     676:	6a 00                	push   $0x0
     678:	6a 00                	push   $0x0
     67a:	53                   	push   %ebx
     67b:	56                   	push   %esi
     67c:	e8 ff fd ff ff       	call   480 <gettoken>
     681:	89 c7                	mov    %eax,%edi
    if(gettoken(ps, es, &q, &eq) != 'a')
     683:	8d 45 e4             	lea    -0x1c(%ebp),%eax
     686:	50                   	push   %eax
     687:	8d 45 e0             	lea    -0x20(%ebp),%eax
     68a:	50                   	push   %eax
     68b:	53                   	push   %ebx
     68c:	56                   	push   %esi
     68d:	e8 ee fd ff ff       	call   480 <gettoken>
     692:	83 c4 20             	add    $0x20,%esp
     695:	83 f8 61             	cmp    $0x61,%eax
     698:	75 51                	jne    6eb <parseredirs+0x9b>
      panic("missing file for redirection");
    switch(tok){
     69a:	83 ff 3c             	cmp    $0x3c,%edi
     69d:	74 31                	je     6d0 <parseredirs+0x80>
     69f:	83 ff 3e             	cmp    $0x3e,%edi
     6a2:	74 05                	je     6a9 <parseredirs+0x59>
     6a4:	83 ff 2b             	cmp    $0x2b,%edi
     6a7:	75 b7                	jne    660 <parseredirs+0x10>
      break;
    case '>':
      cmd = redircmd(cmd, q, eq, O_WRONLY|O_CREATE, 1);
      break;
    case '+':  // >>
      cmd = redircmd(cmd, q, eq, O_WRONLY|O_CREATE, 1);
     6a9:	83 ec 0c             	sub    $0xc,%esp
     6ac:	6a 01                	push   $0x1
     6ae:	68 01 02 00 00       	push   $0x201
     6b3:	ff 75 e4             	pushl  -0x1c(%ebp)
     6b6:	ff 75 e0             	pushl  -0x20(%ebp)
     6b9:	ff 75 08             	pushl  0x8(%ebp)
     6bc:	e8 bf fc ff ff       	call   380 <redircmd>
      break;
     6c1:	83 c4 20             	add    $0x20,%esp
      cmd = redircmd(cmd, q, eq, O_WRONLY|O_CREATE, 1);
     6c4:	89 45 08             	mov    %eax,0x8(%ebp)
      break;
     6c7:	eb 97                	jmp    660 <parseredirs+0x10>
     6c9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      cmd = redircmd(cmd, q, eq, O_RDONLY, 0);
     6d0:	83 ec 0c             	sub    $0xc,%esp
     6d3:	6a 00                	push   $0x0
     6d5:	6a 00                	push   $0x0
     6d7:	eb da                	jmp    6b3 <parseredirs+0x63>
     6d9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    }
  }
  return cmd;
}
     6e0:	8b 45 08             	mov    0x8(%ebp),%eax
     6e3:	8d 65 f4             	lea    -0xc(%ebp),%esp
     6e6:	5b                   	pop    %ebx
     6e7:	5e                   	pop    %esi
     6e8:	5f                   	pop    %edi
     6e9:	5d                   	pop    %ebp
     6ea:	c3                   	ret    
      panic("missing file for redirection");
     6eb:	83 ec 0c             	sub    $0xc,%esp
     6ee:	68 c4 11 00 00       	push   $0x11c4
     6f3:	e8 68 fa ff ff       	call   160 <panic>
     6f8:	90                   	nop
     6f9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000700 <parseexec>:
  return cmd;
}

struct cmd*
parseexec(char **ps, char *es)
{
     700:	55                   	push   %ebp
     701:	89 e5                	mov    %esp,%ebp
     703:	57                   	push   %edi
     704:	56                   	push   %esi
     705:	53                   	push   %ebx
     706:	83 ec 30             	sub    $0x30,%esp
     709:	8b 75 08             	mov    0x8(%ebp),%esi
     70c:	8b 7d 0c             	mov    0xc(%ebp),%edi
  char *q, *eq;
  int tok, argc;
  struct execcmd *cmd;
  struct cmd *ret;

  if(peek(ps, es, "("))
     70f:	68 e4 11 00 00       	push   $0x11e4
     714:	57                   	push   %edi
     715:	56                   	push   %esi
     716:	e8 c5 fe ff ff       	call   5e0 <peek>
     71b:	83 c4 10             	add    $0x10,%esp
     71e:	85 c0                	test   %eax,%eax
     720:	0f 85 92 00 00 00    	jne    7b8 <parseexec+0xb8>
     726:	89 c3                	mov    %eax,%ebx
    return parseblock(ps, es);

  ret = execcmd();
     728:	e8 23 fc ff ff       	call   350 <execcmd>
  cmd = (struct execcmd*)ret;

  argc = 0;
  ret = parseredirs(ret, ps, es);
     72d:	83 ec 04             	sub    $0x4,%esp
  ret = execcmd();
     730:	89 45 d0             	mov    %eax,-0x30(%ebp)
  ret = parseredirs(ret, ps, es);
     733:	57                   	push   %edi
     734:	56                   	push   %esi
     735:	50                   	push   %eax
     736:	e8 15 ff ff ff       	call   650 <parseredirs>
     73b:	83 c4 10             	add    $0x10,%esp
     73e:	89 45 d4             	mov    %eax,-0x2c(%ebp)
     741:	eb 18                	jmp    75b <parseexec+0x5b>
     743:	90                   	nop
     744:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    cmd->argv[argc] = q;
    cmd->eargv[argc] = eq;
    argc++;
    if(argc >= MAXARGS)
      panic("too many args");
    ret = parseredirs(ret, ps, es);
     748:	83 ec 04             	sub    $0x4,%esp
     74b:	57                   	push   %edi
     74c:	56                   	push   %esi
     74d:	ff 75 d4             	pushl  -0x2c(%ebp)
     750:	e8 fb fe ff ff       	call   650 <parseredirs>
     755:	83 c4 10             	add    $0x10,%esp
     758:	89 45 d4             	mov    %eax,-0x2c(%ebp)
  while(!peek(ps, es, "|)&;")){
     75b:	83 ec 04             	sub    $0x4,%esp
     75e:	68 fb 11 00 00       	push   $0x11fb
     763:	57                   	push   %edi
     764:	56                   	push   %esi
     765:	e8 76 fe ff ff       	call   5e0 <peek>
     76a:	83 c4 10             	add    $0x10,%esp
     76d:	85 c0                	test   %eax,%eax
     76f:	75 67                	jne    7d8 <parseexec+0xd8>
    if((tok=gettoken(ps, es, &q, &eq)) == 0)
     771:	8d 45 e4             	lea    -0x1c(%ebp),%eax
     774:	50                   	push   %eax
     775:	8d 45 e0             	lea    -0x20(%ebp),%eax
     778:	50                   	push   %eax
     779:	57                   	push   %edi
     77a:	56                   	push   %esi
     77b:	e8 00 fd ff ff       	call   480 <gettoken>
     780:	83 c4 10             	add    $0x10,%esp
     783:	85 c0                	test   %eax,%eax
     785:	74 51                	je     7d8 <parseexec+0xd8>
    if(tok != 'a')
     787:	83 f8 61             	cmp    $0x61,%eax
     78a:	75 6b                	jne    7f7 <parseexec+0xf7>
    cmd->argv[argc] = q;
     78c:	8b 45 e0             	mov    -0x20(%ebp),%eax
     78f:	8b 55 d0             	mov    -0x30(%ebp),%edx
     792:	89 44 9a 04          	mov    %eax,0x4(%edx,%ebx,4)
    cmd->eargv[argc] = eq;
     796:	8b 45 e4             	mov    -0x1c(%ebp),%eax
     799:	89 44 9a 2c          	mov    %eax,0x2c(%edx,%ebx,4)
    argc++;
     79d:	83 c3 01             	add    $0x1,%ebx
    if(argc >= MAXARGS)
     7a0:	83 fb 0a             	cmp    $0xa,%ebx
     7a3:	75 a3                	jne    748 <parseexec+0x48>
      panic("too many args");
     7a5:	83 ec 0c             	sub    $0xc,%esp
     7a8:	68 ed 11 00 00       	push   $0x11ed
     7ad:	e8 ae f9 ff ff       	call   160 <panic>
     7b2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    return parseblock(ps, es);
     7b8:	83 ec 08             	sub    $0x8,%esp
     7bb:	57                   	push   %edi
     7bc:	56                   	push   %esi
     7bd:	e8 5e 01 00 00       	call   920 <parseblock>
     7c2:	83 c4 10             	add    $0x10,%esp
     7c5:	89 45 d4             	mov    %eax,-0x2c(%ebp)
  }
  cmd->argv[argc] = 0;
  cmd->eargv[argc] = 0;
  return ret;
}
     7c8:	8b 45 d4             	mov    -0x2c(%ebp),%eax
     7cb:	8d 65 f4             	lea    -0xc(%ebp),%esp
     7ce:	5b                   	pop    %ebx
     7cf:	5e                   	pop    %esi
     7d0:	5f                   	pop    %edi
     7d1:	5d                   	pop    %ebp
     7d2:	c3                   	ret    
     7d3:	90                   	nop
     7d4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
     7d8:	8b 45 d0             	mov    -0x30(%ebp),%eax
     7db:	8d 04 98             	lea    (%eax,%ebx,4),%eax
  cmd->argv[argc] = 0;
     7de:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
  cmd->eargv[argc] = 0;
     7e5:	c7 40 2c 00 00 00 00 	movl   $0x0,0x2c(%eax)
}
     7ec:	8b 45 d4             	mov    -0x2c(%ebp),%eax
     7ef:	8d 65 f4             	lea    -0xc(%ebp),%esp
     7f2:	5b                   	pop    %ebx
     7f3:	5e                   	pop    %esi
     7f4:	5f                   	pop    %edi
     7f5:	5d                   	pop    %ebp
     7f6:	c3                   	ret    
      panic("syntax");
     7f7:	83 ec 0c             	sub    $0xc,%esp
     7fa:	68 e6 11 00 00       	push   $0x11e6
     7ff:	e8 5c f9 ff ff       	call   160 <panic>
     804:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
     80a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

00000810 <parsepipe>:
{
     810:	55                   	push   %ebp
     811:	89 e5                	mov    %esp,%ebp
     813:	57                   	push   %edi
     814:	56                   	push   %esi
     815:	53                   	push   %ebx
     816:	83 ec 14             	sub    $0x14,%esp
     819:	8b 5d 08             	mov    0x8(%ebp),%ebx
     81c:	8b 75 0c             	mov    0xc(%ebp),%esi
  cmd = parseexec(ps, es);
     81f:	56                   	push   %esi
     820:	53                   	push   %ebx
     821:	e8 da fe ff ff       	call   700 <parseexec>
  if(peek(ps, es, "|")){
     826:	83 c4 0c             	add    $0xc,%esp
  cmd = parseexec(ps, es);
     829:	89 c7                	mov    %eax,%edi
  if(peek(ps, es, "|")){
     82b:	68 00 12 00 00       	push   $0x1200
     830:	56                   	push   %esi
     831:	53                   	push   %ebx
     832:	e8 a9 fd ff ff       	call   5e0 <peek>
     837:	83 c4 10             	add    $0x10,%esp
     83a:	85 c0                	test   %eax,%eax
     83c:	75 12                	jne    850 <parsepipe+0x40>
}
     83e:	8d 65 f4             	lea    -0xc(%ebp),%esp
     841:	89 f8                	mov    %edi,%eax
     843:	5b                   	pop    %ebx
     844:	5e                   	pop    %esi
     845:	5f                   	pop    %edi
     846:	5d                   	pop    %ebp
     847:	c3                   	ret    
     848:	90                   	nop
     849:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    gettoken(ps, es, 0, 0);
     850:	6a 00                	push   $0x0
     852:	6a 00                	push   $0x0
     854:	56                   	push   %esi
     855:	53                   	push   %ebx
     856:	e8 25 fc ff ff       	call   480 <gettoken>
    cmd = pipecmd(cmd, parsepipe(ps, es));
     85b:	58                   	pop    %eax
     85c:	5a                   	pop    %edx
     85d:	56                   	push   %esi
     85e:	53                   	push   %ebx
     85f:	e8 ac ff ff ff       	call   810 <parsepipe>
     864:	89 7d 08             	mov    %edi,0x8(%ebp)
     867:	89 45 0c             	mov    %eax,0xc(%ebp)
     86a:	83 c4 10             	add    $0x10,%esp
}
     86d:	8d 65 f4             	lea    -0xc(%ebp),%esp
     870:	5b                   	pop    %ebx
     871:	5e                   	pop    %esi
     872:	5f                   	pop    %edi
     873:	5d                   	pop    %ebp
    cmd = pipecmd(cmd, parsepipe(ps, es));
     874:	e9 57 fb ff ff       	jmp    3d0 <pipecmd>
     879:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000880 <parseline>:
{
     880:	55                   	push   %ebp
     881:	89 e5                	mov    %esp,%ebp
     883:	57                   	push   %edi
     884:	56                   	push   %esi
     885:	53                   	push   %ebx
     886:	83 ec 14             	sub    $0x14,%esp
     889:	8b 5d 08             	mov    0x8(%ebp),%ebx
     88c:	8b 75 0c             	mov    0xc(%ebp),%esi
  cmd = parsepipe(ps, es);
     88f:	56                   	push   %esi
     890:	53                   	push   %ebx
     891:	e8 7a ff ff ff       	call   810 <parsepipe>
  while(peek(ps, es, "&")){
     896:	83 c4 10             	add    $0x10,%esp
  cmd = parsepipe(ps, es);
     899:	89 c7                	mov    %eax,%edi
  while(peek(ps, es, "&")){
     89b:	eb 1b                	jmp    8b8 <parseline+0x38>
     89d:	8d 76 00             	lea    0x0(%esi),%esi
    gettoken(ps, es, 0, 0);
     8a0:	6a 00                	push   $0x0
     8a2:	6a 00                	push   $0x0
     8a4:	56                   	push   %esi
     8a5:	53                   	push   %ebx
     8a6:	e8 d5 fb ff ff       	call   480 <gettoken>
    cmd = backcmd(cmd);
     8ab:	89 3c 24             	mov    %edi,(%esp)
     8ae:	e8 9d fb ff ff       	call   450 <backcmd>
     8b3:	83 c4 10             	add    $0x10,%esp
     8b6:	89 c7                	mov    %eax,%edi
  while(peek(ps, es, "&")){
     8b8:	83 ec 04             	sub    $0x4,%esp
     8bb:	68 02 12 00 00       	push   $0x1202
     8c0:	56                   	push   %esi
     8c1:	53                   	push   %ebx
     8c2:	e8 19 fd ff ff       	call   5e0 <peek>
     8c7:	83 c4 10             	add    $0x10,%esp
     8ca:	85 c0                	test   %eax,%eax
     8cc:	75 d2                	jne    8a0 <parseline+0x20>
  if(peek(ps, es, ";")){
     8ce:	83 ec 04             	sub    $0x4,%esp
     8d1:	68 fe 11 00 00       	push   $0x11fe
     8d6:	56                   	push   %esi
     8d7:	53                   	push   %ebx
     8d8:	e8 03 fd ff ff       	call   5e0 <peek>
     8dd:	83 c4 10             	add    $0x10,%esp
     8e0:	85 c0                	test   %eax,%eax
     8e2:	75 0c                	jne    8f0 <parseline+0x70>
}
     8e4:	8d 65 f4             	lea    -0xc(%ebp),%esp
     8e7:	89 f8                	mov    %edi,%eax
     8e9:	5b                   	pop    %ebx
     8ea:	5e                   	pop    %esi
     8eb:	5f                   	pop    %edi
     8ec:	5d                   	pop    %ebp
     8ed:	c3                   	ret    
     8ee:	66 90                	xchg   %ax,%ax
    gettoken(ps, es, 0, 0);
     8f0:	6a 00                	push   $0x0
     8f2:	6a 00                	push   $0x0
     8f4:	56                   	push   %esi
     8f5:	53                   	push   %ebx
     8f6:	e8 85 fb ff ff       	call   480 <gettoken>
    cmd = listcmd(cmd, parseline(ps, es));
     8fb:	58                   	pop    %eax
     8fc:	5a                   	pop    %edx
     8fd:	56                   	push   %esi
     8fe:	53                   	push   %ebx
     8ff:	e8 7c ff ff ff       	call   880 <parseline>
     904:	89 7d 08             	mov    %edi,0x8(%ebp)
     907:	89 45 0c             	mov    %eax,0xc(%ebp)
     90a:	83 c4 10             	add    $0x10,%esp
}
     90d:	8d 65 f4             	lea    -0xc(%ebp),%esp
     910:	5b                   	pop    %ebx
     911:	5e                   	pop    %esi
     912:	5f                   	pop    %edi
     913:	5d                   	pop    %ebp
    cmd = listcmd(cmd, parseline(ps, es));
     914:	e9 f7 fa ff ff       	jmp    410 <listcmd>
     919:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000920 <parseblock>:
{
     920:	55                   	push   %ebp
     921:	89 e5                	mov    %esp,%ebp
     923:	57                   	push   %edi
     924:	56                   	push   %esi
     925:	53                   	push   %ebx
     926:	83 ec 10             	sub    $0x10,%esp
     929:	8b 5d 08             	mov    0x8(%ebp),%ebx
     92c:	8b 75 0c             	mov    0xc(%ebp),%esi
  if(!peek(ps, es, "("))
     92f:	68 e4 11 00 00       	push   $0x11e4
     934:	56                   	push   %esi
     935:	53                   	push   %ebx
     936:	e8 a5 fc ff ff       	call   5e0 <peek>
     93b:	83 c4 10             	add    $0x10,%esp
     93e:	85 c0                	test   %eax,%eax
     940:	74 4a                	je     98c <parseblock+0x6c>
  gettoken(ps, es, 0, 0);
     942:	6a 00                	push   $0x0
     944:	6a 00                	push   $0x0
     946:	56                   	push   %esi
     947:	53                   	push   %ebx
     948:	e8 33 fb ff ff       	call   480 <gettoken>
  cmd = parseline(ps, es);
     94d:	58                   	pop    %eax
     94e:	5a                   	pop    %edx
     94f:	56                   	push   %esi
     950:	53                   	push   %ebx
     951:	e8 2a ff ff ff       	call   880 <parseline>
  if(!peek(ps, es, ")"))
     956:	83 c4 0c             	add    $0xc,%esp
  cmd = parseline(ps, es);
     959:	89 c7                	mov    %eax,%edi
  if(!peek(ps, es, ")"))
     95b:	68 20 12 00 00       	push   $0x1220
     960:	56                   	push   %esi
     961:	53                   	push   %ebx
     962:	e8 79 fc ff ff       	call   5e0 <peek>
     967:	83 c4 10             	add    $0x10,%esp
     96a:	85 c0                	test   %eax,%eax
     96c:	74 2b                	je     999 <parseblock+0x79>
  gettoken(ps, es, 0, 0);
     96e:	6a 00                	push   $0x0
     970:	6a 00                	push   $0x0
     972:	56                   	push   %esi
     973:	53                   	push   %ebx
     974:	e8 07 fb ff ff       	call   480 <gettoken>
  cmd = parseredirs(cmd, ps, es);
     979:	83 c4 0c             	add    $0xc,%esp
     97c:	56                   	push   %esi
     97d:	53                   	push   %ebx
     97e:	57                   	push   %edi
     97f:	e8 cc fc ff ff       	call   650 <parseredirs>
}
     984:	8d 65 f4             	lea    -0xc(%ebp),%esp
     987:	5b                   	pop    %ebx
     988:	5e                   	pop    %esi
     989:	5f                   	pop    %edi
     98a:	5d                   	pop    %ebp
     98b:	c3                   	ret    
    panic("parseblock");
     98c:	83 ec 0c             	sub    $0xc,%esp
     98f:	68 04 12 00 00       	push   $0x1204
     994:	e8 c7 f7 ff ff       	call   160 <panic>
    panic("syntax - missing )");
     999:	83 ec 0c             	sub    $0xc,%esp
     99c:	68 0f 12 00 00       	push   $0x120f
     9a1:	e8 ba f7 ff ff       	call   160 <panic>
     9a6:	8d 76 00             	lea    0x0(%esi),%esi
     9a9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000009b0 <nulterminate>:

// NUL-terminate all the counted strings.
struct cmd*
nulterminate(struct cmd *cmd)
{
     9b0:	55                   	push   %ebp
     9b1:	89 e5                	mov    %esp,%ebp
     9b3:	53                   	push   %ebx
     9b4:	83 ec 04             	sub    $0x4,%esp
     9b7:	8b 5d 08             	mov    0x8(%ebp),%ebx
  struct execcmd *ecmd;
  struct listcmd *lcmd;
  struct pipecmd *pcmd;
  struct redircmd *rcmd;

  if(cmd == 0)
     9ba:	85 db                	test   %ebx,%ebx
     9bc:	74 20                	je     9de <nulterminate+0x2e>
    return 0;

  switch(cmd->type){
     9be:	83 3b 05             	cmpl   $0x5,(%ebx)
     9c1:	77 1b                	ja     9de <nulterminate+0x2e>
     9c3:	8b 03                	mov    (%ebx),%eax
     9c5:	ff 24 85 60 12 00 00 	jmp    *0x1260(,%eax,4)
     9cc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    nulterminate(lcmd->right);
    break;

  case BACK:
    bcmd = (struct backcmd*)cmd;
    nulterminate(bcmd->cmd);
     9d0:	83 ec 0c             	sub    $0xc,%esp
     9d3:	ff 73 04             	pushl  0x4(%ebx)
     9d6:	e8 d5 ff ff ff       	call   9b0 <nulterminate>
    break;
     9db:	83 c4 10             	add    $0x10,%esp
  }
  return cmd;
}
     9de:	89 d8                	mov    %ebx,%eax
     9e0:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     9e3:	c9                   	leave  
     9e4:	c3                   	ret    
     9e5:	8d 76 00             	lea    0x0(%esi),%esi
    nulterminate(lcmd->left);
     9e8:	83 ec 0c             	sub    $0xc,%esp
     9eb:	ff 73 04             	pushl  0x4(%ebx)
     9ee:	e8 bd ff ff ff       	call   9b0 <nulterminate>
    nulterminate(lcmd->right);
     9f3:	58                   	pop    %eax
     9f4:	ff 73 08             	pushl  0x8(%ebx)
     9f7:	e8 b4 ff ff ff       	call   9b0 <nulterminate>
}
     9fc:	89 d8                	mov    %ebx,%eax
    break;
     9fe:	83 c4 10             	add    $0x10,%esp
}
     a01:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     a04:	c9                   	leave  
     a05:	c3                   	ret    
     a06:	8d 76 00             	lea    0x0(%esi),%esi
     a09:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    for(i=0; ecmd->argv[i]; i++)
     a10:	8b 4b 04             	mov    0x4(%ebx),%ecx
     a13:	8d 43 08             	lea    0x8(%ebx),%eax
     a16:	85 c9                	test   %ecx,%ecx
     a18:	74 c4                	je     9de <nulterminate+0x2e>
     a1a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      *ecmd->eargv[i] = 0;
     a20:	8b 50 24             	mov    0x24(%eax),%edx
     a23:	83 c0 04             	add    $0x4,%eax
     a26:	c6 02 00             	movb   $0x0,(%edx)
    for(i=0; ecmd->argv[i]; i++)
     a29:	8b 50 fc             	mov    -0x4(%eax),%edx
     a2c:	85 d2                	test   %edx,%edx
     a2e:	75 f0                	jne    a20 <nulterminate+0x70>
}
     a30:	89 d8                	mov    %ebx,%eax
     a32:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     a35:	c9                   	leave  
     a36:	c3                   	ret    
     a37:	89 f6                	mov    %esi,%esi
     a39:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    nulterminate(rcmd->cmd);
     a40:	83 ec 0c             	sub    $0xc,%esp
     a43:	ff 73 04             	pushl  0x4(%ebx)
     a46:	e8 65 ff ff ff       	call   9b0 <nulterminate>
    *rcmd->efile = 0;
     a4b:	8b 43 0c             	mov    0xc(%ebx),%eax
    break;
     a4e:	83 c4 10             	add    $0x10,%esp
    *rcmd->efile = 0;
     a51:	c6 00 00             	movb   $0x0,(%eax)
}
     a54:	89 d8                	mov    %ebx,%eax
     a56:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     a59:	c9                   	leave  
     a5a:	c3                   	ret    
     a5b:	90                   	nop
     a5c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000a60 <parsecmd>:
{
     a60:	55                   	push   %ebp
     a61:	89 e5                	mov    %esp,%ebp
     a63:	56                   	push   %esi
     a64:	53                   	push   %ebx
  es = s + strlen(s);
     a65:	8b 5d 08             	mov    0x8(%ebp),%ebx
     a68:	83 ec 0c             	sub    $0xc,%esp
     a6b:	53                   	push   %ebx
     a6c:	e8 df 00 00 00       	call   b50 <strlen>
  cmd = parseline(&s, es);
     a71:	59                   	pop    %ecx
  es = s + strlen(s);
     a72:	01 c3                	add    %eax,%ebx
  cmd = parseline(&s, es);
     a74:	8d 45 08             	lea    0x8(%ebp),%eax
     a77:	5e                   	pop    %esi
     a78:	53                   	push   %ebx
     a79:	50                   	push   %eax
     a7a:	e8 01 fe ff ff       	call   880 <parseline>
     a7f:	89 c6                	mov    %eax,%esi
  peek(&s, es, "");
     a81:	8d 45 08             	lea    0x8(%ebp),%eax
     a84:	83 c4 0c             	add    $0xc,%esp
     a87:	68 a9 11 00 00       	push   $0x11a9
     a8c:	53                   	push   %ebx
     a8d:	50                   	push   %eax
     a8e:	e8 4d fb ff ff       	call   5e0 <peek>
  if(s != es){
     a93:	8b 45 08             	mov    0x8(%ebp),%eax
     a96:	83 c4 10             	add    $0x10,%esp
     a99:	39 c3                	cmp    %eax,%ebx
     a9b:	75 12                	jne    aaf <parsecmd+0x4f>
  nulterminate(cmd);
     a9d:	83 ec 0c             	sub    $0xc,%esp
     aa0:	56                   	push   %esi
     aa1:	e8 0a ff ff ff       	call   9b0 <nulterminate>
}
     aa6:	8d 65 f8             	lea    -0x8(%ebp),%esp
     aa9:	89 f0                	mov    %esi,%eax
     aab:	5b                   	pop    %ebx
     aac:	5e                   	pop    %esi
     aad:	5d                   	pop    %ebp
     aae:	c3                   	ret    
    printf(2, "leftovers: %s\n", s);
     aaf:	52                   	push   %edx
     ab0:	50                   	push   %eax
     ab1:	68 22 12 00 00       	push   $0x1222
     ab6:	6a 02                	push   $0x2
     ab8:	e8 b3 03 00 00       	call   e70 <printf>
    panic("syntax");
     abd:	c7 04 24 e6 11 00 00 	movl   $0x11e6,(%esp)
     ac4:	e8 97 f6 ff ff       	call   160 <panic>
     ac9:	66 90                	xchg   %ax,%ax
     acb:	66 90                	xchg   %ax,%ax
     acd:	66 90                	xchg   %ax,%ax
     acf:	90                   	nop

00000ad0 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, const char *t)
{
     ad0:	55                   	push   %ebp
     ad1:	89 e5                	mov    %esp,%ebp
     ad3:	53                   	push   %ebx
     ad4:	8b 45 08             	mov    0x8(%ebp),%eax
     ad7:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
     ada:	89 c2                	mov    %eax,%edx
     adc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
     ae0:	83 c1 01             	add    $0x1,%ecx
     ae3:	0f b6 59 ff          	movzbl -0x1(%ecx),%ebx
     ae7:	83 c2 01             	add    $0x1,%edx
     aea:	84 db                	test   %bl,%bl
     aec:	88 5a ff             	mov    %bl,-0x1(%edx)
     aef:	75 ef                	jne    ae0 <strcpy+0x10>
    ;
  return os;
}
     af1:	5b                   	pop    %ebx
     af2:	5d                   	pop    %ebp
     af3:	c3                   	ret    
     af4:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
     afa:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

00000b00 <strcmp>:

int
strcmp(const char *p, const char *q)
{
     b00:	55                   	push   %ebp
     b01:	89 e5                	mov    %esp,%ebp
     b03:	56                   	push   %esi
     b04:	53                   	push   %ebx
     b05:	8b 55 08             	mov    0x8(%ebp),%edx
     b08:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  while(*p && *p == *q)
     b0b:	0f b6 02             	movzbl (%edx),%eax
     b0e:	0f b6 19             	movzbl (%ecx),%ebx
     b11:	84 c0                	test   %al,%al
     b13:	75 1e                	jne    b33 <strcmp+0x33>
     b15:	eb 29                	jmp    b40 <strcmp+0x40>
     b17:	89 f6                	mov    %esi,%esi
     b19:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    p++, q++;
     b20:	83 c2 01             	add    $0x1,%edx
  while(*p && *p == *q)
     b23:	0f b6 02             	movzbl (%edx),%eax
    p++, q++;
     b26:	8d 71 01             	lea    0x1(%ecx),%esi
  while(*p && *p == *q)
     b29:	0f b6 59 01          	movzbl 0x1(%ecx),%ebx
     b2d:	84 c0                	test   %al,%al
     b2f:	74 0f                	je     b40 <strcmp+0x40>
     b31:	89 f1                	mov    %esi,%ecx
     b33:	38 d8                	cmp    %bl,%al
     b35:	74 e9                	je     b20 <strcmp+0x20>
  return (uchar)*p - (uchar)*q;
     b37:	29 d8                	sub    %ebx,%eax
}
     b39:	5b                   	pop    %ebx
     b3a:	5e                   	pop    %esi
     b3b:	5d                   	pop    %ebp
     b3c:	c3                   	ret    
     b3d:	8d 76 00             	lea    0x0(%esi),%esi
  while(*p && *p == *q)
     b40:	31 c0                	xor    %eax,%eax
  return (uchar)*p - (uchar)*q;
     b42:	29 d8                	sub    %ebx,%eax
}
     b44:	5b                   	pop    %ebx
     b45:	5e                   	pop    %esi
     b46:	5d                   	pop    %ebp
     b47:	c3                   	ret    
     b48:	90                   	nop
     b49:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000b50 <strlen>:

uint
strlen(const char *s)
{
     b50:	55                   	push   %ebp
     b51:	89 e5                	mov    %esp,%ebp
     b53:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
     b56:	80 39 00             	cmpb   $0x0,(%ecx)
     b59:	74 12                	je     b6d <strlen+0x1d>
     b5b:	31 d2                	xor    %edx,%edx
     b5d:	8d 76 00             	lea    0x0(%esi),%esi
     b60:	83 c2 01             	add    $0x1,%edx
     b63:	80 3c 11 00          	cmpb   $0x0,(%ecx,%edx,1)
     b67:	89 d0                	mov    %edx,%eax
     b69:	75 f5                	jne    b60 <strlen+0x10>
    ;
  return n;
}
     b6b:	5d                   	pop    %ebp
     b6c:	c3                   	ret    
  for(n = 0; s[n]; n++)
     b6d:	31 c0                	xor    %eax,%eax
}
     b6f:	5d                   	pop    %ebp
     b70:	c3                   	ret    
     b71:	eb 0d                	jmp    b80 <memset>
     b73:	90                   	nop
     b74:	90                   	nop
     b75:	90                   	nop
     b76:	90                   	nop
     b77:	90                   	nop
     b78:	90                   	nop
     b79:	90                   	nop
     b7a:	90                   	nop
     b7b:	90                   	nop
     b7c:	90                   	nop
     b7d:	90                   	nop
     b7e:	90                   	nop
     b7f:	90                   	nop

00000b80 <memset>:

void*
memset(void *dst, int c, uint n)
{
     b80:	55                   	push   %ebp
     b81:	89 e5                	mov    %esp,%ebp
     b83:	57                   	push   %edi
     b84:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
     b87:	8b 4d 10             	mov    0x10(%ebp),%ecx
     b8a:	8b 45 0c             	mov    0xc(%ebp),%eax
     b8d:	89 d7                	mov    %edx,%edi
     b8f:	fc                   	cld    
     b90:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
     b92:	89 d0                	mov    %edx,%eax
     b94:	5f                   	pop    %edi
     b95:	5d                   	pop    %ebp
     b96:	c3                   	ret    
     b97:	89 f6                	mov    %esi,%esi
     b99:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000ba0 <strchr>:

char*
strchr(const char *s, char c)
{
     ba0:	55                   	push   %ebp
     ba1:	89 e5                	mov    %esp,%ebp
     ba3:	53                   	push   %ebx
     ba4:	8b 45 08             	mov    0x8(%ebp),%eax
     ba7:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  for(; *s; s++)
     baa:	0f b6 10             	movzbl (%eax),%edx
     bad:	84 d2                	test   %dl,%dl
     baf:	74 1d                	je     bce <strchr+0x2e>
    if(*s == c)
     bb1:	38 d3                	cmp    %dl,%bl
     bb3:	89 d9                	mov    %ebx,%ecx
     bb5:	75 0d                	jne    bc4 <strchr+0x24>
     bb7:	eb 17                	jmp    bd0 <strchr+0x30>
     bb9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     bc0:	38 ca                	cmp    %cl,%dl
     bc2:	74 0c                	je     bd0 <strchr+0x30>
  for(; *s; s++)
     bc4:	83 c0 01             	add    $0x1,%eax
     bc7:	0f b6 10             	movzbl (%eax),%edx
     bca:	84 d2                	test   %dl,%dl
     bcc:	75 f2                	jne    bc0 <strchr+0x20>
      return (char*)s;
  return 0;
     bce:	31 c0                	xor    %eax,%eax
}
     bd0:	5b                   	pop    %ebx
     bd1:	5d                   	pop    %ebp
     bd2:	c3                   	ret    
     bd3:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
     bd9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000be0 <gets>:

char*
gets(char *buf, int max)
{
     be0:	55                   	push   %ebp
     be1:	89 e5                	mov    %esp,%ebp
     be3:	57                   	push   %edi
     be4:	56                   	push   %esi
     be5:	53                   	push   %ebx
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
     be6:	31 f6                	xor    %esi,%esi
    cc = read(0, &c, 1);
     be8:	8d 7d e7             	lea    -0x19(%ebp),%edi
{
     beb:	83 ec 1c             	sub    $0x1c,%esp
  for(i=0; i+1 < max; ){
     bee:	eb 29                	jmp    c19 <gets+0x39>
    cc = read(0, &c, 1);
     bf0:	83 ec 04             	sub    $0x4,%esp
     bf3:	6a 01                	push   $0x1
     bf5:	57                   	push   %edi
     bf6:	6a 00                	push   $0x0
     bf8:	e8 2d 01 00 00       	call   d2a <read>
    if(cc < 1)
     bfd:	83 c4 10             	add    $0x10,%esp
     c00:	85 c0                	test   %eax,%eax
     c02:	7e 1d                	jle    c21 <gets+0x41>
      break;
    buf[i++] = c;
     c04:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
     c08:	8b 55 08             	mov    0x8(%ebp),%edx
     c0b:	89 de                	mov    %ebx,%esi
    if(c == '\n' || c == '\r')
     c0d:	3c 0a                	cmp    $0xa,%al
    buf[i++] = c;
     c0f:	88 44 1a ff          	mov    %al,-0x1(%edx,%ebx,1)
    if(c == '\n' || c == '\r')
     c13:	74 1b                	je     c30 <gets+0x50>
     c15:	3c 0d                	cmp    $0xd,%al
     c17:	74 17                	je     c30 <gets+0x50>
  for(i=0; i+1 < max; ){
     c19:	8d 5e 01             	lea    0x1(%esi),%ebx
     c1c:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
     c1f:	7c cf                	jl     bf0 <gets+0x10>
      break;
  }
  buf[i] = '\0';
     c21:	8b 45 08             	mov    0x8(%ebp),%eax
     c24:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
  return buf;
}
     c28:	8d 65 f4             	lea    -0xc(%ebp),%esp
     c2b:	5b                   	pop    %ebx
     c2c:	5e                   	pop    %esi
     c2d:	5f                   	pop    %edi
     c2e:	5d                   	pop    %ebp
     c2f:	c3                   	ret    
  buf[i] = '\0';
     c30:	8b 45 08             	mov    0x8(%ebp),%eax
  for(i=0; i+1 < max; ){
     c33:	89 de                	mov    %ebx,%esi
  buf[i] = '\0';
     c35:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
}
     c39:	8d 65 f4             	lea    -0xc(%ebp),%esp
     c3c:	5b                   	pop    %ebx
     c3d:	5e                   	pop    %esi
     c3e:	5f                   	pop    %edi
     c3f:	5d                   	pop    %ebp
     c40:	c3                   	ret    
     c41:	eb 0d                	jmp    c50 <stat>
     c43:	90                   	nop
     c44:	90                   	nop
     c45:	90                   	nop
     c46:	90                   	nop
     c47:	90                   	nop
     c48:	90                   	nop
     c49:	90                   	nop
     c4a:	90                   	nop
     c4b:	90                   	nop
     c4c:	90                   	nop
     c4d:	90                   	nop
     c4e:	90                   	nop
     c4f:	90                   	nop

00000c50 <stat>:

int
stat(const char *n, struct stat *st)
{
     c50:	55                   	push   %ebp
     c51:	89 e5                	mov    %esp,%ebp
     c53:	56                   	push   %esi
     c54:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
     c55:	83 ec 08             	sub    $0x8,%esp
     c58:	6a 00                	push   $0x0
     c5a:	ff 75 08             	pushl  0x8(%ebp)
     c5d:	e8 f0 00 00 00       	call   d52 <open>
  if(fd < 0)
     c62:	83 c4 10             	add    $0x10,%esp
     c65:	85 c0                	test   %eax,%eax
     c67:	78 27                	js     c90 <stat+0x40>
    return -1;
  r = fstat(fd, st);
     c69:	83 ec 08             	sub    $0x8,%esp
     c6c:	ff 75 0c             	pushl  0xc(%ebp)
     c6f:	89 c3                	mov    %eax,%ebx
     c71:	50                   	push   %eax
     c72:	e8 f3 00 00 00       	call   d6a <fstat>
  close(fd);
     c77:	89 1c 24             	mov    %ebx,(%esp)
  r = fstat(fd, st);
     c7a:	89 c6                	mov    %eax,%esi
  close(fd);
     c7c:	e8 b9 00 00 00       	call   d3a <close>
  return r;
     c81:	83 c4 10             	add    $0x10,%esp
}
     c84:	8d 65 f8             	lea    -0x8(%ebp),%esp
     c87:	89 f0                	mov    %esi,%eax
     c89:	5b                   	pop    %ebx
     c8a:	5e                   	pop    %esi
     c8b:	5d                   	pop    %ebp
     c8c:	c3                   	ret    
     c8d:	8d 76 00             	lea    0x0(%esi),%esi
    return -1;
     c90:	be ff ff ff ff       	mov    $0xffffffff,%esi
     c95:	eb ed                	jmp    c84 <stat+0x34>
     c97:	89 f6                	mov    %esi,%esi
     c99:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000ca0 <atoi>:

int
atoi(const char *s)
{
     ca0:	55                   	push   %ebp
     ca1:	89 e5                	mov    %esp,%ebp
     ca3:	53                   	push   %ebx
     ca4:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
     ca7:	0f be 11             	movsbl (%ecx),%edx
     caa:	8d 42 d0             	lea    -0x30(%edx),%eax
     cad:	3c 09                	cmp    $0x9,%al
     caf:	b8 00 00 00 00       	mov    $0x0,%eax
     cb4:	77 1f                	ja     cd5 <atoi+0x35>
     cb6:	8d 76 00             	lea    0x0(%esi),%esi
     cb9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    n = n*10 + *s++ - '0';
     cc0:	8d 04 80             	lea    (%eax,%eax,4),%eax
     cc3:	83 c1 01             	add    $0x1,%ecx
     cc6:	8d 44 42 d0          	lea    -0x30(%edx,%eax,2),%eax
  while('0' <= *s && *s <= '9')
     cca:	0f be 11             	movsbl (%ecx),%edx
     ccd:	8d 5a d0             	lea    -0x30(%edx),%ebx
     cd0:	80 fb 09             	cmp    $0x9,%bl
     cd3:	76 eb                	jbe    cc0 <atoi+0x20>
  return n;
}
     cd5:	5b                   	pop    %ebx
     cd6:	5d                   	pop    %ebp
     cd7:	c3                   	ret    
     cd8:	90                   	nop
     cd9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000ce0 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
     ce0:	55                   	push   %ebp
     ce1:	89 e5                	mov    %esp,%ebp
     ce3:	56                   	push   %esi
     ce4:	53                   	push   %ebx
     ce5:	8b 5d 10             	mov    0x10(%ebp),%ebx
     ce8:	8b 45 08             	mov    0x8(%ebp),%eax
     ceb:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
     cee:	85 db                	test   %ebx,%ebx
     cf0:	7e 14                	jle    d06 <memmove+0x26>
     cf2:	31 d2                	xor    %edx,%edx
     cf4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    *dst++ = *src++;
     cf8:	0f b6 0c 16          	movzbl (%esi,%edx,1),%ecx
     cfc:	88 0c 10             	mov    %cl,(%eax,%edx,1)
     cff:	83 c2 01             	add    $0x1,%edx
  while(n-- > 0)
     d02:	39 da                	cmp    %ebx,%edx
     d04:	75 f2                	jne    cf8 <memmove+0x18>
  return vdst;
}
     d06:	5b                   	pop    %ebx
     d07:	5e                   	pop    %esi
     d08:	5d                   	pop    %ebp
     d09:	c3                   	ret    

00000d0a <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
     d0a:	b8 01 00 00 00       	mov    $0x1,%eax
     d0f:	cd 40                	int    $0x40
     d11:	c3                   	ret    

00000d12 <exit>:
SYSCALL(exit)
     d12:	b8 02 00 00 00       	mov    $0x2,%eax
     d17:	cd 40                	int    $0x40
     d19:	c3                   	ret    

00000d1a <wait>:
SYSCALL(wait)
     d1a:	b8 03 00 00 00       	mov    $0x3,%eax
     d1f:	cd 40                	int    $0x40
     d21:	c3                   	ret    

00000d22 <pipe>:
SYSCALL(pipe)
     d22:	b8 04 00 00 00       	mov    $0x4,%eax
     d27:	cd 40                	int    $0x40
     d29:	c3                   	ret    

00000d2a <read>:
SYSCALL(read)
     d2a:	b8 05 00 00 00       	mov    $0x5,%eax
     d2f:	cd 40                	int    $0x40
     d31:	c3                   	ret    

00000d32 <write>:
SYSCALL(write)
     d32:	b8 10 00 00 00       	mov    $0x10,%eax
     d37:	cd 40                	int    $0x40
     d39:	c3                   	ret    

00000d3a <close>:
SYSCALL(close)
     d3a:	b8 15 00 00 00       	mov    $0x15,%eax
     d3f:	cd 40                	int    $0x40
     d41:	c3                   	ret    

00000d42 <kill>:
SYSCALL(kill)
     d42:	b8 06 00 00 00       	mov    $0x6,%eax
     d47:	cd 40                	int    $0x40
     d49:	c3                   	ret    

00000d4a <exec>:
SYSCALL(exec)
     d4a:	b8 07 00 00 00       	mov    $0x7,%eax
     d4f:	cd 40                	int    $0x40
     d51:	c3                   	ret    

00000d52 <open>:
SYSCALL(open)
     d52:	b8 0f 00 00 00       	mov    $0xf,%eax
     d57:	cd 40                	int    $0x40
     d59:	c3                   	ret    

00000d5a <mknod>:
SYSCALL(mknod)
     d5a:	b8 11 00 00 00       	mov    $0x11,%eax
     d5f:	cd 40                	int    $0x40
     d61:	c3                   	ret    

00000d62 <unlink>:
SYSCALL(unlink)
     d62:	b8 12 00 00 00       	mov    $0x12,%eax
     d67:	cd 40                	int    $0x40
     d69:	c3                   	ret    

00000d6a <fstat>:
SYSCALL(fstat)
     d6a:	b8 08 00 00 00       	mov    $0x8,%eax
     d6f:	cd 40                	int    $0x40
     d71:	c3                   	ret    

00000d72 <link>:
SYSCALL(link)
     d72:	b8 13 00 00 00       	mov    $0x13,%eax
     d77:	cd 40                	int    $0x40
     d79:	c3                   	ret    

00000d7a <mkdir>:
SYSCALL(mkdir)
     d7a:	b8 14 00 00 00       	mov    $0x14,%eax
     d7f:	cd 40                	int    $0x40
     d81:	c3                   	ret    

00000d82 <chdir>:
SYSCALL(chdir)
     d82:	b8 09 00 00 00       	mov    $0x9,%eax
     d87:	cd 40                	int    $0x40
     d89:	c3                   	ret    

00000d8a <dup>:
SYSCALL(dup)
     d8a:	b8 0a 00 00 00       	mov    $0xa,%eax
     d8f:	cd 40                	int    $0x40
     d91:	c3                   	ret    

00000d92 <getpid>:
SYSCALL(getpid)
     d92:	b8 0b 00 00 00       	mov    $0xb,%eax
     d97:	cd 40                	int    $0x40
     d99:	c3                   	ret    

00000d9a <sbrk>:
SYSCALL(sbrk)
     d9a:	b8 0c 00 00 00       	mov    $0xc,%eax
     d9f:	cd 40                	int    $0x40
     da1:	c3                   	ret    

00000da2 <sleep>:
SYSCALL(sleep)
     da2:	b8 0d 00 00 00       	mov    $0xd,%eax
     da7:	cd 40                	int    $0x40
     da9:	c3                   	ret    

00000daa <uptime>:
SYSCALL(uptime)
     daa:	b8 0e 00 00 00       	mov    $0xe,%eax
     daf:	cd 40                	int    $0x40
     db1:	c3                   	ret    

00000db2 <fwait>:
SYSCALL(fwait)
     db2:	b8 16 00 00 00       	mov    $0x16,%eax
     db7:	cd 40                	int    $0x40
     db9:	c3                   	ret    

00000dba <fwake>:
     dba:	b8 17 00 00 00       	mov    $0x17,%eax
     dbf:	cd 40                	int    $0x40
     dc1:	c3                   	ret    
     dc2:	66 90                	xchg   %ax,%ax
     dc4:	66 90                	xchg   %ax,%ax
     dc6:	66 90                	xchg   %ax,%ax
     dc8:	66 90                	xchg   %ax,%ax
     dca:	66 90                	xchg   %ax,%ax
     dcc:	66 90                	xchg   %ax,%ax
     dce:	66 90                	xchg   %ax,%ax

00000dd0 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
     dd0:	55                   	push   %ebp
     dd1:	89 e5                	mov    %esp,%ebp
     dd3:	57                   	push   %edi
     dd4:	56                   	push   %esi
     dd5:	53                   	push   %ebx
     dd6:	89 c6                	mov    %eax,%esi
     dd8:	83 ec 3c             	sub    $0x3c,%esp
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
     ddb:	8b 5d 08             	mov    0x8(%ebp),%ebx
     dde:	85 db                	test   %ebx,%ebx
     de0:	74 7e                	je     e60 <printint+0x90>
     de2:	89 d0                	mov    %edx,%eax
     de4:	c1 e8 1f             	shr    $0x1f,%eax
     de7:	84 c0                	test   %al,%al
     de9:	74 75                	je     e60 <printint+0x90>
    neg = 1;
    x = -xx;
     deb:	89 d0                	mov    %edx,%eax
    neg = 1;
     ded:	c7 45 c4 01 00 00 00 	movl   $0x1,-0x3c(%ebp)
    x = -xx;
     df4:	f7 d8                	neg    %eax
     df6:	89 75 c0             	mov    %esi,-0x40(%ebp)
  } else {
    x = xx;
  }

  i = 0;
     df9:	31 ff                	xor    %edi,%edi
     dfb:	8d 5d d7             	lea    -0x29(%ebp),%ebx
     dfe:	89 ce                	mov    %ecx,%esi
     e00:	eb 08                	jmp    e0a <printint+0x3a>
     e02:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  do{
    buf[i++] = digits[x % base];
     e08:	89 cf                	mov    %ecx,%edi
     e0a:	31 d2                	xor    %edx,%edx
     e0c:	8d 4f 01             	lea    0x1(%edi),%ecx
     e0f:	f7 f6                	div    %esi
     e11:	0f b6 92 80 12 00 00 	movzbl 0x1280(%edx),%edx
  }while((x /= base) != 0);
     e18:	85 c0                	test   %eax,%eax
    buf[i++] = digits[x % base];
     e1a:	88 14 0b             	mov    %dl,(%ebx,%ecx,1)
  }while((x /= base) != 0);
     e1d:	75 e9                	jne    e08 <printint+0x38>
  if(neg)
     e1f:	8b 45 c4             	mov    -0x3c(%ebp),%eax
     e22:	8b 75 c0             	mov    -0x40(%ebp),%esi
     e25:	85 c0                	test   %eax,%eax
     e27:	74 08                	je     e31 <printint+0x61>
    buf[i++] = '-';
     e29:	c6 44 0d d8 2d       	movb   $0x2d,-0x28(%ebp,%ecx,1)
     e2e:	8d 4f 02             	lea    0x2(%edi),%ecx

  while(--i >= 0)
     e31:	8d 79 ff             	lea    -0x1(%ecx),%edi
     e34:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
     e38:	0f b6 44 3d d8       	movzbl -0x28(%ebp,%edi,1),%eax
  write(fd, &c, 1);
     e3d:	83 ec 04             	sub    $0x4,%esp
  while(--i >= 0)
     e40:	83 ef 01             	sub    $0x1,%edi
  write(fd, &c, 1);
     e43:	6a 01                	push   $0x1
     e45:	53                   	push   %ebx
     e46:	56                   	push   %esi
     e47:	88 45 d7             	mov    %al,-0x29(%ebp)
     e4a:	e8 e3 fe ff ff       	call   d32 <write>
  while(--i >= 0)
     e4f:	83 c4 10             	add    $0x10,%esp
     e52:	83 ff ff             	cmp    $0xffffffff,%edi
     e55:	75 e1                	jne    e38 <printint+0x68>
    putc(fd, buf[i]);
}
     e57:	8d 65 f4             	lea    -0xc(%ebp),%esp
     e5a:	5b                   	pop    %ebx
     e5b:	5e                   	pop    %esi
     e5c:	5f                   	pop    %edi
     e5d:	5d                   	pop    %ebp
     e5e:	c3                   	ret    
     e5f:	90                   	nop
    x = xx;
     e60:	89 d0                	mov    %edx,%eax
  neg = 0;
     e62:	c7 45 c4 00 00 00 00 	movl   $0x0,-0x3c(%ebp)
     e69:	eb 8b                	jmp    df6 <printint+0x26>
     e6b:	90                   	nop
     e6c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000e70 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
     e70:	55                   	push   %ebp
     e71:	89 e5                	mov    %esp,%ebp
     e73:	57                   	push   %edi
     e74:	56                   	push   %esi
     e75:	53                   	push   %ebx
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
     e76:	8d 45 10             	lea    0x10(%ebp),%eax
{
     e79:	83 ec 2c             	sub    $0x2c,%esp
  for(i = 0; fmt[i]; i++){
     e7c:	8b 75 0c             	mov    0xc(%ebp),%esi
{
     e7f:	8b 7d 08             	mov    0x8(%ebp),%edi
  for(i = 0; fmt[i]; i++){
     e82:	89 45 d0             	mov    %eax,-0x30(%ebp)
     e85:	0f b6 1e             	movzbl (%esi),%ebx
     e88:	83 c6 01             	add    $0x1,%esi
     e8b:	84 db                	test   %bl,%bl
     e8d:	0f 84 b0 00 00 00    	je     f43 <printf+0xd3>
     e93:	31 d2                	xor    %edx,%edx
     e95:	eb 39                	jmp    ed0 <printf+0x60>
     e97:	89 f6                	mov    %esi,%esi
     e99:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
     ea0:	83 f8 25             	cmp    $0x25,%eax
     ea3:	89 55 d4             	mov    %edx,-0x2c(%ebp)
        state = '%';
     ea6:	ba 25 00 00 00       	mov    $0x25,%edx
      if(c == '%'){
     eab:	74 18                	je     ec5 <printf+0x55>
  write(fd, &c, 1);
     ead:	8d 45 e2             	lea    -0x1e(%ebp),%eax
     eb0:	83 ec 04             	sub    $0x4,%esp
     eb3:	88 5d e2             	mov    %bl,-0x1e(%ebp)
     eb6:	6a 01                	push   $0x1
     eb8:	50                   	push   %eax
     eb9:	57                   	push   %edi
     eba:	e8 73 fe ff ff       	call   d32 <write>
     ebf:	8b 55 d4             	mov    -0x2c(%ebp),%edx
     ec2:	83 c4 10             	add    $0x10,%esp
     ec5:	83 c6 01             	add    $0x1,%esi
  for(i = 0; fmt[i]; i++){
     ec8:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
     ecc:	84 db                	test   %bl,%bl
     ece:	74 73                	je     f43 <printf+0xd3>
    if(state == 0){
     ed0:	85 d2                	test   %edx,%edx
    c = fmt[i] & 0xff;
     ed2:	0f be cb             	movsbl %bl,%ecx
     ed5:	0f b6 c3             	movzbl %bl,%eax
    if(state == 0){
     ed8:	74 c6                	je     ea0 <printf+0x30>
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
     eda:	83 fa 25             	cmp    $0x25,%edx
     edd:	75 e6                	jne    ec5 <printf+0x55>
      if(c == 'd'){
     edf:	83 f8 64             	cmp    $0x64,%eax
     ee2:	0f 84 f8 00 00 00    	je     fe0 <printf+0x170>
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
     ee8:	81 e1 f7 00 00 00    	and    $0xf7,%ecx
     eee:	83 f9 70             	cmp    $0x70,%ecx
     ef1:	74 5d                	je     f50 <printf+0xe0>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
     ef3:	83 f8 73             	cmp    $0x73,%eax
     ef6:	0f 84 84 00 00 00    	je     f80 <printf+0x110>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
     efc:	83 f8 63             	cmp    $0x63,%eax
     eff:	0f 84 ea 00 00 00    	je     fef <printf+0x17f>
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
     f05:	83 f8 25             	cmp    $0x25,%eax
     f08:	0f 84 c2 00 00 00    	je     fd0 <printf+0x160>
  write(fd, &c, 1);
     f0e:	8d 45 e7             	lea    -0x19(%ebp),%eax
     f11:	83 ec 04             	sub    $0x4,%esp
     f14:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
     f18:	6a 01                	push   $0x1
     f1a:	50                   	push   %eax
     f1b:	57                   	push   %edi
     f1c:	e8 11 fe ff ff       	call   d32 <write>
     f21:	83 c4 0c             	add    $0xc,%esp
     f24:	8d 45 e6             	lea    -0x1a(%ebp),%eax
     f27:	88 5d e6             	mov    %bl,-0x1a(%ebp)
     f2a:	6a 01                	push   $0x1
     f2c:	50                   	push   %eax
     f2d:	57                   	push   %edi
     f2e:	83 c6 01             	add    $0x1,%esi
     f31:	e8 fc fd ff ff       	call   d32 <write>
  for(i = 0; fmt[i]; i++){
     f36:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
  write(fd, &c, 1);
     f3a:	83 c4 10             	add    $0x10,%esp
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
     f3d:	31 d2                	xor    %edx,%edx
  for(i = 0; fmt[i]; i++){
     f3f:	84 db                	test   %bl,%bl
     f41:	75 8d                	jne    ed0 <printf+0x60>
    }
  }
}
     f43:	8d 65 f4             	lea    -0xc(%ebp),%esp
     f46:	5b                   	pop    %ebx
     f47:	5e                   	pop    %esi
     f48:	5f                   	pop    %edi
     f49:	5d                   	pop    %ebp
     f4a:	c3                   	ret    
     f4b:	90                   	nop
     f4c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        printint(fd, *ap, 16, 0);
     f50:	83 ec 0c             	sub    $0xc,%esp
     f53:	b9 10 00 00 00       	mov    $0x10,%ecx
     f58:	6a 00                	push   $0x0
     f5a:	8b 5d d0             	mov    -0x30(%ebp),%ebx
     f5d:	89 f8                	mov    %edi,%eax
     f5f:	8b 13                	mov    (%ebx),%edx
     f61:	e8 6a fe ff ff       	call   dd0 <printint>
        ap++;
     f66:	89 d8                	mov    %ebx,%eax
     f68:	83 c4 10             	add    $0x10,%esp
      state = 0;
     f6b:	31 d2                	xor    %edx,%edx
        ap++;
     f6d:	83 c0 04             	add    $0x4,%eax
     f70:	89 45 d0             	mov    %eax,-0x30(%ebp)
     f73:	e9 4d ff ff ff       	jmp    ec5 <printf+0x55>
     f78:	90                   	nop
     f79:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        s = (char*)*ap;
     f80:	8b 45 d0             	mov    -0x30(%ebp),%eax
     f83:	8b 18                	mov    (%eax),%ebx
        ap++;
     f85:	83 c0 04             	add    $0x4,%eax
     f88:	89 45 d0             	mov    %eax,-0x30(%ebp)
        if(s == 0)
     f8b:	85 db                	test   %ebx,%ebx
     f8d:	74 7c                	je     100b <printf+0x19b>
        while(*s != 0){
     f8f:	0f b6 03             	movzbl (%ebx),%eax
     f92:	84 c0                	test   %al,%al
     f94:	74 29                	je     fbf <printf+0x14f>
     f96:	8d 76 00             	lea    0x0(%esi),%esi
     f99:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
     fa0:	88 45 e3             	mov    %al,-0x1d(%ebp)
  write(fd, &c, 1);
     fa3:	8d 45 e3             	lea    -0x1d(%ebp),%eax
     fa6:	83 ec 04             	sub    $0x4,%esp
     fa9:	6a 01                	push   $0x1
          s++;
     fab:	83 c3 01             	add    $0x1,%ebx
  write(fd, &c, 1);
     fae:	50                   	push   %eax
     faf:	57                   	push   %edi
     fb0:	e8 7d fd ff ff       	call   d32 <write>
        while(*s != 0){
     fb5:	0f b6 03             	movzbl (%ebx),%eax
     fb8:	83 c4 10             	add    $0x10,%esp
     fbb:	84 c0                	test   %al,%al
     fbd:	75 e1                	jne    fa0 <printf+0x130>
      state = 0;
     fbf:	31 d2                	xor    %edx,%edx
     fc1:	e9 ff fe ff ff       	jmp    ec5 <printf+0x55>
     fc6:	8d 76 00             	lea    0x0(%esi),%esi
     fc9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
  write(fd, &c, 1);
     fd0:	83 ec 04             	sub    $0x4,%esp
     fd3:	88 5d e5             	mov    %bl,-0x1b(%ebp)
     fd6:	8d 45 e5             	lea    -0x1b(%ebp),%eax
     fd9:	6a 01                	push   $0x1
     fdb:	e9 4c ff ff ff       	jmp    f2c <printf+0xbc>
        printint(fd, *ap, 10, 1);
     fe0:	83 ec 0c             	sub    $0xc,%esp
     fe3:	b9 0a 00 00 00       	mov    $0xa,%ecx
     fe8:	6a 01                	push   $0x1
     fea:	e9 6b ff ff ff       	jmp    f5a <printf+0xea>
        putc(fd, *ap);
     fef:	8b 5d d0             	mov    -0x30(%ebp),%ebx
  write(fd, &c, 1);
     ff2:	83 ec 04             	sub    $0x4,%esp
        putc(fd, *ap);
     ff5:	8b 03                	mov    (%ebx),%eax
  write(fd, &c, 1);
     ff7:	6a 01                	push   $0x1
        putc(fd, *ap);
     ff9:	88 45 e4             	mov    %al,-0x1c(%ebp)
  write(fd, &c, 1);
     ffc:	8d 45 e4             	lea    -0x1c(%ebp),%eax
     fff:	50                   	push   %eax
    1000:	57                   	push   %edi
    1001:	e8 2c fd ff ff       	call   d32 <write>
    1006:	e9 5b ff ff ff       	jmp    f66 <printf+0xf6>
        while(*s != 0){
    100b:	b8 28 00 00 00       	mov    $0x28,%eax
          s = "(null)";
    1010:	bb 78 12 00 00       	mov    $0x1278,%ebx
    1015:	eb 89                	jmp    fa0 <printf+0x130>
    1017:	66 90                	xchg   %ax,%ax
    1019:	66 90                	xchg   %ax,%ax
    101b:	66 90                	xchg   %ax,%ax
    101d:	66 90                	xchg   %ax,%ax
    101f:	90                   	nop

00001020 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
    1020:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    1021:	a1 a4 18 00 00       	mov    0x18a4,%eax
{
    1026:	89 e5                	mov    %esp,%ebp
    1028:	57                   	push   %edi
    1029:	56                   	push   %esi
    102a:	53                   	push   %ebx
    102b:	8b 5d 08             	mov    0x8(%ebp),%ebx
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    102e:	8b 10                	mov    (%eax),%edx
  bp = (Header*)ap - 1;
    1030:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    1033:	39 c8                	cmp    %ecx,%eax
    1035:	73 19                	jae    1050 <free+0x30>
    1037:	89 f6                	mov    %esi,%esi
    1039:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    1040:	39 d1                	cmp    %edx,%ecx
    1042:	72 1c                	jb     1060 <free+0x40>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    1044:	39 d0                	cmp    %edx,%eax
    1046:	73 18                	jae    1060 <free+0x40>
{
    1048:	89 d0                	mov    %edx,%eax
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    104a:	39 c8                	cmp    %ecx,%eax
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    104c:	8b 10                	mov    (%eax),%edx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    104e:	72 f0                	jb     1040 <free+0x20>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    1050:	39 d0                	cmp    %edx,%eax
    1052:	72 f4                	jb     1048 <free+0x28>
    1054:	39 d1                	cmp    %edx,%ecx
    1056:	73 f0                	jae    1048 <free+0x28>
    1058:	90                   	nop
    1059:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      break;
  if(bp + bp->s.size == p->s.ptr){
    1060:	8b 73 fc             	mov    -0x4(%ebx),%esi
    1063:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
    1066:	39 fa                	cmp    %edi,%edx
    1068:	74 19                	je     1083 <free+0x63>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
    106a:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
    106d:	8b 50 04             	mov    0x4(%eax),%edx
    1070:	8d 34 d0             	lea    (%eax,%edx,8),%esi
    1073:	39 f1                	cmp    %esi,%ecx
    1075:	74 23                	je     109a <free+0x7a>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
    1077:	89 08                	mov    %ecx,(%eax)
  freep = p;
    1079:	a3 a4 18 00 00       	mov    %eax,0x18a4
}
    107e:	5b                   	pop    %ebx
    107f:	5e                   	pop    %esi
    1080:	5f                   	pop    %edi
    1081:	5d                   	pop    %ebp
    1082:	c3                   	ret    
    bp->s.size += p->s.ptr->s.size;
    1083:	03 72 04             	add    0x4(%edx),%esi
    1086:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
    1089:	8b 10                	mov    (%eax),%edx
    108b:	8b 12                	mov    (%edx),%edx
    108d:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
    1090:	8b 50 04             	mov    0x4(%eax),%edx
    1093:	8d 34 d0             	lea    (%eax,%edx,8),%esi
    1096:	39 f1                	cmp    %esi,%ecx
    1098:	75 dd                	jne    1077 <free+0x57>
    p->s.size += bp->s.size;
    109a:	03 53 fc             	add    -0x4(%ebx),%edx
  freep = p;
    109d:	a3 a4 18 00 00       	mov    %eax,0x18a4
    p->s.size += bp->s.size;
    10a2:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
    10a5:	8b 53 f8             	mov    -0x8(%ebx),%edx
    10a8:	89 10                	mov    %edx,(%eax)
}
    10aa:	5b                   	pop    %ebx
    10ab:	5e                   	pop    %esi
    10ac:	5f                   	pop    %edi
    10ad:	5d                   	pop    %ebp
    10ae:	c3                   	ret    
    10af:	90                   	nop

000010b0 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
    10b0:	55                   	push   %ebp
    10b1:	89 e5                	mov    %esp,%ebp
    10b3:	57                   	push   %edi
    10b4:	56                   	push   %esi
    10b5:	53                   	push   %ebx
    10b6:	83 ec 0c             	sub    $0xc,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
    10b9:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
    10bc:	8b 15 a4 18 00 00    	mov    0x18a4,%edx
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
    10c2:	8d 78 07             	lea    0x7(%eax),%edi
    10c5:	c1 ef 03             	shr    $0x3,%edi
    10c8:	83 c7 01             	add    $0x1,%edi
  if((prevp = freep) == 0){
    10cb:	85 d2                	test   %edx,%edx
    10cd:	0f 84 93 00 00 00    	je     1166 <malloc+0xb6>
    10d3:	8b 02                	mov    (%edx),%eax
    10d5:	8b 48 04             	mov    0x4(%eax),%ecx
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
    10d8:	39 cf                	cmp    %ecx,%edi
    10da:	76 64                	jbe    1140 <malloc+0x90>
    10dc:	81 ff 00 10 00 00    	cmp    $0x1000,%edi
    10e2:	bb 00 10 00 00       	mov    $0x1000,%ebx
    10e7:	0f 43 df             	cmovae %edi,%ebx
  p = sbrk(nu * sizeof(Header));
    10ea:	8d 34 dd 00 00 00 00 	lea    0x0(,%ebx,8),%esi
    10f1:	eb 0e                	jmp    1101 <malloc+0x51>
    10f3:	90                   	nop
    10f4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    10f8:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
    10fa:	8b 48 04             	mov    0x4(%eax),%ecx
    10fd:	39 cf                	cmp    %ecx,%edi
    10ff:	76 3f                	jbe    1140 <malloc+0x90>
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
    1101:	39 05 a4 18 00 00    	cmp    %eax,0x18a4
    1107:	89 c2                	mov    %eax,%edx
    1109:	75 ed                	jne    10f8 <malloc+0x48>
  p = sbrk(nu * sizeof(Header));
    110b:	83 ec 0c             	sub    $0xc,%esp
    110e:	56                   	push   %esi
    110f:	e8 86 fc ff ff       	call   d9a <sbrk>
  if(p == (char*)-1)
    1114:	83 c4 10             	add    $0x10,%esp
    1117:	83 f8 ff             	cmp    $0xffffffff,%eax
    111a:	74 1c                	je     1138 <malloc+0x88>
  hp->s.size = nu;
    111c:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
    111f:	83 ec 0c             	sub    $0xc,%esp
    1122:	83 c0 08             	add    $0x8,%eax
    1125:	50                   	push   %eax
    1126:	e8 f5 fe ff ff       	call   1020 <free>
  return freep;
    112b:	8b 15 a4 18 00 00    	mov    0x18a4,%edx
      if((p = morecore(nunits)) == 0)
    1131:	83 c4 10             	add    $0x10,%esp
    1134:	85 d2                	test   %edx,%edx
    1136:	75 c0                	jne    10f8 <malloc+0x48>
        return 0;
    1138:	31 c0                	xor    %eax,%eax
    113a:	eb 1c                	jmp    1158 <malloc+0xa8>
    113c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
      if(p->s.size == nunits)
    1140:	39 cf                	cmp    %ecx,%edi
    1142:	74 1c                	je     1160 <malloc+0xb0>
        p->s.size -= nunits;
    1144:	29 f9                	sub    %edi,%ecx
    1146:	89 48 04             	mov    %ecx,0x4(%eax)
        p += p->s.size;
    1149:	8d 04 c8             	lea    (%eax,%ecx,8),%eax
        p->s.size = nunits;
    114c:	89 78 04             	mov    %edi,0x4(%eax)
      freep = prevp;
    114f:	89 15 a4 18 00 00    	mov    %edx,0x18a4
      return (void*)(p + 1);
    1155:	83 c0 08             	add    $0x8,%eax
  }
}
    1158:	8d 65 f4             	lea    -0xc(%ebp),%esp
    115b:	5b                   	pop    %ebx
    115c:	5e                   	pop    %esi
    115d:	5f                   	pop    %edi
    115e:	5d                   	pop    %ebp
    115f:	c3                   	ret    
        prevp->s.ptr = p->s.ptr;
    1160:	8b 08                	mov    (%eax),%ecx
    1162:	89 0a                	mov    %ecx,(%edx)
    1164:	eb e9                	jmp    114f <malloc+0x9f>
    base.s.ptr = freep = prevp = &base;
    1166:	c7 05 a4 18 00 00 a8 	movl   $0x18a8,0x18a4
    116d:	18 00 00 
    1170:	c7 05 a8 18 00 00 a8 	movl   $0x18a8,0x18a8
    1177:	18 00 00 
    base.s.size = 0;
    117a:	b8 a8 18 00 00       	mov    $0x18a8,%eax
    117f:	c7 05 ac 18 00 00 00 	movl   $0x0,0x18ac
    1186:	00 00 00 
    1189:	e9 4e ff ff ff       	jmp    10dc <malloc+0x2c>
