
_cat:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
  }
}

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
  11:	be 01 00 00 00       	mov    $0x1,%esi
  16:	83 ec 18             	sub    $0x18,%esp
  19:	8b 01                	mov    (%ecx),%eax
  1b:	8b 59 04             	mov    0x4(%ecx),%ebx
  1e:	83 c3 04             	add    $0x4,%ebx
  int fd, i;

  if(argc <= 1){
  21:	83 f8 01             	cmp    $0x1,%eax
{
  24:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  if(argc <= 1){
  27:	7e 54                	jle    7d <main+0x7d>
  29:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    cat(0);
    exit();
  }

  for(i = 1; i < argc; i++){
    if((fd = open(argv[i], 0)) < 0){
  30:	83 ec 08             	sub    $0x8,%esp
  33:	6a 00                	push   $0x0
  35:	ff 33                	pushl  (%ebx)
  37:	e8 56 03 00 00       	call   392 <open>
  3c:	83 c4 10             	add    $0x10,%esp
  3f:	85 c0                	test   %eax,%eax
  41:	89 c7                	mov    %eax,%edi
  43:	78 24                	js     69 <main+0x69>
      printf(1, "cat: cannot open %s\n", argv[i]);
      exit();
    }
    cat(fd);
  45:	83 ec 0c             	sub    $0xc,%esp
  for(i = 1; i < argc; i++){
  48:	83 c6 01             	add    $0x1,%esi
  4b:	83 c3 04             	add    $0x4,%ebx
    cat(fd);
  4e:	50                   	push   %eax
  4f:	e8 3c 00 00 00       	call   90 <cat>
    close(fd);
  54:	89 3c 24             	mov    %edi,(%esp)
  57:	e8 1e 03 00 00       	call   37a <close>
  for(i = 1; i < argc; i++){
  5c:	83 c4 10             	add    $0x10,%esp
  5f:	39 75 e4             	cmp    %esi,-0x1c(%ebp)
  62:	75 cc                	jne    30 <main+0x30>
  }
  exit();
  64:	e8 e9 02 00 00       	call   352 <exit>
      printf(1, "cat: cannot open %s\n", argv[i]);
  69:	50                   	push   %eax
  6a:	ff 33                	pushl  (%ebx)
  6c:	68 f3 07 00 00       	push   $0x7f3
  71:	6a 01                	push   $0x1
  73:	e8 38 04 00 00       	call   4b0 <printf>
      exit();
  78:	e8 d5 02 00 00       	call   352 <exit>
    cat(0);
  7d:	83 ec 0c             	sub    $0xc,%esp
  80:	6a 00                	push   $0x0
  82:	e8 09 00 00 00       	call   90 <cat>
    exit();
  87:	e8 c6 02 00 00       	call   352 <exit>
  8c:	66 90                	xchg   %ax,%ax
  8e:	66 90                	xchg   %ax,%ax

00000090 <cat>:
{
  90:	55                   	push   %ebp
  91:	89 e5                	mov    %esp,%ebp
  93:	56                   	push   %esi
  94:	53                   	push   %ebx
  95:	8b 75 08             	mov    0x8(%ebp),%esi
  while((n = read(fd, buf, sizeof(buf))) > 0) {
  98:	eb 1d                	jmp    b7 <cat+0x27>
  9a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    if (write(1, buf, n) != n) {
  a0:	83 ec 04             	sub    $0x4,%esp
  a3:	53                   	push   %ebx
  a4:	68 00 0b 00 00       	push   $0xb00
  a9:	6a 01                	push   $0x1
  ab:	e8 c2 02 00 00       	call   372 <write>
  b0:	83 c4 10             	add    $0x10,%esp
  b3:	39 c3                	cmp    %eax,%ebx
  b5:	75 26                	jne    dd <cat+0x4d>
  while((n = read(fd, buf, sizeof(buf))) > 0) {
  b7:	83 ec 04             	sub    $0x4,%esp
  ba:	68 00 02 00 00       	push   $0x200
  bf:	68 00 0b 00 00       	push   $0xb00
  c4:	56                   	push   %esi
  c5:	e8 a0 02 00 00       	call   36a <read>
  ca:	83 c4 10             	add    $0x10,%esp
  cd:	83 f8 00             	cmp    $0x0,%eax
  d0:	89 c3                	mov    %eax,%ebx
  d2:	7f cc                	jg     a0 <cat+0x10>
  if(n < 0){
  d4:	75 1b                	jne    f1 <cat+0x61>
}
  d6:	8d 65 f8             	lea    -0x8(%ebp),%esp
  d9:	5b                   	pop    %ebx
  da:	5e                   	pop    %esi
  db:	5d                   	pop    %ebp
  dc:	c3                   	ret    
      printf(1, "cat: write error\n");
  dd:	83 ec 08             	sub    $0x8,%esp
  e0:	68 d0 07 00 00       	push   $0x7d0
  e5:	6a 01                	push   $0x1
  e7:	e8 c4 03 00 00       	call   4b0 <printf>
      exit();
  ec:	e8 61 02 00 00       	call   352 <exit>
    printf(1, "cat: read error\n");
  f1:	83 ec 08             	sub    $0x8,%esp
  f4:	68 e2 07 00 00       	push   $0x7e2
  f9:	6a 01                	push   $0x1
  fb:	e8 b0 03 00 00       	call   4b0 <printf>
    exit();
 100:	e8 4d 02 00 00       	call   352 <exit>
 105:	66 90                	xchg   %ax,%ax
 107:	66 90                	xchg   %ax,%ax
 109:	66 90                	xchg   %ax,%ax
 10b:	66 90                	xchg   %ax,%ax
 10d:	66 90                	xchg   %ax,%ax
 10f:	90                   	nop

00000110 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, const char *t)
{
 110:	55                   	push   %ebp
 111:	89 e5                	mov    %esp,%ebp
 113:	53                   	push   %ebx
 114:	8b 45 08             	mov    0x8(%ebp),%eax
 117:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 11a:	89 c2                	mov    %eax,%edx
 11c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 120:	83 c1 01             	add    $0x1,%ecx
 123:	0f b6 59 ff          	movzbl -0x1(%ecx),%ebx
 127:	83 c2 01             	add    $0x1,%edx
 12a:	84 db                	test   %bl,%bl
 12c:	88 5a ff             	mov    %bl,-0x1(%edx)
 12f:	75 ef                	jne    120 <strcpy+0x10>
    ;
  return os;
}
 131:	5b                   	pop    %ebx
 132:	5d                   	pop    %ebp
 133:	c3                   	ret    
 134:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 13a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

00000140 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 140:	55                   	push   %ebp
 141:	89 e5                	mov    %esp,%ebp
 143:	56                   	push   %esi
 144:	53                   	push   %ebx
 145:	8b 55 08             	mov    0x8(%ebp),%edx
 148:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  while(*p && *p == *q)
 14b:	0f b6 02             	movzbl (%edx),%eax
 14e:	0f b6 19             	movzbl (%ecx),%ebx
 151:	84 c0                	test   %al,%al
 153:	75 1e                	jne    173 <strcmp+0x33>
 155:	eb 29                	jmp    180 <strcmp+0x40>
 157:	89 f6                	mov    %esi,%esi
 159:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    p++, q++;
 160:	83 c2 01             	add    $0x1,%edx
  while(*p && *p == *q)
 163:	0f b6 02             	movzbl (%edx),%eax
    p++, q++;
 166:	8d 71 01             	lea    0x1(%ecx),%esi
  while(*p && *p == *q)
 169:	0f b6 59 01          	movzbl 0x1(%ecx),%ebx
 16d:	84 c0                	test   %al,%al
 16f:	74 0f                	je     180 <strcmp+0x40>
 171:	89 f1                	mov    %esi,%ecx
 173:	38 d8                	cmp    %bl,%al
 175:	74 e9                	je     160 <strcmp+0x20>
  return (uchar)*p - (uchar)*q;
 177:	29 d8                	sub    %ebx,%eax
}
 179:	5b                   	pop    %ebx
 17a:	5e                   	pop    %esi
 17b:	5d                   	pop    %ebp
 17c:	c3                   	ret    
 17d:	8d 76 00             	lea    0x0(%esi),%esi
  while(*p && *p == *q)
 180:	31 c0                	xor    %eax,%eax
  return (uchar)*p - (uchar)*q;
 182:	29 d8                	sub    %ebx,%eax
}
 184:	5b                   	pop    %ebx
 185:	5e                   	pop    %esi
 186:	5d                   	pop    %ebp
 187:	c3                   	ret    
 188:	90                   	nop
 189:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000190 <strlen>:

uint
strlen(const char *s)
{
 190:	55                   	push   %ebp
 191:	89 e5                	mov    %esp,%ebp
 193:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
 196:	80 39 00             	cmpb   $0x0,(%ecx)
 199:	74 12                	je     1ad <strlen+0x1d>
 19b:	31 d2                	xor    %edx,%edx
 19d:	8d 76 00             	lea    0x0(%esi),%esi
 1a0:	83 c2 01             	add    $0x1,%edx
 1a3:	80 3c 11 00          	cmpb   $0x0,(%ecx,%edx,1)
 1a7:	89 d0                	mov    %edx,%eax
 1a9:	75 f5                	jne    1a0 <strlen+0x10>
    ;
  return n;
}
 1ab:	5d                   	pop    %ebp
 1ac:	c3                   	ret    
  for(n = 0; s[n]; n++)
 1ad:	31 c0                	xor    %eax,%eax
}
 1af:	5d                   	pop    %ebp
 1b0:	c3                   	ret    
 1b1:	eb 0d                	jmp    1c0 <memset>
 1b3:	90                   	nop
 1b4:	90                   	nop
 1b5:	90                   	nop
 1b6:	90                   	nop
 1b7:	90                   	nop
 1b8:	90                   	nop
 1b9:	90                   	nop
 1ba:	90                   	nop
 1bb:	90                   	nop
 1bc:	90                   	nop
 1bd:	90                   	nop
 1be:	90                   	nop
 1bf:	90                   	nop

000001c0 <memset>:

void*
memset(void *dst, int c, uint n)
{
 1c0:	55                   	push   %ebp
 1c1:	89 e5                	mov    %esp,%ebp
 1c3:	57                   	push   %edi
 1c4:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 1c7:	8b 4d 10             	mov    0x10(%ebp),%ecx
 1ca:	8b 45 0c             	mov    0xc(%ebp),%eax
 1cd:	89 d7                	mov    %edx,%edi
 1cf:	fc                   	cld    
 1d0:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 1d2:	89 d0                	mov    %edx,%eax
 1d4:	5f                   	pop    %edi
 1d5:	5d                   	pop    %ebp
 1d6:	c3                   	ret    
 1d7:	89 f6                	mov    %esi,%esi
 1d9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000001e0 <strchr>:

char*
strchr(const char *s, char c)
{
 1e0:	55                   	push   %ebp
 1e1:	89 e5                	mov    %esp,%ebp
 1e3:	53                   	push   %ebx
 1e4:	8b 45 08             	mov    0x8(%ebp),%eax
 1e7:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  for(; *s; s++)
 1ea:	0f b6 10             	movzbl (%eax),%edx
 1ed:	84 d2                	test   %dl,%dl
 1ef:	74 1d                	je     20e <strchr+0x2e>
    if(*s == c)
 1f1:	38 d3                	cmp    %dl,%bl
 1f3:	89 d9                	mov    %ebx,%ecx
 1f5:	75 0d                	jne    204 <strchr+0x24>
 1f7:	eb 17                	jmp    210 <strchr+0x30>
 1f9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 200:	38 ca                	cmp    %cl,%dl
 202:	74 0c                	je     210 <strchr+0x30>
  for(; *s; s++)
 204:	83 c0 01             	add    $0x1,%eax
 207:	0f b6 10             	movzbl (%eax),%edx
 20a:	84 d2                	test   %dl,%dl
 20c:	75 f2                	jne    200 <strchr+0x20>
      return (char*)s;
  return 0;
 20e:	31 c0                	xor    %eax,%eax
}
 210:	5b                   	pop    %ebx
 211:	5d                   	pop    %ebp
 212:	c3                   	ret    
 213:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 219:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000220 <gets>:

char*
gets(char *buf, int max)
{
 220:	55                   	push   %ebp
 221:	89 e5                	mov    %esp,%ebp
 223:	57                   	push   %edi
 224:	56                   	push   %esi
 225:	53                   	push   %ebx
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 226:	31 f6                	xor    %esi,%esi
    cc = read(0, &c, 1);
 228:	8d 7d e7             	lea    -0x19(%ebp),%edi
{
 22b:	83 ec 1c             	sub    $0x1c,%esp
  for(i=0; i+1 < max; ){
 22e:	eb 29                	jmp    259 <gets+0x39>
    cc = read(0, &c, 1);
 230:	83 ec 04             	sub    $0x4,%esp
 233:	6a 01                	push   $0x1
 235:	57                   	push   %edi
 236:	6a 00                	push   $0x0
 238:	e8 2d 01 00 00       	call   36a <read>
    if(cc < 1)
 23d:	83 c4 10             	add    $0x10,%esp
 240:	85 c0                	test   %eax,%eax
 242:	7e 1d                	jle    261 <gets+0x41>
      break;
    buf[i++] = c;
 244:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 248:	8b 55 08             	mov    0x8(%ebp),%edx
 24b:	89 de                	mov    %ebx,%esi
    if(c == '\n' || c == '\r')
 24d:	3c 0a                	cmp    $0xa,%al
    buf[i++] = c;
 24f:	88 44 1a ff          	mov    %al,-0x1(%edx,%ebx,1)
    if(c == '\n' || c == '\r')
 253:	74 1b                	je     270 <gets+0x50>
 255:	3c 0d                	cmp    $0xd,%al
 257:	74 17                	je     270 <gets+0x50>
  for(i=0; i+1 < max; ){
 259:	8d 5e 01             	lea    0x1(%esi),%ebx
 25c:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 25f:	7c cf                	jl     230 <gets+0x10>
      break;
  }
  buf[i] = '\0';
 261:	8b 45 08             	mov    0x8(%ebp),%eax
 264:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
  return buf;
}
 268:	8d 65 f4             	lea    -0xc(%ebp),%esp
 26b:	5b                   	pop    %ebx
 26c:	5e                   	pop    %esi
 26d:	5f                   	pop    %edi
 26e:	5d                   	pop    %ebp
 26f:	c3                   	ret    
  buf[i] = '\0';
 270:	8b 45 08             	mov    0x8(%ebp),%eax
  for(i=0; i+1 < max; ){
 273:	89 de                	mov    %ebx,%esi
  buf[i] = '\0';
 275:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
}
 279:	8d 65 f4             	lea    -0xc(%ebp),%esp
 27c:	5b                   	pop    %ebx
 27d:	5e                   	pop    %esi
 27e:	5f                   	pop    %edi
 27f:	5d                   	pop    %ebp
 280:	c3                   	ret    
 281:	eb 0d                	jmp    290 <stat>
 283:	90                   	nop
 284:	90                   	nop
 285:	90                   	nop
 286:	90                   	nop
 287:	90                   	nop
 288:	90                   	nop
 289:	90                   	nop
 28a:	90                   	nop
 28b:	90                   	nop
 28c:	90                   	nop
 28d:	90                   	nop
 28e:	90                   	nop
 28f:	90                   	nop

00000290 <stat>:

int
stat(const char *n, struct stat *st)
{
 290:	55                   	push   %ebp
 291:	89 e5                	mov    %esp,%ebp
 293:	56                   	push   %esi
 294:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 295:	83 ec 08             	sub    $0x8,%esp
 298:	6a 00                	push   $0x0
 29a:	ff 75 08             	pushl  0x8(%ebp)
 29d:	e8 f0 00 00 00       	call   392 <open>
  if(fd < 0)
 2a2:	83 c4 10             	add    $0x10,%esp
 2a5:	85 c0                	test   %eax,%eax
 2a7:	78 27                	js     2d0 <stat+0x40>
    return -1;
  r = fstat(fd, st);
 2a9:	83 ec 08             	sub    $0x8,%esp
 2ac:	ff 75 0c             	pushl  0xc(%ebp)
 2af:	89 c3                	mov    %eax,%ebx
 2b1:	50                   	push   %eax
 2b2:	e8 f3 00 00 00       	call   3aa <fstat>
  close(fd);
 2b7:	89 1c 24             	mov    %ebx,(%esp)
  r = fstat(fd, st);
 2ba:	89 c6                	mov    %eax,%esi
  close(fd);
 2bc:	e8 b9 00 00 00       	call   37a <close>
  return r;
 2c1:	83 c4 10             	add    $0x10,%esp
}
 2c4:	8d 65 f8             	lea    -0x8(%ebp),%esp
 2c7:	89 f0                	mov    %esi,%eax
 2c9:	5b                   	pop    %ebx
 2ca:	5e                   	pop    %esi
 2cb:	5d                   	pop    %ebp
 2cc:	c3                   	ret    
 2cd:	8d 76 00             	lea    0x0(%esi),%esi
    return -1;
 2d0:	be ff ff ff ff       	mov    $0xffffffff,%esi
 2d5:	eb ed                	jmp    2c4 <stat+0x34>
 2d7:	89 f6                	mov    %esi,%esi
 2d9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000002e0 <atoi>:

int
atoi(const char *s)
{
 2e0:	55                   	push   %ebp
 2e1:	89 e5                	mov    %esp,%ebp
 2e3:	53                   	push   %ebx
 2e4:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 2e7:	0f be 11             	movsbl (%ecx),%edx
 2ea:	8d 42 d0             	lea    -0x30(%edx),%eax
 2ed:	3c 09                	cmp    $0x9,%al
 2ef:	b8 00 00 00 00       	mov    $0x0,%eax
 2f4:	77 1f                	ja     315 <atoi+0x35>
 2f6:	8d 76 00             	lea    0x0(%esi),%esi
 2f9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    n = n*10 + *s++ - '0';
 300:	8d 04 80             	lea    (%eax,%eax,4),%eax
 303:	83 c1 01             	add    $0x1,%ecx
 306:	8d 44 42 d0          	lea    -0x30(%edx,%eax,2),%eax
  while('0' <= *s && *s <= '9')
 30a:	0f be 11             	movsbl (%ecx),%edx
 30d:	8d 5a d0             	lea    -0x30(%edx),%ebx
 310:	80 fb 09             	cmp    $0x9,%bl
 313:	76 eb                	jbe    300 <atoi+0x20>
  return n;
}
 315:	5b                   	pop    %ebx
 316:	5d                   	pop    %ebp
 317:	c3                   	ret    
 318:	90                   	nop
 319:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000320 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 320:	55                   	push   %ebp
 321:	89 e5                	mov    %esp,%ebp
 323:	56                   	push   %esi
 324:	53                   	push   %ebx
 325:	8b 5d 10             	mov    0x10(%ebp),%ebx
 328:	8b 45 08             	mov    0x8(%ebp),%eax
 32b:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 32e:	85 db                	test   %ebx,%ebx
 330:	7e 14                	jle    346 <memmove+0x26>
 332:	31 d2                	xor    %edx,%edx
 334:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    *dst++ = *src++;
 338:	0f b6 0c 16          	movzbl (%esi,%edx,1),%ecx
 33c:	88 0c 10             	mov    %cl,(%eax,%edx,1)
 33f:	83 c2 01             	add    $0x1,%edx
  while(n-- > 0)
 342:	39 da                	cmp    %ebx,%edx
 344:	75 f2                	jne    338 <memmove+0x18>
  return vdst;
}
 346:	5b                   	pop    %ebx
 347:	5e                   	pop    %esi
 348:	5d                   	pop    %ebp
 349:	c3                   	ret    

0000034a <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 34a:	b8 01 00 00 00       	mov    $0x1,%eax
 34f:	cd 40                	int    $0x40
 351:	c3                   	ret    

00000352 <exit>:
SYSCALL(exit)
 352:	b8 02 00 00 00       	mov    $0x2,%eax
 357:	cd 40                	int    $0x40
 359:	c3                   	ret    

0000035a <wait>:
SYSCALL(wait)
 35a:	b8 03 00 00 00       	mov    $0x3,%eax
 35f:	cd 40                	int    $0x40
 361:	c3                   	ret    

00000362 <pipe>:
SYSCALL(pipe)
 362:	b8 04 00 00 00       	mov    $0x4,%eax
 367:	cd 40                	int    $0x40
 369:	c3                   	ret    

0000036a <read>:
SYSCALL(read)
 36a:	b8 05 00 00 00       	mov    $0x5,%eax
 36f:	cd 40                	int    $0x40
 371:	c3                   	ret    

00000372 <write>:
SYSCALL(write)
 372:	b8 10 00 00 00       	mov    $0x10,%eax
 377:	cd 40                	int    $0x40
 379:	c3                   	ret    

0000037a <close>:
SYSCALL(close)
 37a:	b8 15 00 00 00       	mov    $0x15,%eax
 37f:	cd 40                	int    $0x40
 381:	c3                   	ret    

00000382 <kill>:
SYSCALL(kill)
 382:	b8 06 00 00 00       	mov    $0x6,%eax
 387:	cd 40                	int    $0x40
 389:	c3                   	ret    

0000038a <exec>:
SYSCALL(exec)
 38a:	b8 07 00 00 00       	mov    $0x7,%eax
 38f:	cd 40                	int    $0x40
 391:	c3                   	ret    

00000392 <open>:
SYSCALL(open)
 392:	b8 0f 00 00 00       	mov    $0xf,%eax
 397:	cd 40                	int    $0x40
 399:	c3                   	ret    

0000039a <mknod>:
SYSCALL(mknod)
 39a:	b8 11 00 00 00       	mov    $0x11,%eax
 39f:	cd 40                	int    $0x40
 3a1:	c3                   	ret    

000003a2 <unlink>:
SYSCALL(unlink)
 3a2:	b8 12 00 00 00       	mov    $0x12,%eax
 3a7:	cd 40                	int    $0x40
 3a9:	c3                   	ret    

000003aa <fstat>:
SYSCALL(fstat)
 3aa:	b8 08 00 00 00       	mov    $0x8,%eax
 3af:	cd 40                	int    $0x40
 3b1:	c3                   	ret    

000003b2 <link>:
SYSCALL(link)
 3b2:	b8 13 00 00 00       	mov    $0x13,%eax
 3b7:	cd 40                	int    $0x40
 3b9:	c3                   	ret    

000003ba <mkdir>:
SYSCALL(mkdir)
 3ba:	b8 14 00 00 00       	mov    $0x14,%eax
 3bf:	cd 40                	int    $0x40
 3c1:	c3                   	ret    

000003c2 <chdir>:
SYSCALL(chdir)
 3c2:	b8 09 00 00 00       	mov    $0x9,%eax
 3c7:	cd 40                	int    $0x40
 3c9:	c3                   	ret    

000003ca <dup>:
SYSCALL(dup)
 3ca:	b8 0a 00 00 00       	mov    $0xa,%eax
 3cf:	cd 40                	int    $0x40
 3d1:	c3                   	ret    

000003d2 <getpid>:
SYSCALL(getpid)
 3d2:	b8 0b 00 00 00       	mov    $0xb,%eax
 3d7:	cd 40                	int    $0x40
 3d9:	c3                   	ret    

000003da <sbrk>:
SYSCALL(sbrk)
 3da:	b8 0c 00 00 00       	mov    $0xc,%eax
 3df:	cd 40                	int    $0x40
 3e1:	c3                   	ret    

000003e2 <sleep>:
SYSCALL(sleep)
 3e2:	b8 0d 00 00 00       	mov    $0xd,%eax
 3e7:	cd 40                	int    $0x40
 3e9:	c3                   	ret    

000003ea <uptime>:
SYSCALL(uptime)
 3ea:	b8 0e 00 00 00       	mov    $0xe,%eax
 3ef:	cd 40                	int    $0x40
 3f1:	c3                   	ret    

000003f2 <fwait>:
SYSCALL(fwait)
 3f2:	b8 16 00 00 00       	mov    $0x16,%eax
 3f7:	cd 40                	int    $0x40
 3f9:	c3                   	ret    

000003fa <fwake>:
 3fa:	b8 17 00 00 00       	mov    $0x17,%eax
 3ff:	cd 40                	int    $0x40
 401:	c3                   	ret    
 402:	66 90                	xchg   %ax,%ax
 404:	66 90                	xchg   %ax,%ax
 406:	66 90                	xchg   %ax,%ax
 408:	66 90                	xchg   %ax,%ax
 40a:	66 90                	xchg   %ax,%ax
 40c:	66 90                	xchg   %ax,%ax
 40e:	66 90                	xchg   %ax,%ax

00000410 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
 410:	55                   	push   %ebp
 411:	89 e5                	mov    %esp,%ebp
 413:	57                   	push   %edi
 414:	56                   	push   %esi
 415:	53                   	push   %ebx
 416:	89 c6                	mov    %eax,%esi
 418:	83 ec 3c             	sub    $0x3c,%esp
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 41b:	8b 5d 08             	mov    0x8(%ebp),%ebx
 41e:	85 db                	test   %ebx,%ebx
 420:	74 7e                	je     4a0 <printint+0x90>
 422:	89 d0                	mov    %edx,%eax
 424:	c1 e8 1f             	shr    $0x1f,%eax
 427:	84 c0                	test   %al,%al
 429:	74 75                	je     4a0 <printint+0x90>
    neg = 1;
    x = -xx;
 42b:	89 d0                	mov    %edx,%eax
    neg = 1;
 42d:	c7 45 c4 01 00 00 00 	movl   $0x1,-0x3c(%ebp)
    x = -xx;
 434:	f7 d8                	neg    %eax
 436:	89 75 c0             	mov    %esi,-0x40(%ebp)
  } else {
    x = xx;
  }

  i = 0;
 439:	31 ff                	xor    %edi,%edi
 43b:	8d 5d d7             	lea    -0x29(%ebp),%ebx
 43e:	89 ce                	mov    %ecx,%esi
 440:	eb 08                	jmp    44a <printint+0x3a>
 442:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  do{
    buf[i++] = digits[x % base];
 448:	89 cf                	mov    %ecx,%edi
 44a:	31 d2                	xor    %edx,%edx
 44c:	8d 4f 01             	lea    0x1(%edi),%ecx
 44f:	f7 f6                	div    %esi
 451:	0f b6 92 10 08 00 00 	movzbl 0x810(%edx),%edx
  }while((x /= base) != 0);
 458:	85 c0                	test   %eax,%eax
    buf[i++] = digits[x % base];
 45a:	88 14 0b             	mov    %dl,(%ebx,%ecx,1)
  }while((x /= base) != 0);
 45d:	75 e9                	jne    448 <printint+0x38>
  if(neg)
 45f:	8b 45 c4             	mov    -0x3c(%ebp),%eax
 462:	8b 75 c0             	mov    -0x40(%ebp),%esi
 465:	85 c0                	test   %eax,%eax
 467:	74 08                	je     471 <printint+0x61>
    buf[i++] = '-';
 469:	c6 44 0d d8 2d       	movb   $0x2d,-0x28(%ebp,%ecx,1)
 46e:	8d 4f 02             	lea    0x2(%edi),%ecx

  while(--i >= 0)
 471:	8d 79 ff             	lea    -0x1(%ecx),%edi
 474:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 478:	0f b6 44 3d d8       	movzbl -0x28(%ebp,%edi,1),%eax
  write(fd, &c, 1);
 47d:	83 ec 04             	sub    $0x4,%esp
  while(--i >= 0)
 480:	83 ef 01             	sub    $0x1,%edi
  write(fd, &c, 1);
 483:	6a 01                	push   $0x1
 485:	53                   	push   %ebx
 486:	56                   	push   %esi
 487:	88 45 d7             	mov    %al,-0x29(%ebp)
 48a:	e8 e3 fe ff ff       	call   372 <write>
  while(--i >= 0)
 48f:	83 c4 10             	add    $0x10,%esp
 492:	83 ff ff             	cmp    $0xffffffff,%edi
 495:	75 e1                	jne    478 <printint+0x68>
    putc(fd, buf[i]);
}
 497:	8d 65 f4             	lea    -0xc(%ebp),%esp
 49a:	5b                   	pop    %ebx
 49b:	5e                   	pop    %esi
 49c:	5f                   	pop    %edi
 49d:	5d                   	pop    %ebp
 49e:	c3                   	ret    
 49f:	90                   	nop
    x = xx;
 4a0:	89 d0                	mov    %edx,%eax
  neg = 0;
 4a2:	c7 45 c4 00 00 00 00 	movl   $0x0,-0x3c(%ebp)
 4a9:	eb 8b                	jmp    436 <printint+0x26>
 4ab:	90                   	nop
 4ac:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

000004b0 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 4b0:	55                   	push   %ebp
 4b1:	89 e5                	mov    %esp,%ebp
 4b3:	57                   	push   %edi
 4b4:	56                   	push   %esi
 4b5:	53                   	push   %ebx
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 4b6:	8d 45 10             	lea    0x10(%ebp),%eax
{
 4b9:	83 ec 2c             	sub    $0x2c,%esp
  for(i = 0; fmt[i]; i++){
 4bc:	8b 75 0c             	mov    0xc(%ebp),%esi
{
 4bf:	8b 7d 08             	mov    0x8(%ebp),%edi
  for(i = 0; fmt[i]; i++){
 4c2:	89 45 d0             	mov    %eax,-0x30(%ebp)
 4c5:	0f b6 1e             	movzbl (%esi),%ebx
 4c8:	83 c6 01             	add    $0x1,%esi
 4cb:	84 db                	test   %bl,%bl
 4cd:	0f 84 b0 00 00 00    	je     583 <printf+0xd3>
 4d3:	31 d2                	xor    %edx,%edx
 4d5:	eb 39                	jmp    510 <printf+0x60>
 4d7:	89 f6                	mov    %esi,%esi
 4d9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
 4e0:	83 f8 25             	cmp    $0x25,%eax
 4e3:	89 55 d4             	mov    %edx,-0x2c(%ebp)
        state = '%';
 4e6:	ba 25 00 00 00       	mov    $0x25,%edx
      if(c == '%'){
 4eb:	74 18                	je     505 <printf+0x55>
  write(fd, &c, 1);
 4ed:	8d 45 e2             	lea    -0x1e(%ebp),%eax
 4f0:	83 ec 04             	sub    $0x4,%esp
 4f3:	88 5d e2             	mov    %bl,-0x1e(%ebp)
 4f6:	6a 01                	push   $0x1
 4f8:	50                   	push   %eax
 4f9:	57                   	push   %edi
 4fa:	e8 73 fe ff ff       	call   372 <write>
 4ff:	8b 55 d4             	mov    -0x2c(%ebp),%edx
 502:	83 c4 10             	add    $0x10,%esp
 505:	83 c6 01             	add    $0x1,%esi
  for(i = 0; fmt[i]; i++){
 508:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
 50c:	84 db                	test   %bl,%bl
 50e:	74 73                	je     583 <printf+0xd3>
    if(state == 0){
 510:	85 d2                	test   %edx,%edx
    c = fmt[i] & 0xff;
 512:	0f be cb             	movsbl %bl,%ecx
 515:	0f b6 c3             	movzbl %bl,%eax
    if(state == 0){
 518:	74 c6                	je     4e0 <printf+0x30>
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
 51a:	83 fa 25             	cmp    $0x25,%edx
 51d:	75 e6                	jne    505 <printf+0x55>
      if(c == 'd'){
 51f:	83 f8 64             	cmp    $0x64,%eax
 522:	0f 84 f8 00 00 00    	je     620 <printf+0x170>
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
 528:	81 e1 f7 00 00 00    	and    $0xf7,%ecx
 52e:	83 f9 70             	cmp    $0x70,%ecx
 531:	74 5d                	je     590 <printf+0xe0>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
 533:	83 f8 73             	cmp    $0x73,%eax
 536:	0f 84 84 00 00 00    	je     5c0 <printf+0x110>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 53c:	83 f8 63             	cmp    $0x63,%eax
 53f:	0f 84 ea 00 00 00    	je     62f <printf+0x17f>
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
 545:	83 f8 25             	cmp    $0x25,%eax
 548:	0f 84 c2 00 00 00    	je     610 <printf+0x160>
  write(fd, &c, 1);
 54e:	8d 45 e7             	lea    -0x19(%ebp),%eax
 551:	83 ec 04             	sub    $0x4,%esp
 554:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
 558:	6a 01                	push   $0x1
 55a:	50                   	push   %eax
 55b:	57                   	push   %edi
 55c:	e8 11 fe ff ff       	call   372 <write>
 561:	83 c4 0c             	add    $0xc,%esp
 564:	8d 45 e6             	lea    -0x1a(%ebp),%eax
 567:	88 5d e6             	mov    %bl,-0x1a(%ebp)
 56a:	6a 01                	push   $0x1
 56c:	50                   	push   %eax
 56d:	57                   	push   %edi
 56e:	83 c6 01             	add    $0x1,%esi
 571:	e8 fc fd ff ff       	call   372 <write>
  for(i = 0; fmt[i]; i++){
 576:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
  write(fd, &c, 1);
 57a:	83 c4 10             	add    $0x10,%esp
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 57d:	31 d2                	xor    %edx,%edx
  for(i = 0; fmt[i]; i++){
 57f:	84 db                	test   %bl,%bl
 581:	75 8d                	jne    510 <printf+0x60>
    }
  }
}
 583:	8d 65 f4             	lea    -0xc(%ebp),%esp
 586:	5b                   	pop    %ebx
 587:	5e                   	pop    %esi
 588:	5f                   	pop    %edi
 589:	5d                   	pop    %ebp
 58a:	c3                   	ret    
 58b:	90                   	nop
 58c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        printint(fd, *ap, 16, 0);
 590:	83 ec 0c             	sub    $0xc,%esp
 593:	b9 10 00 00 00       	mov    $0x10,%ecx
 598:	6a 00                	push   $0x0
 59a:	8b 5d d0             	mov    -0x30(%ebp),%ebx
 59d:	89 f8                	mov    %edi,%eax
 59f:	8b 13                	mov    (%ebx),%edx
 5a1:	e8 6a fe ff ff       	call   410 <printint>
        ap++;
 5a6:	89 d8                	mov    %ebx,%eax
 5a8:	83 c4 10             	add    $0x10,%esp
      state = 0;
 5ab:	31 d2                	xor    %edx,%edx
        ap++;
 5ad:	83 c0 04             	add    $0x4,%eax
 5b0:	89 45 d0             	mov    %eax,-0x30(%ebp)
 5b3:	e9 4d ff ff ff       	jmp    505 <printf+0x55>
 5b8:	90                   	nop
 5b9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        s = (char*)*ap;
 5c0:	8b 45 d0             	mov    -0x30(%ebp),%eax
 5c3:	8b 18                	mov    (%eax),%ebx
        ap++;
 5c5:	83 c0 04             	add    $0x4,%eax
 5c8:	89 45 d0             	mov    %eax,-0x30(%ebp)
        if(s == 0)
 5cb:	85 db                	test   %ebx,%ebx
 5cd:	74 7c                	je     64b <printf+0x19b>
        while(*s != 0){
 5cf:	0f b6 03             	movzbl (%ebx),%eax
 5d2:	84 c0                	test   %al,%al
 5d4:	74 29                	je     5ff <printf+0x14f>
 5d6:	8d 76 00             	lea    0x0(%esi),%esi
 5d9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
 5e0:	88 45 e3             	mov    %al,-0x1d(%ebp)
  write(fd, &c, 1);
 5e3:	8d 45 e3             	lea    -0x1d(%ebp),%eax
 5e6:	83 ec 04             	sub    $0x4,%esp
 5e9:	6a 01                	push   $0x1
          s++;
 5eb:	83 c3 01             	add    $0x1,%ebx
  write(fd, &c, 1);
 5ee:	50                   	push   %eax
 5ef:	57                   	push   %edi
 5f0:	e8 7d fd ff ff       	call   372 <write>
        while(*s != 0){
 5f5:	0f b6 03             	movzbl (%ebx),%eax
 5f8:	83 c4 10             	add    $0x10,%esp
 5fb:	84 c0                	test   %al,%al
 5fd:	75 e1                	jne    5e0 <printf+0x130>
      state = 0;
 5ff:	31 d2                	xor    %edx,%edx
 601:	e9 ff fe ff ff       	jmp    505 <printf+0x55>
 606:	8d 76 00             	lea    0x0(%esi),%esi
 609:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
  write(fd, &c, 1);
 610:	83 ec 04             	sub    $0x4,%esp
 613:	88 5d e5             	mov    %bl,-0x1b(%ebp)
 616:	8d 45 e5             	lea    -0x1b(%ebp),%eax
 619:	6a 01                	push   $0x1
 61b:	e9 4c ff ff ff       	jmp    56c <printf+0xbc>
        printint(fd, *ap, 10, 1);
 620:	83 ec 0c             	sub    $0xc,%esp
 623:	b9 0a 00 00 00       	mov    $0xa,%ecx
 628:	6a 01                	push   $0x1
 62a:	e9 6b ff ff ff       	jmp    59a <printf+0xea>
        putc(fd, *ap);
 62f:	8b 5d d0             	mov    -0x30(%ebp),%ebx
  write(fd, &c, 1);
 632:	83 ec 04             	sub    $0x4,%esp
        putc(fd, *ap);
 635:	8b 03                	mov    (%ebx),%eax
  write(fd, &c, 1);
 637:	6a 01                	push   $0x1
        putc(fd, *ap);
 639:	88 45 e4             	mov    %al,-0x1c(%ebp)
  write(fd, &c, 1);
 63c:	8d 45 e4             	lea    -0x1c(%ebp),%eax
 63f:	50                   	push   %eax
 640:	57                   	push   %edi
 641:	e8 2c fd ff ff       	call   372 <write>
 646:	e9 5b ff ff ff       	jmp    5a6 <printf+0xf6>
        while(*s != 0){
 64b:	b8 28 00 00 00       	mov    $0x28,%eax
          s = "(null)";
 650:	bb 08 08 00 00       	mov    $0x808,%ebx
 655:	eb 89                	jmp    5e0 <printf+0x130>
 657:	66 90                	xchg   %ax,%ax
 659:	66 90                	xchg   %ax,%ax
 65b:	66 90                	xchg   %ax,%ax
 65d:	66 90                	xchg   %ax,%ax
 65f:	90                   	nop

00000660 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 660:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 661:	a1 e0 0a 00 00       	mov    0xae0,%eax
{
 666:	89 e5                	mov    %esp,%ebp
 668:	57                   	push   %edi
 669:	56                   	push   %esi
 66a:	53                   	push   %ebx
 66b:	8b 5d 08             	mov    0x8(%ebp),%ebx
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 66e:	8b 10                	mov    (%eax),%edx
  bp = (Header*)ap - 1;
 670:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 673:	39 c8                	cmp    %ecx,%eax
 675:	73 19                	jae    690 <free+0x30>
 677:	89 f6                	mov    %esi,%esi
 679:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
 680:	39 d1                	cmp    %edx,%ecx
 682:	72 1c                	jb     6a0 <free+0x40>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 684:	39 d0                	cmp    %edx,%eax
 686:	73 18                	jae    6a0 <free+0x40>
{
 688:	89 d0                	mov    %edx,%eax
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 68a:	39 c8                	cmp    %ecx,%eax
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 68c:	8b 10                	mov    (%eax),%edx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 68e:	72 f0                	jb     680 <free+0x20>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 690:	39 d0                	cmp    %edx,%eax
 692:	72 f4                	jb     688 <free+0x28>
 694:	39 d1                	cmp    %edx,%ecx
 696:	73 f0                	jae    688 <free+0x28>
 698:	90                   	nop
 699:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      break;
  if(bp + bp->s.size == p->s.ptr){
 6a0:	8b 73 fc             	mov    -0x4(%ebx),%esi
 6a3:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 6a6:	39 fa                	cmp    %edi,%edx
 6a8:	74 19                	je     6c3 <free+0x63>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 6aa:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 6ad:	8b 50 04             	mov    0x4(%eax),%edx
 6b0:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 6b3:	39 f1                	cmp    %esi,%ecx
 6b5:	74 23                	je     6da <free+0x7a>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 6b7:	89 08                	mov    %ecx,(%eax)
  freep = p;
 6b9:	a3 e0 0a 00 00       	mov    %eax,0xae0
}
 6be:	5b                   	pop    %ebx
 6bf:	5e                   	pop    %esi
 6c0:	5f                   	pop    %edi
 6c1:	5d                   	pop    %ebp
 6c2:	c3                   	ret    
    bp->s.size += p->s.ptr->s.size;
 6c3:	03 72 04             	add    0x4(%edx),%esi
 6c6:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 6c9:	8b 10                	mov    (%eax),%edx
 6cb:	8b 12                	mov    (%edx),%edx
 6cd:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 6d0:	8b 50 04             	mov    0x4(%eax),%edx
 6d3:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 6d6:	39 f1                	cmp    %esi,%ecx
 6d8:	75 dd                	jne    6b7 <free+0x57>
    p->s.size += bp->s.size;
 6da:	03 53 fc             	add    -0x4(%ebx),%edx
  freep = p;
 6dd:	a3 e0 0a 00 00       	mov    %eax,0xae0
    p->s.size += bp->s.size;
 6e2:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 6e5:	8b 53 f8             	mov    -0x8(%ebx),%edx
 6e8:	89 10                	mov    %edx,(%eax)
}
 6ea:	5b                   	pop    %ebx
 6eb:	5e                   	pop    %esi
 6ec:	5f                   	pop    %edi
 6ed:	5d                   	pop    %ebp
 6ee:	c3                   	ret    
 6ef:	90                   	nop

000006f0 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 6f0:	55                   	push   %ebp
 6f1:	89 e5                	mov    %esp,%ebp
 6f3:	57                   	push   %edi
 6f4:	56                   	push   %esi
 6f5:	53                   	push   %ebx
 6f6:	83 ec 0c             	sub    $0xc,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 6f9:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
 6fc:	8b 15 e0 0a 00 00    	mov    0xae0,%edx
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 702:	8d 78 07             	lea    0x7(%eax),%edi
 705:	c1 ef 03             	shr    $0x3,%edi
 708:	83 c7 01             	add    $0x1,%edi
  if((prevp = freep) == 0){
 70b:	85 d2                	test   %edx,%edx
 70d:	0f 84 93 00 00 00    	je     7a6 <malloc+0xb6>
 713:	8b 02                	mov    (%edx),%eax
 715:	8b 48 04             	mov    0x4(%eax),%ecx
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
 718:	39 cf                	cmp    %ecx,%edi
 71a:	76 64                	jbe    780 <malloc+0x90>
 71c:	81 ff 00 10 00 00    	cmp    $0x1000,%edi
 722:	bb 00 10 00 00       	mov    $0x1000,%ebx
 727:	0f 43 df             	cmovae %edi,%ebx
  p = sbrk(nu * sizeof(Header));
 72a:	8d 34 dd 00 00 00 00 	lea    0x0(,%ebx,8),%esi
 731:	eb 0e                	jmp    741 <malloc+0x51>
 733:	90                   	nop
 734:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 738:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
 73a:	8b 48 04             	mov    0x4(%eax),%ecx
 73d:	39 cf                	cmp    %ecx,%edi
 73f:	76 3f                	jbe    780 <malloc+0x90>
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 741:	39 05 e0 0a 00 00    	cmp    %eax,0xae0
 747:	89 c2                	mov    %eax,%edx
 749:	75 ed                	jne    738 <malloc+0x48>
  p = sbrk(nu * sizeof(Header));
 74b:	83 ec 0c             	sub    $0xc,%esp
 74e:	56                   	push   %esi
 74f:	e8 86 fc ff ff       	call   3da <sbrk>
  if(p == (char*)-1)
 754:	83 c4 10             	add    $0x10,%esp
 757:	83 f8 ff             	cmp    $0xffffffff,%eax
 75a:	74 1c                	je     778 <malloc+0x88>
  hp->s.size = nu;
 75c:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 75f:	83 ec 0c             	sub    $0xc,%esp
 762:	83 c0 08             	add    $0x8,%eax
 765:	50                   	push   %eax
 766:	e8 f5 fe ff ff       	call   660 <free>
  return freep;
 76b:	8b 15 e0 0a 00 00    	mov    0xae0,%edx
      if((p = morecore(nunits)) == 0)
 771:	83 c4 10             	add    $0x10,%esp
 774:	85 d2                	test   %edx,%edx
 776:	75 c0                	jne    738 <malloc+0x48>
        return 0;
 778:	31 c0                	xor    %eax,%eax
 77a:	eb 1c                	jmp    798 <malloc+0xa8>
 77c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
      if(p->s.size == nunits)
 780:	39 cf                	cmp    %ecx,%edi
 782:	74 1c                	je     7a0 <malloc+0xb0>
        p->s.size -= nunits;
 784:	29 f9                	sub    %edi,%ecx
 786:	89 48 04             	mov    %ecx,0x4(%eax)
        p += p->s.size;
 789:	8d 04 c8             	lea    (%eax,%ecx,8),%eax
        p->s.size = nunits;
 78c:	89 78 04             	mov    %edi,0x4(%eax)
      freep = prevp;
 78f:	89 15 e0 0a 00 00    	mov    %edx,0xae0
      return (void*)(p + 1);
 795:	83 c0 08             	add    $0x8,%eax
  }
}
 798:	8d 65 f4             	lea    -0xc(%ebp),%esp
 79b:	5b                   	pop    %ebx
 79c:	5e                   	pop    %esi
 79d:	5f                   	pop    %edi
 79e:	5d                   	pop    %ebp
 79f:	c3                   	ret    
        prevp->s.ptr = p->s.ptr;
 7a0:	8b 08                	mov    (%eax),%ecx
 7a2:	89 0a                	mov    %ecx,(%edx)
 7a4:	eb e9                	jmp    78f <malloc+0x9f>
    base.s.ptr = freep = prevp = &base;
 7a6:	c7 05 e0 0a 00 00 e4 	movl   $0xae4,0xae0
 7ad:	0a 00 00 
 7b0:	c7 05 e4 0a 00 00 e4 	movl   $0xae4,0xae4
 7b7:	0a 00 00 
    base.s.size = 0;
 7ba:	b8 e4 0a 00 00       	mov    $0xae4,%eax
 7bf:	c7 05 e8 0a 00 00 00 	movl   $0x0,0xae8
 7c6:	00 00 00 
 7c9:	e9 4e ff ff ff       	jmp    71c <malloc+0x2c>
