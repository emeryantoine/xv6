
_echo:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
#include "stat.h"
#include "user.h"

int
main(int argc, char *argv[])
{
   0:	8d 4c 24 04          	lea    0x4(%esp),%ecx
   4:	83 e4 f0             	and    $0xfffffff0,%esp
   7:	ff 71 fc             	pushl  -0x4(%ecx)
   a:	55                   	push   %ebp
   b:	89 e5                	mov    %esp,%ebp
   d:	57                   	push   %edi
   e:	56                   	push   %esi
   f:	53                   	push   %ebx
  10:	51                   	push   %ecx
  11:	83 ec 08             	sub    $0x8,%esp
  14:	8b 31                	mov    (%ecx),%esi
  16:	8b 79 04             	mov    0x4(%ecx),%edi
  int i;

  for(i = 1; i < argc; i++)
  19:	83 fe 01             	cmp    $0x1,%esi
  1c:	7e 41                	jle    5f <main+0x5f>
  1e:	bb 01 00 00 00       	mov    $0x1,%ebx
  23:	eb 1b                	jmp    40 <main+0x40>
  25:	8d 76 00             	lea    0x0(%esi),%esi
    printf(1, "%s%s", argv[i], i+1 < argc ? " " : "\n");
  28:	68 30 07 00 00       	push   $0x730
  2d:	ff 74 9f fc          	pushl  -0x4(%edi,%ebx,4)
  31:	68 32 07 00 00       	push   $0x732
  36:	6a 01                	push   $0x1
  38:	e8 d3 03 00 00       	call   410 <printf>
  3d:	83 c4 10             	add    $0x10,%esp
  40:	83 c3 01             	add    $0x1,%ebx
  43:	39 de                	cmp    %ebx,%esi
  45:	75 e1                	jne    28 <main+0x28>
  47:	68 37 07 00 00       	push   $0x737
  4c:	ff 74 b7 fc          	pushl  -0x4(%edi,%esi,4)
  50:	68 32 07 00 00       	push   $0x732
  55:	6a 01                	push   $0x1
  57:	e8 b4 03 00 00       	call   410 <printf>
  5c:	83 c4 10             	add    $0x10,%esp
  exit();
  5f:	e8 4e 02 00 00       	call   2b2 <exit>
  64:	66 90                	xchg   %ax,%ax
  66:	66 90                	xchg   %ax,%ax
  68:	66 90                	xchg   %ax,%ax
  6a:	66 90                	xchg   %ax,%ax
  6c:	66 90                	xchg   %ax,%ax
  6e:	66 90                	xchg   %ax,%ax

00000070 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, const char *t)
{
  70:	55                   	push   %ebp
  71:	89 e5                	mov    %esp,%ebp
  73:	53                   	push   %ebx
  74:	8b 45 08             	mov    0x8(%ebp),%eax
  77:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
  7a:	89 c2                	mov    %eax,%edx
  7c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  80:	83 c1 01             	add    $0x1,%ecx
  83:	0f b6 59 ff          	movzbl -0x1(%ecx),%ebx
  87:	83 c2 01             	add    $0x1,%edx
  8a:	84 db                	test   %bl,%bl
  8c:	88 5a ff             	mov    %bl,-0x1(%edx)
  8f:	75 ef                	jne    80 <strcpy+0x10>
    ;
  return os;
}
  91:	5b                   	pop    %ebx
  92:	5d                   	pop    %ebp
  93:	c3                   	ret    
  94:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  9a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

000000a0 <strcmp>:

int
strcmp(const char *p, const char *q)
{
  a0:	55                   	push   %ebp
  a1:	89 e5                	mov    %esp,%ebp
  a3:	56                   	push   %esi
  a4:	53                   	push   %ebx
  a5:	8b 55 08             	mov    0x8(%ebp),%edx
  a8:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  while(*p && *p == *q)
  ab:	0f b6 02             	movzbl (%edx),%eax
  ae:	0f b6 19             	movzbl (%ecx),%ebx
  b1:	84 c0                	test   %al,%al
  b3:	75 1e                	jne    d3 <strcmp+0x33>
  b5:	eb 29                	jmp    e0 <strcmp+0x40>
  b7:	89 f6                	mov    %esi,%esi
  b9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    p++, q++;
  c0:	83 c2 01             	add    $0x1,%edx
  while(*p && *p == *q)
  c3:	0f b6 02             	movzbl (%edx),%eax
    p++, q++;
  c6:	8d 71 01             	lea    0x1(%ecx),%esi
  while(*p && *p == *q)
  c9:	0f b6 59 01          	movzbl 0x1(%ecx),%ebx
  cd:	84 c0                	test   %al,%al
  cf:	74 0f                	je     e0 <strcmp+0x40>
  d1:	89 f1                	mov    %esi,%ecx
  d3:	38 d8                	cmp    %bl,%al
  d5:	74 e9                	je     c0 <strcmp+0x20>
  return (uchar)*p - (uchar)*q;
  d7:	29 d8                	sub    %ebx,%eax
}
  d9:	5b                   	pop    %ebx
  da:	5e                   	pop    %esi
  db:	5d                   	pop    %ebp
  dc:	c3                   	ret    
  dd:	8d 76 00             	lea    0x0(%esi),%esi
  while(*p && *p == *q)
  e0:	31 c0                	xor    %eax,%eax
  return (uchar)*p - (uchar)*q;
  e2:	29 d8                	sub    %ebx,%eax
}
  e4:	5b                   	pop    %ebx
  e5:	5e                   	pop    %esi
  e6:	5d                   	pop    %ebp
  e7:	c3                   	ret    
  e8:	90                   	nop
  e9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

000000f0 <strlen>:

uint
strlen(const char *s)
{
  f0:	55                   	push   %ebp
  f1:	89 e5                	mov    %esp,%ebp
  f3:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
  f6:	80 39 00             	cmpb   $0x0,(%ecx)
  f9:	74 12                	je     10d <strlen+0x1d>
  fb:	31 d2                	xor    %edx,%edx
  fd:	8d 76 00             	lea    0x0(%esi),%esi
 100:	83 c2 01             	add    $0x1,%edx
 103:	80 3c 11 00          	cmpb   $0x0,(%ecx,%edx,1)
 107:	89 d0                	mov    %edx,%eax
 109:	75 f5                	jne    100 <strlen+0x10>
    ;
  return n;
}
 10b:	5d                   	pop    %ebp
 10c:	c3                   	ret    
  for(n = 0; s[n]; n++)
 10d:	31 c0                	xor    %eax,%eax
}
 10f:	5d                   	pop    %ebp
 110:	c3                   	ret    
 111:	eb 0d                	jmp    120 <memset>
 113:	90                   	nop
 114:	90                   	nop
 115:	90                   	nop
 116:	90                   	nop
 117:	90                   	nop
 118:	90                   	nop
 119:	90                   	nop
 11a:	90                   	nop
 11b:	90                   	nop
 11c:	90                   	nop
 11d:	90                   	nop
 11e:	90                   	nop
 11f:	90                   	nop

00000120 <memset>:

void*
memset(void *dst, int c, uint n)
{
 120:	55                   	push   %ebp
 121:	89 e5                	mov    %esp,%ebp
 123:	57                   	push   %edi
 124:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 127:	8b 4d 10             	mov    0x10(%ebp),%ecx
 12a:	8b 45 0c             	mov    0xc(%ebp),%eax
 12d:	89 d7                	mov    %edx,%edi
 12f:	fc                   	cld    
 130:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 132:	89 d0                	mov    %edx,%eax
 134:	5f                   	pop    %edi
 135:	5d                   	pop    %ebp
 136:	c3                   	ret    
 137:	89 f6                	mov    %esi,%esi
 139:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000140 <strchr>:

char*
strchr(const char *s, char c)
{
 140:	55                   	push   %ebp
 141:	89 e5                	mov    %esp,%ebp
 143:	53                   	push   %ebx
 144:	8b 45 08             	mov    0x8(%ebp),%eax
 147:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  for(; *s; s++)
 14a:	0f b6 10             	movzbl (%eax),%edx
 14d:	84 d2                	test   %dl,%dl
 14f:	74 1d                	je     16e <strchr+0x2e>
    if(*s == c)
 151:	38 d3                	cmp    %dl,%bl
 153:	89 d9                	mov    %ebx,%ecx
 155:	75 0d                	jne    164 <strchr+0x24>
 157:	eb 17                	jmp    170 <strchr+0x30>
 159:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 160:	38 ca                	cmp    %cl,%dl
 162:	74 0c                	je     170 <strchr+0x30>
  for(; *s; s++)
 164:	83 c0 01             	add    $0x1,%eax
 167:	0f b6 10             	movzbl (%eax),%edx
 16a:	84 d2                	test   %dl,%dl
 16c:	75 f2                	jne    160 <strchr+0x20>
      return (char*)s;
  return 0;
 16e:	31 c0                	xor    %eax,%eax
}
 170:	5b                   	pop    %ebx
 171:	5d                   	pop    %ebp
 172:	c3                   	ret    
 173:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 179:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000180 <gets>:

char*
gets(char *buf, int max)
{
 180:	55                   	push   %ebp
 181:	89 e5                	mov    %esp,%ebp
 183:	57                   	push   %edi
 184:	56                   	push   %esi
 185:	53                   	push   %ebx
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 186:	31 f6                	xor    %esi,%esi
    cc = read(0, &c, 1);
 188:	8d 7d e7             	lea    -0x19(%ebp),%edi
{
 18b:	83 ec 1c             	sub    $0x1c,%esp
  for(i=0; i+1 < max; ){
 18e:	eb 29                	jmp    1b9 <gets+0x39>
    cc = read(0, &c, 1);
 190:	83 ec 04             	sub    $0x4,%esp
 193:	6a 01                	push   $0x1
 195:	57                   	push   %edi
 196:	6a 00                	push   $0x0
 198:	e8 2d 01 00 00       	call   2ca <read>
    if(cc < 1)
 19d:	83 c4 10             	add    $0x10,%esp
 1a0:	85 c0                	test   %eax,%eax
 1a2:	7e 1d                	jle    1c1 <gets+0x41>
      break;
    buf[i++] = c;
 1a4:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 1a8:	8b 55 08             	mov    0x8(%ebp),%edx
 1ab:	89 de                	mov    %ebx,%esi
    if(c == '\n' || c == '\r')
 1ad:	3c 0a                	cmp    $0xa,%al
    buf[i++] = c;
 1af:	88 44 1a ff          	mov    %al,-0x1(%edx,%ebx,1)
    if(c == '\n' || c == '\r')
 1b3:	74 1b                	je     1d0 <gets+0x50>
 1b5:	3c 0d                	cmp    $0xd,%al
 1b7:	74 17                	je     1d0 <gets+0x50>
  for(i=0; i+1 < max; ){
 1b9:	8d 5e 01             	lea    0x1(%esi),%ebx
 1bc:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 1bf:	7c cf                	jl     190 <gets+0x10>
      break;
  }
  buf[i] = '\0';
 1c1:	8b 45 08             	mov    0x8(%ebp),%eax
 1c4:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
  return buf;
}
 1c8:	8d 65 f4             	lea    -0xc(%ebp),%esp
 1cb:	5b                   	pop    %ebx
 1cc:	5e                   	pop    %esi
 1cd:	5f                   	pop    %edi
 1ce:	5d                   	pop    %ebp
 1cf:	c3                   	ret    
  buf[i] = '\0';
 1d0:	8b 45 08             	mov    0x8(%ebp),%eax
  for(i=0; i+1 < max; ){
 1d3:	89 de                	mov    %ebx,%esi
  buf[i] = '\0';
 1d5:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
}
 1d9:	8d 65 f4             	lea    -0xc(%ebp),%esp
 1dc:	5b                   	pop    %ebx
 1dd:	5e                   	pop    %esi
 1de:	5f                   	pop    %edi
 1df:	5d                   	pop    %ebp
 1e0:	c3                   	ret    
 1e1:	eb 0d                	jmp    1f0 <stat>
 1e3:	90                   	nop
 1e4:	90                   	nop
 1e5:	90                   	nop
 1e6:	90                   	nop
 1e7:	90                   	nop
 1e8:	90                   	nop
 1e9:	90                   	nop
 1ea:	90                   	nop
 1eb:	90                   	nop
 1ec:	90                   	nop
 1ed:	90                   	nop
 1ee:	90                   	nop
 1ef:	90                   	nop

000001f0 <stat>:

int
stat(const char *n, struct stat *st)
{
 1f0:	55                   	push   %ebp
 1f1:	89 e5                	mov    %esp,%ebp
 1f3:	56                   	push   %esi
 1f4:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 1f5:	83 ec 08             	sub    $0x8,%esp
 1f8:	6a 00                	push   $0x0
 1fa:	ff 75 08             	pushl  0x8(%ebp)
 1fd:	e8 f0 00 00 00       	call   2f2 <open>
  if(fd < 0)
 202:	83 c4 10             	add    $0x10,%esp
 205:	85 c0                	test   %eax,%eax
 207:	78 27                	js     230 <stat+0x40>
    return -1;
  r = fstat(fd, st);
 209:	83 ec 08             	sub    $0x8,%esp
 20c:	ff 75 0c             	pushl  0xc(%ebp)
 20f:	89 c3                	mov    %eax,%ebx
 211:	50                   	push   %eax
 212:	e8 f3 00 00 00       	call   30a <fstat>
  close(fd);
 217:	89 1c 24             	mov    %ebx,(%esp)
  r = fstat(fd, st);
 21a:	89 c6                	mov    %eax,%esi
  close(fd);
 21c:	e8 b9 00 00 00       	call   2da <close>
  return r;
 221:	83 c4 10             	add    $0x10,%esp
}
 224:	8d 65 f8             	lea    -0x8(%ebp),%esp
 227:	89 f0                	mov    %esi,%eax
 229:	5b                   	pop    %ebx
 22a:	5e                   	pop    %esi
 22b:	5d                   	pop    %ebp
 22c:	c3                   	ret    
 22d:	8d 76 00             	lea    0x0(%esi),%esi
    return -1;
 230:	be ff ff ff ff       	mov    $0xffffffff,%esi
 235:	eb ed                	jmp    224 <stat+0x34>
 237:	89 f6                	mov    %esi,%esi
 239:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000240 <atoi>:

int
atoi(const char *s)
{
 240:	55                   	push   %ebp
 241:	89 e5                	mov    %esp,%ebp
 243:	53                   	push   %ebx
 244:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 247:	0f be 11             	movsbl (%ecx),%edx
 24a:	8d 42 d0             	lea    -0x30(%edx),%eax
 24d:	3c 09                	cmp    $0x9,%al
 24f:	b8 00 00 00 00       	mov    $0x0,%eax
 254:	77 1f                	ja     275 <atoi+0x35>
 256:	8d 76 00             	lea    0x0(%esi),%esi
 259:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    n = n*10 + *s++ - '0';
 260:	8d 04 80             	lea    (%eax,%eax,4),%eax
 263:	83 c1 01             	add    $0x1,%ecx
 266:	8d 44 42 d0          	lea    -0x30(%edx,%eax,2),%eax
  while('0' <= *s && *s <= '9')
 26a:	0f be 11             	movsbl (%ecx),%edx
 26d:	8d 5a d0             	lea    -0x30(%edx),%ebx
 270:	80 fb 09             	cmp    $0x9,%bl
 273:	76 eb                	jbe    260 <atoi+0x20>
  return n;
}
 275:	5b                   	pop    %ebx
 276:	5d                   	pop    %ebp
 277:	c3                   	ret    
 278:	90                   	nop
 279:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000280 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 280:	55                   	push   %ebp
 281:	89 e5                	mov    %esp,%ebp
 283:	56                   	push   %esi
 284:	53                   	push   %ebx
 285:	8b 5d 10             	mov    0x10(%ebp),%ebx
 288:	8b 45 08             	mov    0x8(%ebp),%eax
 28b:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 28e:	85 db                	test   %ebx,%ebx
 290:	7e 14                	jle    2a6 <memmove+0x26>
 292:	31 d2                	xor    %edx,%edx
 294:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    *dst++ = *src++;
 298:	0f b6 0c 16          	movzbl (%esi,%edx,1),%ecx
 29c:	88 0c 10             	mov    %cl,(%eax,%edx,1)
 29f:	83 c2 01             	add    $0x1,%edx
  while(n-- > 0)
 2a2:	39 da                	cmp    %ebx,%edx
 2a4:	75 f2                	jne    298 <memmove+0x18>
  return vdst;
}
 2a6:	5b                   	pop    %ebx
 2a7:	5e                   	pop    %esi
 2a8:	5d                   	pop    %ebp
 2a9:	c3                   	ret    

000002aa <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 2aa:	b8 01 00 00 00       	mov    $0x1,%eax
 2af:	cd 40                	int    $0x40
 2b1:	c3                   	ret    

000002b2 <exit>:
SYSCALL(exit)
 2b2:	b8 02 00 00 00       	mov    $0x2,%eax
 2b7:	cd 40                	int    $0x40
 2b9:	c3                   	ret    

000002ba <wait>:
SYSCALL(wait)
 2ba:	b8 03 00 00 00       	mov    $0x3,%eax
 2bf:	cd 40                	int    $0x40
 2c1:	c3                   	ret    

000002c2 <pipe>:
SYSCALL(pipe)
 2c2:	b8 04 00 00 00       	mov    $0x4,%eax
 2c7:	cd 40                	int    $0x40
 2c9:	c3                   	ret    

000002ca <read>:
SYSCALL(read)
 2ca:	b8 05 00 00 00       	mov    $0x5,%eax
 2cf:	cd 40                	int    $0x40
 2d1:	c3                   	ret    

000002d2 <write>:
SYSCALL(write)
 2d2:	b8 10 00 00 00       	mov    $0x10,%eax
 2d7:	cd 40                	int    $0x40
 2d9:	c3                   	ret    

000002da <close>:
SYSCALL(close)
 2da:	b8 15 00 00 00       	mov    $0x15,%eax
 2df:	cd 40                	int    $0x40
 2e1:	c3                   	ret    

000002e2 <kill>:
SYSCALL(kill)
 2e2:	b8 06 00 00 00       	mov    $0x6,%eax
 2e7:	cd 40                	int    $0x40
 2e9:	c3                   	ret    

000002ea <exec>:
SYSCALL(exec)
 2ea:	b8 07 00 00 00       	mov    $0x7,%eax
 2ef:	cd 40                	int    $0x40
 2f1:	c3                   	ret    

000002f2 <open>:
SYSCALL(open)
 2f2:	b8 0f 00 00 00       	mov    $0xf,%eax
 2f7:	cd 40                	int    $0x40
 2f9:	c3                   	ret    

000002fa <mknod>:
SYSCALL(mknod)
 2fa:	b8 11 00 00 00       	mov    $0x11,%eax
 2ff:	cd 40                	int    $0x40
 301:	c3                   	ret    

00000302 <unlink>:
SYSCALL(unlink)
 302:	b8 12 00 00 00       	mov    $0x12,%eax
 307:	cd 40                	int    $0x40
 309:	c3                   	ret    

0000030a <fstat>:
SYSCALL(fstat)
 30a:	b8 08 00 00 00       	mov    $0x8,%eax
 30f:	cd 40                	int    $0x40
 311:	c3                   	ret    

00000312 <link>:
SYSCALL(link)
 312:	b8 13 00 00 00       	mov    $0x13,%eax
 317:	cd 40                	int    $0x40
 319:	c3                   	ret    

0000031a <mkdir>:
SYSCALL(mkdir)
 31a:	b8 14 00 00 00       	mov    $0x14,%eax
 31f:	cd 40                	int    $0x40
 321:	c3                   	ret    

00000322 <chdir>:
SYSCALL(chdir)
 322:	b8 09 00 00 00       	mov    $0x9,%eax
 327:	cd 40                	int    $0x40
 329:	c3                   	ret    

0000032a <dup>:
SYSCALL(dup)
 32a:	b8 0a 00 00 00       	mov    $0xa,%eax
 32f:	cd 40                	int    $0x40
 331:	c3                   	ret    

00000332 <getpid>:
SYSCALL(getpid)
 332:	b8 0b 00 00 00       	mov    $0xb,%eax
 337:	cd 40                	int    $0x40
 339:	c3                   	ret    

0000033a <sbrk>:
SYSCALL(sbrk)
 33a:	b8 0c 00 00 00       	mov    $0xc,%eax
 33f:	cd 40                	int    $0x40
 341:	c3                   	ret    

00000342 <sleep>:
SYSCALL(sleep)
 342:	b8 0d 00 00 00       	mov    $0xd,%eax
 347:	cd 40                	int    $0x40
 349:	c3                   	ret    

0000034a <uptime>:
SYSCALL(uptime)
 34a:	b8 0e 00 00 00       	mov    $0xe,%eax
 34f:	cd 40                	int    $0x40
 351:	c3                   	ret    

00000352 <fwait>:
SYSCALL(fwait)
 352:	b8 16 00 00 00       	mov    $0x16,%eax
 357:	cd 40                	int    $0x40
 359:	c3                   	ret    

0000035a <fwake>:
 35a:	b8 17 00 00 00       	mov    $0x17,%eax
 35f:	cd 40                	int    $0x40
 361:	c3                   	ret    
 362:	66 90                	xchg   %ax,%ax
 364:	66 90                	xchg   %ax,%ax
 366:	66 90                	xchg   %ax,%ax
 368:	66 90                	xchg   %ax,%ax
 36a:	66 90                	xchg   %ax,%ax
 36c:	66 90                	xchg   %ax,%ax
 36e:	66 90                	xchg   %ax,%ax

00000370 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
 370:	55                   	push   %ebp
 371:	89 e5                	mov    %esp,%ebp
 373:	57                   	push   %edi
 374:	56                   	push   %esi
 375:	53                   	push   %ebx
 376:	89 c6                	mov    %eax,%esi
 378:	83 ec 3c             	sub    $0x3c,%esp
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 37b:	8b 5d 08             	mov    0x8(%ebp),%ebx
 37e:	85 db                	test   %ebx,%ebx
 380:	74 7e                	je     400 <printint+0x90>
 382:	89 d0                	mov    %edx,%eax
 384:	c1 e8 1f             	shr    $0x1f,%eax
 387:	84 c0                	test   %al,%al
 389:	74 75                	je     400 <printint+0x90>
    neg = 1;
    x = -xx;
 38b:	89 d0                	mov    %edx,%eax
    neg = 1;
 38d:	c7 45 c4 01 00 00 00 	movl   $0x1,-0x3c(%ebp)
    x = -xx;
 394:	f7 d8                	neg    %eax
 396:	89 75 c0             	mov    %esi,-0x40(%ebp)
  } else {
    x = xx;
  }

  i = 0;
 399:	31 ff                	xor    %edi,%edi
 39b:	8d 5d d7             	lea    -0x29(%ebp),%ebx
 39e:	89 ce                	mov    %ecx,%esi
 3a0:	eb 08                	jmp    3aa <printint+0x3a>
 3a2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  do{
    buf[i++] = digits[x % base];
 3a8:	89 cf                	mov    %ecx,%edi
 3aa:	31 d2                	xor    %edx,%edx
 3ac:	8d 4f 01             	lea    0x1(%edi),%ecx
 3af:	f7 f6                	div    %esi
 3b1:	0f b6 92 40 07 00 00 	movzbl 0x740(%edx),%edx
  }while((x /= base) != 0);
 3b8:	85 c0                	test   %eax,%eax
    buf[i++] = digits[x % base];
 3ba:	88 14 0b             	mov    %dl,(%ebx,%ecx,1)
  }while((x /= base) != 0);
 3bd:	75 e9                	jne    3a8 <printint+0x38>
  if(neg)
 3bf:	8b 45 c4             	mov    -0x3c(%ebp),%eax
 3c2:	8b 75 c0             	mov    -0x40(%ebp),%esi
 3c5:	85 c0                	test   %eax,%eax
 3c7:	74 08                	je     3d1 <printint+0x61>
    buf[i++] = '-';
 3c9:	c6 44 0d d8 2d       	movb   $0x2d,-0x28(%ebp,%ecx,1)
 3ce:	8d 4f 02             	lea    0x2(%edi),%ecx

  while(--i >= 0)
 3d1:	8d 79 ff             	lea    -0x1(%ecx),%edi
 3d4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 3d8:	0f b6 44 3d d8       	movzbl -0x28(%ebp,%edi,1),%eax
  write(fd, &c, 1);
 3dd:	83 ec 04             	sub    $0x4,%esp
  while(--i >= 0)
 3e0:	83 ef 01             	sub    $0x1,%edi
  write(fd, &c, 1);
 3e3:	6a 01                	push   $0x1
 3e5:	53                   	push   %ebx
 3e6:	56                   	push   %esi
 3e7:	88 45 d7             	mov    %al,-0x29(%ebp)
 3ea:	e8 e3 fe ff ff       	call   2d2 <write>
  while(--i >= 0)
 3ef:	83 c4 10             	add    $0x10,%esp
 3f2:	83 ff ff             	cmp    $0xffffffff,%edi
 3f5:	75 e1                	jne    3d8 <printint+0x68>
    putc(fd, buf[i]);
}
 3f7:	8d 65 f4             	lea    -0xc(%ebp),%esp
 3fa:	5b                   	pop    %ebx
 3fb:	5e                   	pop    %esi
 3fc:	5f                   	pop    %edi
 3fd:	5d                   	pop    %ebp
 3fe:	c3                   	ret    
 3ff:	90                   	nop
    x = xx;
 400:	89 d0                	mov    %edx,%eax
  neg = 0;
 402:	c7 45 c4 00 00 00 00 	movl   $0x0,-0x3c(%ebp)
 409:	eb 8b                	jmp    396 <printint+0x26>
 40b:	90                   	nop
 40c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000410 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 410:	55                   	push   %ebp
 411:	89 e5                	mov    %esp,%ebp
 413:	57                   	push   %edi
 414:	56                   	push   %esi
 415:	53                   	push   %ebx
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 416:	8d 45 10             	lea    0x10(%ebp),%eax
{
 419:	83 ec 2c             	sub    $0x2c,%esp
  for(i = 0; fmt[i]; i++){
 41c:	8b 75 0c             	mov    0xc(%ebp),%esi
{
 41f:	8b 7d 08             	mov    0x8(%ebp),%edi
  for(i = 0; fmt[i]; i++){
 422:	89 45 d0             	mov    %eax,-0x30(%ebp)
 425:	0f b6 1e             	movzbl (%esi),%ebx
 428:	83 c6 01             	add    $0x1,%esi
 42b:	84 db                	test   %bl,%bl
 42d:	0f 84 b0 00 00 00    	je     4e3 <printf+0xd3>
 433:	31 d2                	xor    %edx,%edx
 435:	eb 39                	jmp    470 <printf+0x60>
 437:	89 f6                	mov    %esi,%esi
 439:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
 440:	83 f8 25             	cmp    $0x25,%eax
 443:	89 55 d4             	mov    %edx,-0x2c(%ebp)
        state = '%';
 446:	ba 25 00 00 00       	mov    $0x25,%edx
      if(c == '%'){
 44b:	74 18                	je     465 <printf+0x55>
  write(fd, &c, 1);
 44d:	8d 45 e2             	lea    -0x1e(%ebp),%eax
 450:	83 ec 04             	sub    $0x4,%esp
 453:	88 5d e2             	mov    %bl,-0x1e(%ebp)
 456:	6a 01                	push   $0x1
 458:	50                   	push   %eax
 459:	57                   	push   %edi
 45a:	e8 73 fe ff ff       	call   2d2 <write>
 45f:	8b 55 d4             	mov    -0x2c(%ebp),%edx
 462:	83 c4 10             	add    $0x10,%esp
 465:	83 c6 01             	add    $0x1,%esi
  for(i = 0; fmt[i]; i++){
 468:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
 46c:	84 db                	test   %bl,%bl
 46e:	74 73                	je     4e3 <printf+0xd3>
    if(state == 0){
 470:	85 d2                	test   %edx,%edx
    c = fmt[i] & 0xff;
 472:	0f be cb             	movsbl %bl,%ecx
 475:	0f b6 c3             	movzbl %bl,%eax
    if(state == 0){
 478:	74 c6                	je     440 <printf+0x30>
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
 47a:	83 fa 25             	cmp    $0x25,%edx
 47d:	75 e6                	jne    465 <printf+0x55>
      if(c == 'd'){
 47f:	83 f8 64             	cmp    $0x64,%eax
 482:	0f 84 f8 00 00 00    	je     580 <printf+0x170>
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
 488:	81 e1 f7 00 00 00    	and    $0xf7,%ecx
 48e:	83 f9 70             	cmp    $0x70,%ecx
 491:	74 5d                	je     4f0 <printf+0xe0>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
 493:	83 f8 73             	cmp    $0x73,%eax
 496:	0f 84 84 00 00 00    	je     520 <printf+0x110>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 49c:	83 f8 63             	cmp    $0x63,%eax
 49f:	0f 84 ea 00 00 00    	je     58f <printf+0x17f>
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
 4a5:	83 f8 25             	cmp    $0x25,%eax
 4a8:	0f 84 c2 00 00 00    	je     570 <printf+0x160>
  write(fd, &c, 1);
 4ae:	8d 45 e7             	lea    -0x19(%ebp),%eax
 4b1:	83 ec 04             	sub    $0x4,%esp
 4b4:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
 4b8:	6a 01                	push   $0x1
 4ba:	50                   	push   %eax
 4bb:	57                   	push   %edi
 4bc:	e8 11 fe ff ff       	call   2d2 <write>
 4c1:	83 c4 0c             	add    $0xc,%esp
 4c4:	8d 45 e6             	lea    -0x1a(%ebp),%eax
 4c7:	88 5d e6             	mov    %bl,-0x1a(%ebp)
 4ca:	6a 01                	push   $0x1
 4cc:	50                   	push   %eax
 4cd:	57                   	push   %edi
 4ce:	83 c6 01             	add    $0x1,%esi
 4d1:	e8 fc fd ff ff       	call   2d2 <write>
  for(i = 0; fmt[i]; i++){
 4d6:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
  write(fd, &c, 1);
 4da:	83 c4 10             	add    $0x10,%esp
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 4dd:	31 d2                	xor    %edx,%edx
  for(i = 0; fmt[i]; i++){
 4df:	84 db                	test   %bl,%bl
 4e1:	75 8d                	jne    470 <printf+0x60>
    }
  }
}
 4e3:	8d 65 f4             	lea    -0xc(%ebp),%esp
 4e6:	5b                   	pop    %ebx
 4e7:	5e                   	pop    %esi
 4e8:	5f                   	pop    %edi
 4e9:	5d                   	pop    %ebp
 4ea:	c3                   	ret    
 4eb:	90                   	nop
 4ec:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        printint(fd, *ap, 16, 0);
 4f0:	83 ec 0c             	sub    $0xc,%esp
 4f3:	b9 10 00 00 00       	mov    $0x10,%ecx
 4f8:	6a 00                	push   $0x0
 4fa:	8b 5d d0             	mov    -0x30(%ebp),%ebx
 4fd:	89 f8                	mov    %edi,%eax
 4ff:	8b 13                	mov    (%ebx),%edx
 501:	e8 6a fe ff ff       	call   370 <printint>
        ap++;
 506:	89 d8                	mov    %ebx,%eax
 508:	83 c4 10             	add    $0x10,%esp
      state = 0;
 50b:	31 d2                	xor    %edx,%edx
        ap++;
 50d:	83 c0 04             	add    $0x4,%eax
 510:	89 45 d0             	mov    %eax,-0x30(%ebp)
 513:	e9 4d ff ff ff       	jmp    465 <printf+0x55>
 518:	90                   	nop
 519:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        s = (char*)*ap;
 520:	8b 45 d0             	mov    -0x30(%ebp),%eax
 523:	8b 18                	mov    (%eax),%ebx
        ap++;
 525:	83 c0 04             	add    $0x4,%eax
 528:	89 45 d0             	mov    %eax,-0x30(%ebp)
        if(s == 0)
 52b:	85 db                	test   %ebx,%ebx
 52d:	74 7c                	je     5ab <printf+0x19b>
        while(*s != 0){
 52f:	0f b6 03             	movzbl (%ebx),%eax
 532:	84 c0                	test   %al,%al
 534:	74 29                	je     55f <printf+0x14f>
 536:	8d 76 00             	lea    0x0(%esi),%esi
 539:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
 540:	88 45 e3             	mov    %al,-0x1d(%ebp)
  write(fd, &c, 1);
 543:	8d 45 e3             	lea    -0x1d(%ebp),%eax
 546:	83 ec 04             	sub    $0x4,%esp
 549:	6a 01                	push   $0x1
          s++;
 54b:	83 c3 01             	add    $0x1,%ebx
  write(fd, &c, 1);
 54e:	50                   	push   %eax
 54f:	57                   	push   %edi
 550:	e8 7d fd ff ff       	call   2d2 <write>
        while(*s != 0){
 555:	0f b6 03             	movzbl (%ebx),%eax
 558:	83 c4 10             	add    $0x10,%esp
 55b:	84 c0                	test   %al,%al
 55d:	75 e1                	jne    540 <printf+0x130>
      state = 0;
 55f:	31 d2                	xor    %edx,%edx
 561:	e9 ff fe ff ff       	jmp    465 <printf+0x55>
 566:	8d 76 00             	lea    0x0(%esi),%esi
 569:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
  write(fd, &c, 1);
 570:	83 ec 04             	sub    $0x4,%esp
 573:	88 5d e5             	mov    %bl,-0x1b(%ebp)
 576:	8d 45 e5             	lea    -0x1b(%ebp),%eax
 579:	6a 01                	push   $0x1
 57b:	e9 4c ff ff ff       	jmp    4cc <printf+0xbc>
        printint(fd, *ap, 10, 1);
 580:	83 ec 0c             	sub    $0xc,%esp
 583:	b9 0a 00 00 00       	mov    $0xa,%ecx
 588:	6a 01                	push   $0x1
 58a:	e9 6b ff ff ff       	jmp    4fa <printf+0xea>
        putc(fd, *ap);
 58f:	8b 5d d0             	mov    -0x30(%ebp),%ebx
  write(fd, &c, 1);
 592:	83 ec 04             	sub    $0x4,%esp
        putc(fd, *ap);
 595:	8b 03                	mov    (%ebx),%eax
  write(fd, &c, 1);
 597:	6a 01                	push   $0x1
        putc(fd, *ap);
 599:	88 45 e4             	mov    %al,-0x1c(%ebp)
  write(fd, &c, 1);
 59c:	8d 45 e4             	lea    -0x1c(%ebp),%eax
 59f:	50                   	push   %eax
 5a0:	57                   	push   %edi
 5a1:	e8 2c fd ff ff       	call   2d2 <write>
 5a6:	e9 5b ff ff ff       	jmp    506 <printf+0xf6>
        while(*s != 0){
 5ab:	b8 28 00 00 00       	mov    $0x28,%eax
          s = "(null)";
 5b0:	bb 39 07 00 00       	mov    $0x739,%ebx
 5b5:	eb 89                	jmp    540 <printf+0x130>
 5b7:	66 90                	xchg   %ax,%ax
 5b9:	66 90                	xchg   %ax,%ax
 5bb:	66 90                	xchg   %ax,%ax
 5bd:	66 90                	xchg   %ax,%ax
 5bf:	90                   	nop

000005c0 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 5c0:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 5c1:	a1 e4 09 00 00       	mov    0x9e4,%eax
{
 5c6:	89 e5                	mov    %esp,%ebp
 5c8:	57                   	push   %edi
 5c9:	56                   	push   %esi
 5ca:	53                   	push   %ebx
 5cb:	8b 5d 08             	mov    0x8(%ebp),%ebx
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 5ce:	8b 10                	mov    (%eax),%edx
  bp = (Header*)ap - 1;
 5d0:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 5d3:	39 c8                	cmp    %ecx,%eax
 5d5:	73 19                	jae    5f0 <free+0x30>
 5d7:	89 f6                	mov    %esi,%esi
 5d9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
 5e0:	39 d1                	cmp    %edx,%ecx
 5e2:	72 1c                	jb     600 <free+0x40>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 5e4:	39 d0                	cmp    %edx,%eax
 5e6:	73 18                	jae    600 <free+0x40>
{
 5e8:	89 d0                	mov    %edx,%eax
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 5ea:	39 c8                	cmp    %ecx,%eax
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 5ec:	8b 10                	mov    (%eax),%edx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 5ee:	72 f0                	jb     5e0 <free+0x20>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 5f0:	39 d0                	cmp    %edx,%eax
 5f2:	72 f4                	jb     5e8 <free+0x28>
 5f4:	39 d1                	cmp    %edx,%ecx
 5f6:	73 f0                	jae    5e8 <free+0x28>
 5f8:	90                   	nop
 5f9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      break;
  if(bp + bp->s.size == p->s.ptr){
 600:	8b 73 fc             	mov    -0x4(%ebx),%esi
 603:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 606:	39 fa                	cmp    %edi,%edx
 608:	74 19                	je     623 <free+0x63>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 60a:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 60d:	8b 50 04             	mov    0x4(%eax),%edx
 610:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 613:	39 f1                	cmp    %esi,%ecx
 615:	74 23                	je     63a <free+0x7a>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 617:	89 08                	mov    %ecx,(%eax)
  freep = p;
 619:	a3 e4 09 00 00       	mov    %eax,0x9e4
}
 61e:	5b                   	pop    %ebx
 61f:	5e                   	pop    %esi
 620:	5f                   	pop    %edi
 621:	5d                   	pop    %ebp
 622:	c3                   	ret    
    bp->s.size += p->s.ptr->s.size;
 623:	03 72 04             	add    0x4(%edx),%esi
 626:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 629:	8b 10                	mov    (%eax),%edx
 62b:	8b 12                	mov    (%edx),%edx
 62d:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 630:	8b 50 04             	mov    0x4(%eax),%edx
 633:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 636:	39 f1                	cmp    %esi,%ecx
 638:	75 dd                	jne    617 <free+0x57>
    p->s.size += bp->s.size;
 63a:	03 53 fc             	add    -0x4(%ebx),%edx
  freep = p;
 63d:	a3 e4 09 00 00       	mov    %eax,0x9e4
    p->s.size += bp->s.size;
 642:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 645:	8b 53 f8             	mov    -0x8(%ebx),%edx
 648:	89 10                	mov    %edx,(%eax)
}
 64a:	5b                   	pop    %ebx
 64b:	5e                   	pop    %esi
 64c:	5f                   	pop    %edi
 64d:	5d                   	pop    %ebp
 64e:	c3                   	ret    
 64f:	90                   	nop

00000650 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 650:	55                   	push   %ebp
 651:	89 e5                	mov    %esp,%ebp
 653:	57                   	push   %edi
 654:	56                   	push   %esi
 655:	53                   	push   %ebx
 656:	83 ec 0c             	sub    $0xc,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 659:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
 65c:	8b 15 e4 09 00 00    	mov    0x9e4,%edx
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 662:	8d 78 07             	lea    0x7(%eax),%edi
 665:	c1 ef 03             	shr    $0x3,%edi
 668:	83 c7 01             	add    $0x1,%edi
  if((prevp = freep) == 0){
 66b:	85 d2                	test   %edx,%edx
 66d:	0f 84 93 00 00 00    	je     706 <malloc+0xb6>
 673:	8b 02                	mov    (%edx),%eax
 675:	8b 48 04             	mov    0x4(%eax),%ecx
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
 678:	39 cf                	cmp    %ecx,%edi
 67a:	76 64                	jbe    6e0 <malloc+0x90>
 67c:	81 ff 00 10 00 00    	cmp    $0x1000,%edi
 682:	bb 00 10 00 00       	mov    $0x1000,%ebx
 687:	0f 43 df             	cmovae %edi,%ebx
  p = sbrk(nu * sizeof(Header));
 68a:	8d 34 dd 00 00 00 00 	lea    0x0(,%ebx,8),%esi
 691:	eb 0e                	jmp    6a1 <malloc+0x51>
 693:	90                   	nop
 694:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 698:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
 69a:	8b 48 04             	mov    0x4(%eax),%ecx
 69d:	39 cf                	cmp    %ecx,%edi
 69f:	76 3f                	jbe    6e0 <malloc+0x90>
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 6a1:	39 05 e4 09 00 00    	cmp    %eax,0x9e4
 6a7:	89 c2                	mov    %eax,%edx
 6a9:	75 ed                	jne    698 <malloc+0x48>
  p = sbrk(nu * sizeof(Header));
 6ab:	83 ec 0c             	sub    $0xc,%esp
 6ae:	56                   	push   %esi
 6af:	e8 86 fc ff ff       	call   33a <sbrk>
  if(p == (char*)-1)
 6b4:	83 c4 10             	add    $0x10,%esp
 6b7:	83 f8 ff             	cmp    $0xffffffff,%eax
 6ba:	74 1c                	je     6d8 <malloc+0x88>
  hp->s.size = nu;
 6bc:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 6bf:	83 ec 0c             	sub    $0xc,%esp
 6c2:	83 c0 08             	add    $0x8,%eax
 6c5:	50                   	push   %eax
 6c6:	e8 f5 fe ff ff       	call   5c0 <free>
  return freep;
 6cb:	8b 15 e4 09 00 00    	mov    0x9e4,%edx
      if((p = morecore(nunits)) == 0)
 6d1:	83 c4 10             	add    $0x10,%esp
 6d4:	85 d2                	test   %edx,%edx
 6d6:	75 c0                	jne    698 <malloc+0x48>
        return 0;
 6d8:	31 c0                	xor    %eax,%eax
 6da:	eb 1c                	jmp    6f8 <malloc+0xa8>
 6dc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
      if(p->s.size == nunits)
 6e0:	39 cf                	cmp    %ecx,%edi
 6e2:	74 1c                	je     700 <malloc+0xb0>
        p->s.size -= nunits;
 6e4:	29 f9                	sub    %edi,%ecx
 6e6:	89 48 04             	mov    %ecx,0x4(%eax)
        p += p->s.size;
 6e9:	8d 04 c8             	lea    (%eax,%ecx,8),%eax
        p->s.size = nunits;
 6ec:	89 78 04             	mov    %edi,0x4(%eax)
      freep = prevp;
 6ef:	89 15 e4 09 00 00    	mov    %edx,0x9e4
      return (void*)(p + 1);
 6f5:	83 c0 08             	add    $0x8,%eax
  }
}
 6f8:	8d 65 f4             	lea    -0xc(%ebp),%esp
 6fb:	5b                   	pop    %ebx
 6fc:	5e                   	pop    %esi
 6fd:	5f                   	pop    %edi
 6fe:	5d                   	pop    %ebp
 6ff:	c3                   	ret    
        prevp->s.ptr = p->s.ptr;
 700:	8b 08                	mov    (%eax),%ecx
 702:	89 0a                	mov    %ecx,(%edx)
 704:	eb e9                	jmp    6ef <malloc+0x9f>
    base.s.ptr = freep = prevp = &base;
 706:	c7 05 e4 09 00 00 e8 	movl   $0x9e8,0x9e4
 70d:	09 00 00 
 710:	c7 05 e8 09 00 00 e8 	movl   $0x9e8,0x9e8
 717:	09 00 00 
    base.s.size = 0;
 71a:	b8 e8 09 00 00       	mov    $0x9e8,%eax
 71f:	c7 05 ec 09 00 00 00 	movl   $0x0,0x9ec
 726:	00 00 00 
 729:	e9 4e ff ff ff       	jmp    67c <malloc+0x2c>
