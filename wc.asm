
_wc:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
  printf(1, "%d %d %d %s\n", l, w, c, name);
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
  27:	7e 56                	jle    7f <main+0x7f>
  29:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    wc(0, "");
    exit();
  }

  for(i = 1; i < argc; i++){
    if((fd = open(argv[i], 0)) < 0){
  30:	83 ec 08             	sub    $0x8,%esp
  33:	6a 00                	push   $0x0
  35:	ff 33                	pushl  (%ebx)
  37:	e8 b6 03 00 00       	call   3f2 <open>
  3c:	83 c4 10             	add    $0x10,%esp
  3f:	85 c0                	test   %eax,%eax
  41:	89 c7                	mov    %eax,%edi
  43:	78 26                	js     6b <main+0x6b>
      printf(1, "wc: cannot open %s\n", argv[i]);
      exit();
    }
    wc(fd, argv[i]);
  45:	83 ec 08             	sub    $0x8,%esp
  48:	ff 33                	pushl  (%ebx)
  for(i = 1; i < argc; i++){
  4a:	83 c6 01             	add    $0x1,%esi
    wc(fd, argv[i]);
  4d:	50                   	push   %eax
  4e:	83 c3 04             	add    $0x4,%ebx
  51:	e8 4a 00 00 00       	call   a0 <wc>
    close(fd);
  56:	89 3c 24             	mov    %edi,(%esp)
  59:	e8 7c 03 00 00       	call   3da <close>
  for(i = 1; i < argc; i++){
  5e:	83 c4 10             	add    $0x10,%esp
  61:	39 75 e4             	cmp    %esi,-0x1c(%ebp)
  64:	75 ca                	jne    30 <main+0x30>
  }
  exit();
  66:	e8 47 03 00 00       	call   3b2 <exit>
      printf(1, "wc: cannot open %s\n", argv[i]);
  6b:	50                   	push   %eax
  6c:	ff 33                	pushl  (%ebx)
  6e:	68 53 08 00 00       	push   $0x853
  73:	6a 01                	push   $0x1
  75:	e8 96 04 00 00       	call   510 <printf>
      exit();
  7a:	e8 33 03 00 00       	call   3b2 <exit>
    wc(0, "");
  7f:	52                   	push   %edx
  80:	52                   	push   %edx
  81:	68 45 08 00 00       	push   $0x845
  86:	6a 00                	push   $0x0
  88:	e8 13 00 00 00       	call   a0 <wc>
    exit();
  8d:	e8 20 03 00 00       	call   3b2 <exit>
  92:	66 90                	xchg   %ax,%ax
  94:	66 90                	xchg   %ax,%ax
  96:	66 90                	xchg   %ax,%ax
  98:	66 90                	xchg   %ax,%ax
  9a:	66 90                	xchg   %ax,%ax
  9c:	66 90                	xchg   %ax,%ax
  9e:	66 90                	xchg   %ax,%ax

000000a0 <wc>:
{
  a0:	55                   	push   %ebp
  a1:	89 e5                	mov    %esp,%ebp
  a3:	57                   	push   %edi
  a4:	56                   	push   %esi
  a5:	53                   	push   %ebx
  inword = 0;
  a6:	31 f6                	xor    %esi,%esi
  l = w = c = 0;
  a8:	31 db                	xor    %ebx,%ebx
{
  aa:	83 ec 1c             	sub    $0x1c,%esp
  l = w = c = 0;
  ad:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%ebp)
  b4:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
  bb:	90                   	nop
  bc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  while((n = read(fd, buf, sizeof(buf))) > 0){
  c0:	83 ec 04             	sub    $0x4,%esp
  c3:	68 00 02 00 00       	push   $0x200
  c8:	68 80 0b 00 00       	push   $0xb80
  cd:	ff 75 08             	pushl  0x8(%ebp)
  d0:	e8 f5 02 00 00       	call   3ca <read>
  d5:	83 c4 10             	add    $0x10,%esp
  d8:	83 f8 00             	cmp    $0x0,%eax
  db:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  de:	7e 54                	jle    134 <wc+0x94>
  e0:	31 ff                	xor    %edi,%edi
  e2:	eb 0e                	jmp    f2 <wc+0x52>
  e4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        inword = 0;
  e8:	31 f6                	xor    %esi,%esi
    for(i=0; i<n; i++){
  ea:	83 c7 01             	add    $0x1,%edi
  ed:	39 7d e4             	cmp    %edi,-0x1c(%ebp)
  f0:	74 3a                	je     12c <wc+0x8c>
      if(buf[i] == '\n')
  f2:	0f be 87 80 0b 00 00 	movsbl 0xb80(%edi),%eax
        l++;
  f9:	31 c9                	xor    %ecx,%ecx
  fb:	3c 0a                	cmp    $0xa,%al
  fd:	0f 94 c1             	sete   %cl
      if(strchr(" \r\t\n\v", buf[i]))
 100:	83 ec 08             	sub    $0x8,%esp
 103:	50                   	push   %eax
 104:	68 30 08 00 00       	push   $0x830
        l++;
 109:	01 cb                	add    %ecx,%ebx
      if(strchr(" \r\t\n\v", buf[i]))
 10b:	e8 30 01 00 00       	call   240 <strchr>
 110:	83 c4 10             	add    $0x10,%esp
 113:	85 c0                	test   %eax,%eax
 115:	75 d1                	jne    e8 <wc+0x48>
      else if(!inword){
 117:	85 f6                	test   %esi,%esi
 119:	75 cf                	jne    ea <wc+0x4a>
        w++;
 11b:	83 45 e0 01          	addl   $0x1,-0x20(%ebp)
    for(i=0; i<n; i++){
 11f:	83 c7 01             	add    $0x1,%edi
 122:	39 7d e4             	cmp    %edi,-0x1c(%ebp)
        inword = 1;
 125:	be 01 00 00 00       	mov    $0x1,%esi
    for(i=0; i<n; i++){
 12a:	75 c6                	jne    f2 <wc+0x52>
 12c:	8b 55 e4             	mov    -0x1c(%ebp),%edx
 12f:	01 55 dc             	add    %edx,-0x24(%ebp)
 132:	eb 8c                	jmp    c0 <wc+0x20>
  if(n < 0){
 134:	75 24                	jne    15a <wc+0xba>
  printf(1, "%d %d %d %s\n", l, w, c, name);
 136:	83 ec 08             	sub    $0x8,%esp
 139:	ff 75 0c             	pushl  0xc(%ebp)
 13c:	ff 75 dc             	pushl  -0x24(%ebp)
 13f:	ff 75 e0             	pushl  -0x20(%ebp)
 142:	53                   	push   %ebx
 143:	68 46 08 00 00       	push   $0x846
 148:	6a 01                	push   $0x1
 14a:	e8 c1 03 00 00       	call   510 <printf>
}
 14f:	83 c4 20             	add    $0x20,%esp
 152:	8d 65 f4             	lea    -0xc(%ebp),%esp
 155:	5b                   	pop    %ebx
 156:	5e                   	pop    %esi
 157:	5f                   	pop    %edi
 158:	5d                   	pop    %ebp
 159:	c3                   	ret    
    printf(1, "wc: read error\n");
 15a:	83 ec 08             	sub    $0x8,%esp
 15d:	68 36 08 00 00       	push   $0x836
 162:	6a 01                	push   $0x1
 164:	e8 a7 03 00 00       	call   510 <printf>
    exit();
 169:	e8 44 02 00 00       	call   3b2 <exit>
 16e:	66 90                	xchg   %ax,%ax

00000170 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, const char *t)
{
 170:	55                   	push   %ebp
 171:	89 e5                	mov    %esp,%ebp
 173:	53                   	push   %ebx
 174:	8b 45 08             	mov    0x8(%ebp),%eax
 177:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 17a:	89 c2                	mov    %eax,%edx
 17c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 180:	83 c1 01             	add    $0x1,%ecx
 183:	0f b6 59 ff          	movzbl -0x1(%ecx),%ebx
 187:	83 c2 01             	add    $0x1,%edx
 18a:	84 db                	test   %bl,%bl
 18c:	88 5a ff             	mov    %bl,-0x1(%edx)
 18f:	75 ef                	jne    180 <strcpy+0x10>
    ;
  return os;
}
 191:	5b                   	pop    %ebx
 192:	5d                   	pop    %ebp
 193:	c3                   	ret    
 194:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 19a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

000001a0 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 1a0:	55                   	push   %ebp
 1a1:	89 e5                	mov    %esp,%ebp
 1a3:	56                   	push   %esi
 1a4:	53                   	push   %ebx
 1a5:	8b 55 08             	mov    0x8(%ebp),%edx
 1a8:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  while(*p && *p == *q)
 1ab:	0f b6 02             	movzbl (%edx),%eax
 1ae:	0f b6 19             	movzbl (%ecx),%ebx
 1b1:	84 c0                	test   %al,%al
 1b3:	75 1e                	jne    1d3 <strcmp+0x33>
 1b5:	eb 29                	jmp    1e0 <strcmp+0x40>
 1b7:	89 f6                	mov    %esi,%esi
 1b9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    p++, q++;
 1c0:	83 c2 01             	add    $0x1,%edx
  while(*p && *p == *q)
 1c3:	0f b6 02             	movzbl (%edx),%eax
    p++, q++;
 1c6:	8d 71 01             	lea    0x1(%ecx),%esi
  while(*p && *p == *q)
 1c9:	0f b6 59 01          	movzbl 0x1(%ecx),%ebx
 1cd:	84 c0                	test   %al,%al
 1cf:	74 0f                	je     1e0 <strcmp+0x40>
 1d1:	89 f1                	mov    %esi,%ecx
 1d3:	38 d8                	cmp    %bl,%al
 1d5:	74 e9                	je     1c0 <strcmp+0x20>
  return (uchar)*p - (uchar)*q;
 1d7:	29 d8                	sub    %ebx,%eax
}
 1d9:	5b                   	pop    %ebx
 1da:	5e                   	pop    %esi
 1db:	5d                   	pop    %ebp
 1dc:	c3                   	ret    
 1dd:	8d 76 00             	lea    0x0(%esi),%esi
  while(*p && *p == *q)
 1e0:	31 c0                	xor    %eax,%eax
  return (uchar)*p - (uchar)*q;
 1e2:	29 d8                	sub    %ebx,%eax
}
 1e4:	5b                   	pop    %ebx
 1e5:	5e                   	pop    %esi
 1e6:	5d                   	pop    %ebp
 1e7:	c3                   	ret    
 1e8:	90                   	nop
 1e9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

000001f0 <strlen>:

uint
strlen(const char *s)
{
 1f0:	55                   	push   %ebp
 1f1:	89 e5                	mov    %esp,%ebp
 1f3:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
 1f6:	80 39 00             	cmpb   $0x0,(%ecx)
 1f9:	74 12                	je     20d <strlen+0x1d>
 1fb:	31 d2                	xor    %edx,%edx
 1fd:	8d 76 00             	lea    0x0(%esi),%esi
 200:	83 c2 01             	add    $0x1,%edx
 203:	80 3c 11 00          	cmpb   $0x0,(%ecx,%edx,1)
 207:	89 d0                	mov    %edx,%eax
 209:	75 f5                	jne    200 <strlen+0x10>
    ;
  return n;
}
 20b:	5d                   	pop    %ebp
 20c:	c3                   	ret    
  for(n = 0; s[n]; n++)
 20d:	31 c0                	xor    %eax,%eax
}
 20f:	5d                   	pop    %ebp
 210:	c3                   	ret    
 211:	eb 0d                	jmp    220 <memset>
 213:	90                   	nop
 214:	90                   	nop
 215:	90                   	nop
 216:	90                   	nop
 217:	90                   	nop
 218:	90                   	nop
 219:	90                   	nop
 21a:	90                   	nop
 21b:	90                   	nop
 21c:	90                   	nop
 21d:	90                   	nop
 21e:	90                   	nop
 21f:	90                   	nop

00000220 <memset>:

void*
memset(void *dst, int c, uint n)
{
 220:	55                   	push   %ebp
 221:	89 e5                	mov    %esp,%ebp
 223:	57                   	push   %edi
 224:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 227:	8b 4d 10             	mov    0x10(%ebp),%ecx
 22a:	8b 45 0c             	mov    0xc(%ebp),%eax
 22d:	89 d7                	mov    %edx,%edi
 22f:	fc                   	cld    
 230:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 232:	89 d0                	mov    %edx,%eax
 234:	5f                   	pop    %edi
 235:	5d                   	pop    %ebp
 236:	c3                   	ret    
 237:	89 f6                	mov    %esi,%esi
 239:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000240 <strchr>:

char*
strchr(const char *s, char c)
{
 240:	55                   	push   %ebp
 241:	89 e5                	mov    %esp,%ebp
 243:	53                   	push   %ebx
 244:	8b 45 08             	mov    0x8(%ebp),%eax
 247:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  for(; *s; s++)
 24a:	0f b6 10             	movzbl (%eax),%edx
 24d:	84 d2                	test   %dl,%dl
 24f:	74 1d                	je     26e <strchr+0x2e>
    if(*s == c)
 251:	38 d3                	cmp    %dl,%bl
 253:	89 d9                	mov    %ebx,%ecx
 255:	75 0d                	jne    264 <strchr+0x24>
 257:	eb 17                	jmp    270 <strchr+0x30>
 259:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 260:	38 ca                	cmp    %cl,%dl
 262:	74 0c                	je     270 <strchr+0x30>
  for(; *s; s++)
 264:	83 c0 01             	add    $0x1,%eax
 267:	0f b6 10             	movzbl (%eax),%edx
 26a:	84 d2                	test   %dl,%dl
 26c:	75 f2                	jne    260 <strchr+0x20>
      return (char*)s;
  return 0;
 26e:	31 c0                	xor    %eax,%eax
}
 270:	5b                   	pop    %ebx
 271:	5d                   	pop    %ebp
 272:	c3                   	ret    
 273:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 279:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000280 <gets>:

char*
gets(char *buf, int max)
{
 280:	55                   	push   %ebp
 281:	89 e5                	mov    %esp,%ebp
 283:	57                   	push   %edi
 284:	56                   	push   %esi
 285:	53                   	push   %ebx
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 286:	31 f6                	xor    %esi,%esi
    cc = read(0, &c, 1);
 288:	8d 7d e7             	lea    -0x19(%ebp),%edi
{
 28b:	83 ec 1c             	sub    $0x1c,%esp
  for(i=0; i+1 < max; ){
 28e:	eb 29                	jmp    2b9 <gets+0x39>
    cc = read(0, &c, 1);
 290:	83 ec 04             	sub    $0x4,%esp
 293:	6a 01                	push   $0x1
 295:	57                   	push   %edi
 296:	6a 00                	push   $0x0
 298:	e8 2d 01 00 00       	call   3ca <read>
    if(cc < 1)
 29d:	83 c4 10             	add    $0x10,%esp
 2a0:	85 c0                	test   %eax,%eax
 2a2:	7e 1d                	jle    2c1 <gets+0x41>
      break;
    buf[i++] = c;
 2a4:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 2a8:	8b 55 08             	mov    0x8(%ebp),%edx
 2ab:	89 de                	mov    %ebx,%esi
    if(c == '\n' || c == '\r')
 2ad:	3c 0a                	cmp    $0xa,%al
    buf[i++] = c;
 2af:	88 44 1a ff          	mov    %al,-0x1(%edx,%ebx,1)
    if(c == '\n' || c == '\r')
 2b3:	74 1b                	je     2d0 <gets+0x50>
 2b5:	3c 0d                	cmp    $0xd,%al
 2b7:	74 17                	je     2d0 <gets+0x50>
  for(i=0; i+1 < max; ){
 2b9:	8d 5e 01             	lea    0x1(%esi),%ebx
 2bc:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 2bf:	7c cf                	jl     290 <gets+0x10>
      break;
  }
  buf[i] = '\0';
 2c1:	8b 45 08             	mov    0x8(%ebp),%eax
 2c4:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
  return buf;
}
 2c8:	8d 65 f4             	lea    -0xc(%ebp),%esp
 2cb:	5b                   	pop    %ebx
 2cc:	5e                   	pop    %esi
 2cd:	5f                   	pop    %edi
 2ce:	5d                   	pop    %ebp
 2cf:	c3                   	ret    
  buf[i] = '\0';
 2d0:	8b 45 08             	mov    0x8(%ebp),%eax
  for(i=0; i+1 < max; ){
 2d3:	89 de                	mov    %ebx,%esi
  buf[i] = '\0';
 2d5:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
}
 2d9:	8d 65 f4             	lea    -0xc(%ebp),%esp
 2dc:	5b                   	pop    %ebx
 2dd:	5e                   	pop    %esi
 2de:	5f                   	pop    %edi
 2df:	5d                   	pop    %ebp
 2e0:	c3                   	ret    
 2e1:	eb 0d                	jmp    2f0 <stat>
 2e3:	90                   	nop
 2e4:	90                   	nop
 2e5:	90                   	nop
 2e6:	90                   	nop
 2e7:	90                   	nop
 2e8:	90                   	nop
 2e9:	90                   	nop
 2ea:	90                   	nop
 2eb:	90                   	nop
 2ec:	90                   	nop
 2ed:	90                   	nop
 2ee:	90                   	nop
 2ef:	90                   	nop

000002f0 <stat>:

int
stat(const char *n, struct stat *st)
{
 2f0:	55                   	push   %ebp
 2f1:	89 e5                	mov    %esp,%ebp
 2f3:	56                   	push   %esi
 2f4:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 2f5:	83 ec 08             	sub    $0x8,%esp
 2f8:	6a 00                	push   $0x0
 2fa:	ff 75 08             	pushl  0x8(%ebp)
 2fd:	e8 f0 00 00 00       	call   3f2 <open>
  if(fd < 0)
 302:	83 c4 10             	add    $0x10,%esp
 305:	85 c0                	test   %eax,%eax
 307:	78 27                	js     330 <stat+0x40>
    return -1;
  r = fstat(fd, st);
 309:	83 ec 08             	sub    $0x8,%esp
 30c:	ff 75 0c             	pushl  0xc(%ebp)
 30f:	89 c3                	mov    %eax,%ebx
 311:	50                   	push   %eax
 312:	e8 f3 00 00 00       	call   40a <fstat>
  close(fd);
 317:	89 1c 24             	mov    %ebx,(%esp)
  r = fstat(fd, st);
 31a:	89 c6                	mov    %eax,%esi
  close(fd);
 31c:	e8 b9 00 00 00       	call   3da <close>
  return r;
 321:	83 c4 10             	add    $0x10,%esp
}
 324:	8d 65 f8             	lea    -0x8(%ebp),%esp
 327:	89 f0                	mov    %esi,%eax
 329:	5b                   	pop    %ebx
 32a:	5e                   	pop    %esi
 32b:	5d                   	pop    %ebp
 32c:	c3                   	ret    
 32d:	8d 76 00             	lea    0x0(%esi),%esi
    return -1;
 330:	be ff ff ff ff       	mov    $0xffffffff,%esi
 335:	eb ed                	jmp    324 <stat+0x34>
 337:	89 f6                	mov    %esi,%esi
 339:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000340 <atoi>:

int
atoi(const char *s)
{
 340:	55                   	push   %ebp
 341:	89 e5                	mov    %esp,%ebp
 343:	53                   	push   %ebx
 344:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 347:	0f be 11             	movsbl (%ecx),%edx
 34a:	8d 42 d0             	lea    -0x30(%edx),%eax
 34d:	3c 09                	cmp    $0x9,%al
 34f:	b8 00 00 00 00       	mov    $0x0,%eax
 354:	77 1f                	ja     375 <atoi+0x35>
 356:	8d 76 00             	lea    0x0(%esi),%esi
 359:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    n = n*10 + *s++ - '0';
 360:	8d 04 80             	lea    (%eax,%eax,4),%eax
 363:	83 c1 01             	add    $0x1,%ecx
 366:	8d 44 42 d0          	lea    -0x30(%edx,%eax,2),%eax
  while('0' <= *s && *s <= '9')
 36a:	0f be 11             	movsbl (%ecx),%edx
 36d:	8d 5a d0             	lea    -0x30(%edx),%ebx
 370:	80 fb 09             	cmp    $0x9,%bl
 373:	76 eb                	jbe    360 <atoi+0x20>
  return n;
}
 375:	5b                   	pop    %ebx
 376:	5d                   	pop    %ebp
 377:	c3                   	ret    
 378:	90                   	nop
 379:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000380 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 380:	55                   	push   %ebp
 381:	89 e5                	mov    %esp,%ebp
 383:	56                   	push   %esi
 384:	53                   	push   %ebx
 385:	8b 5d 10             	mov    0x10(%ebp),%ebx
 388:	8b 45 08             	mov    0x8(%ebp),%eax
 38b:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 38e:	85 db                	test   %ebx,%ebx
 390:	7e 14                	jle    3a6 <memmove+0x26>
 392:	31 d2                	xor    %edx,%edx
 394:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    *dst++ = *src++;
 398:	0f b6 0c 16          	movzbl (%esi,%edx,1),%ecx
 39c:	88 0c 10             	mov    %cl,(%eax,%edx,1)
 39f:	83 c2 01             	add    $0x1,%edx
  while(n-- > 0)
 3a2:	39 da                	cmp    %ebx,%edx
 3a4:	75 f2                	jne    398 <memmove+0x18>
  return vdst;
}
 3a6:	5b                   	pop    %ebx
 3a7:	5e                   	pop    %esi
 3a8:	5d                   	pop    %ebp
 3a9:	c3                   	ret    

000003aa <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 3aa:	b8 01 00 00 00       	mov    $0x1,%eax
 3af:	cd 40                	int    $0x40
 3b1:	c3                   	ret    

000003b2 <exit>:
SYSCALL(exit)
 3b2:	b8 02 00 00 00       	mov    $0x2,%eax
 3b7:	cd 40                	int    $0x40
 3b9:	c3                   	ret    

000003ba <wait>:
SYSCALL(wait)
 3ba:	b8 03 00 00 00       	mov    $0x3,%eax
 3bf:	cd 40                	int    $0x40
 3c1:	c3                   	ret    

000003c2 <pipe>:
SYSCALL(pipe)
 3c2:	b8 04 00 00 00       	mov    $0x4,%eax
 3c7:	cd 40                	int    $0x40
 3c9:	c3                   	ret    

000003ca <read>:
SYSCALL(read)
 3ca:	b8 05 00 00 00       	mov    $0x5,%eax
 3cf:	cd 40                	int    $0x40
 3d1:	c3                   	ret    

000003d2 <write>:
SYSCALL(write)
 3d2:	b8 10 00 00 00       	mov    $0x10,%eax
 3d7:	cd 40                	int    $0x40
 3d9:	c3                   	ret    

000003da <close>:
SYSCALL(close)
 3da:	b8 15 00 00 00       	mov    $0x15,%eax
 3df:	cd 40                	int    $0x40
 3e1:	c3                   	ret    

000003e2 <kill>:
SYSCALL(kill)
 3e2:	b8 06 00 00 00       	mov    $0x6,%eax
 3e7:	cd 40                	int    $0x40
 3e9:	c3                   	ret    

000003ea <exec>:
SYSCALL(exec)
 3ea:	b8 07 00 00 00       	mov    $0x7,%eax
 3ef:	cd 40                	int    $0x40
 3f1:	c3                   	ret    

000003f2 <open>:
SYSCALL(open)
 3f2:	b8 0f 00 00 00       	mov    $0xf,%eax
 3f7:	cd 40                	int    $0x40
 3f9:	c3                   	ret    

000003fa <mknod>:
SYSCALL(mknod)
 3fa:	b8 11 00 00 00       	mov    $0x11,%eax
 3ff:	cd 40                	int    $0x40
 401:	c3                   	ret    

00000402 <unlink>:
SYSCALL(unlink)
 402:	b8 12 00 00 00       	mov    $0x12,%eax
 407:	cd 40                	int    $0x40
 409:	c3                   	ret    

0000040a <fstat>:
SYSCALL(fstat)
 40a:	b8 08 00 00 00       	mov    $0x8,%eax
 40f:	cd 40                	int    $0x40
 411:	c3                   	ret    

00000412 <link>:
SYSCALL(link)
 412:	b8 13 00 00 00       	mov    $0x13,%eax
 417:	cd 40                	int    $0x40
 419:	c3                   	ret    

0000041a <mkdir>:
SYSCALL(mkdir)
 41a:	b8 14 00 00 00       	mov    $0x14,%eax
 41f:	cd 40                	int    $0x40
 421:	c3                   	ret    

00000422 <chdir>:
SYSCALL(chdir)
 422:	b8 09 00 00 00       	mov    $0x9,%eax
 427:	cd 40                	int    $0x40
 429:	c3                   	ret    

0000042a <dup>:
SYSCALL(dup)
 42a:	b8 0a 00 00 00       	mov    $0xa,%eax
 42f:	cd 40                	int    $0x40
 431:	c3                   	ret    

00000432 <getpid>:
SYSCALL(getpid)
 432:	b8 0b 00 00 00       	mov    $0xb,%eax
 437:	cd 40                	int    $0x40
 439:	c3                   	ret    

0000043a <sbrk>:
SYSCALL(sbrk)
 43a:	b8 0c 00 00 00       	mov    $0xc,%eax
 43f:	cd 40                	int    $0x40
 441:	c3                   	ret    

00000442 <sleep>:
SYSCALL(sleep)
 442:	b8 0d 00 00 00       	mov    $0xd,%eax
 447:	cd 40                	int    $0x40
 449:	c3                   	ret    

0000044a <uptime>:
SYSCALL(uptime)
 44a:	b8 0e 00 00 00       	mov    $0xe,%eax
 44f:	cd 40                	int    $0x40
 451:	c3                   	ret    

00000452 <fwait>:
SYSCALL(fwait)
 452:	b8 16 00 00 00       	mov    $0x16,%eax
 457:	cd 40                	int    $0x40
 459:	c3                   	ret    

0000045a <fwake>:
 45a:	b8 17 00 00 00       	mov    $0x17,%eax
 45f:	cd 40                	int    $0x40
 461:	c3                   	ret    
 462:	66 90                	xchg   %ax,%ax
 464:	66 90                	xchg   %ax,%ax
 466:	66 90                	xchg   %ax,%ax
 468:	66 90                	xchg   %ax,%ax
 46a:	66 90                	xchg   %ax,%ax
 46c:	66 90                	xchg   %ax,%ax
 46e:	66 90                	xchg   %ax,%ax

00000470 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
 470:	55                   	push   %ebp
 471:	89 e5                	mov    %esp,%ebp
 473:	57                   	push   %edi
 474:	56                   	push   %esi
 475:	53                   	push   %ebx
 476:	89 c6                	mov    %eax,%esi
 478:	83 ec 3c             	sub    $0x3c,%esp
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 47b:	8b 5d 08             	mov    0x8(%ebp),%ebx
 47e:	85 db                	test   %ebx,%ebx
 480:	74 7e                	je     500 <printint+0x90>
 482:	89 d0                	mov    %edx,%eax
 484:	c1 e8 1f             	shr    $0x1f,%eax
 487:	84 c0                	test   %al,%al
 489:	74 75                	je     500 <printint+0x90>
    neg = 1;
    x = -xx;
 48b:	89 d0                	mov    %edx,%eax
    neg = 1;
 48d:	c7 45 c4 01 00 00 00 	movl   $0x1,-0x3c(%ebp)
    x = -xx;
 494:	f7 d8                	neg    %eax
 496:	89 75 c0             	mov    %esi,-0x40(%ebp)
  } else {
    x = xx;
  }

  i = 0;
 499:	31 ff                	xor    %edi,%edi
 49b:	8d 5d d7             	lea    -0x29(%ebp),%ebx
 49e:	89 ce                	mov    %ecx,%esi
 4a0:	eb 08                	jmp    4aa <printint+0x3a>
 4a2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  do{
    buf[i++] = digits[x % base];
 4a8:	89 cf                	mov    %ecx,%edi
 4aa:	31 d2                	xor    %edx,%edx
 4ac:	8d 4f 01             	lea    0x1(%edi),%ecx
 4af:	f7 f6                	div    %esi
 4b1:	0f b6 92 70 08 00 00 	movzbl 0x870(%edx),%edx
  }while((x /= base) != 0);
 4b8:	85 c0                	test   %eax,%eax
    buf[i++] = digits[x % base];
 4ba:	88 14 0b             	mov    %dl,(%ebx,%ecx,1)
  }while((x /= base) != 0);
 4bd:	75 e9                	jne    4a8 <printint+0x38>
  if(neg)
 4bf:	8b 45 c4             	mov    -0x3c(%ebp),%eax
 4c2:	8b 75 c0             	mov    -0x40(%ebp),%esi
 4c5:	85 c0                	test   %eax,%eax
 4c7:	74 08                	je     4d1 <printint+0x61>
    buf[i++] = '-';
 4c9:	c6 44 0d d8 2d       	movb   $0x2d,-0x28(%ebp,%ecx,1)
 4ce:	8d 4f 02             	lea    0x2(%edi),%ecx

  while(--i >= 0)
 4d1:	8d 79 ff             	lea    -0x1(%ecx),%edi
 4d4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 4d8:	0f b6 44 3d d8       	movzbl -0x28(%ebp,%edi,1),%eax
  write(fd, &c, 1);
 4dd:	83 ec 04             	sub    $0x4,%esp
  while(--i >= 0)
 4e0:	83 ef 01             	sub    $0x1,%edi
  write(fd, &c, 1);
 4e3:	6a 01                	push   $0x1
 4e5:	53                   	push   %ebx
 4e6:	56                   	push   %esi
 4e7:	88 45 d7             	mov    %al,-0x29(%ebp)
 4ea:	e8 e3 fe ff ff       	call   3d2 <write>
  while(--i >= 0)
 4ef:	83 c4 10             	add    $0x10,%esp
 4f2:	83 ff ff             	cmp    $0xffffffff,%edi
 4f5:	75 e1                	jne    4d8 <printint+0x68>
    putc(fd, buf[i]);
}
 4f7:	8d 65 f4             	lea    -0xc(%ebp),%esp
 4fa:	5b                   	pop    %ebx
 4fb:	5e                   	pop    %esi
 4fc:	5f                   	pop    %edi
 4fd:	5d                   	pop    %ebp
 4fe:	c3                   	ret    
 4ff:	90                   	nop
    x = xx;
 500:	89 d0                	mov    %edx,%eax
  neg = 0;
 502:	c7 45 c4 00 00 00 00 	movl   $0x0,-0x3c(%ebp)
 509:	eb 8b                	jmp    496 <printint+0x26>
 50b:	90                   	nop
 50c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000510 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 510:	55                   	push   %ebp
 511:	89 e5                	mov    %esp,%ebp
 513:	57                   	push   %edi
 514:	56                   	push   %esi
 515:	53                   	push   %ebx
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 516:	8d 45 10             	lea    0x10(%ebp),%eax
{
 519:	83 ec 2c             	sub    $0x2c,%esp
  for(i = 0; fmt[i]; i++){
 51c:	8b 75 0c             	mov    0xc(%ebp),%esi
{
 51f:	8b 7d 08             	mov    0x8(%ebp),%edi
  for(i = 0; fmt[i]; i++){
 522:	89 45 d0             	mov    %eax,-0x30(%ebp)
 525:	0f b6 1e             	movzbl (%esi),%ebx
 528:	83 c6 01             	add    $0x1,%esi
 52b:	84 db                	test   %bl,%bl
 52d:	0f 84 b0 00 00 00    	je     5e3 <printf+0xd3>
 533:	31 d2                	xor    %edx,%edx
 535:	eb 39                	jmp    570 <printf+0x60>
 537:	89 f6                	mov    %esi,%esi
 539:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
 540:	83 f8 25             	cmp    $0x25,%eax
 543:	89 55 d4             	mov    %edx,-0x2c(%ebp)
        state = '%';
 546:	ba 25 00 00 00       	mov    $0x25,%edx
      if(c == '%'){
 54b:	74 18                	je     565 <printf+0x55>
  write(fd, &c, 1);
 54d:	8d 45 e2             	lea    -0x1e(%ebp),%eax
 550:	83 ec 04             	sub    $0x4,%esp
 553:	88 5d e2             	mov    %bl,-0x1e(%ebp)
 556:	6a 01                	push   $0x1
 558:	50                   	push   %eax
 559:	57                   	push   %edi
 55a:	e8 73 fe ff ff       	call   3d2 <write>
 55f:	8b 55 d4             	mov    -0x2c(%ebp),%edx
 562:	83 c4 10             	add    $0x10,%esp
 565:	83 c6 01             	add    $0x1,%esi
  for(i = 0; fmt[i]; i++){
 568:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
 56c:	84 db                	test   %bl,%bl
 56e:	74 73                	je     5e3 <printf+0xd3>
    if(state == 0){
 570:	85 d2                	test   %edx,%edx
    c = fmt[i] & 0xff;
 572:	0f be cb             	movsbl %bl,%ecx
 575:	0f b6 c3             	movzbl %bl,%eax
    if(state == 0){
 578:	74 c6                	je     540 <printf+0x30>
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
 57a:	83 fa 25             	cmp    $0x25,%edx
 57d:	75 e6                	jne    565 <printf+0x55>
      if(c == 'd'){
 57f:	83 f8 64             	cmp    $0x64,%eax
 582:	0f 84 f8 00 00 00    	je     680 <printf+0x170>
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
 588:	81 e1 f7 00 00 00    	and    $0xf7,%ecx
 58e:	83 f9 70             	cmp    $0x70,%ecx
 591:	74 5d                	je     5f0 <printf+0xe0>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
 593:	83 f8 73             	cmp    $0x73,%eax
 596:	0f 84 84 00 00 00    	je     620 <printf+0x110>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 59c:	83 f8 63             	cmp    $0x63,%eax
 59f:	0f 84 ea 00 00 00    	je     68f <printf+0x17f>
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
 5a5:	83 f8 25             	cmp    $0x25,%eax
 5a8:	0f 84 c2 00 00 00    	je     670 <printf+0x160>
  write(fd, &c, 1);
 5ae:	8d 45 e7             	lea    -0x19(%ebp),%eax
 5b1:	83 ec 04             	sub    $0x4,%esp
 5b4:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
 5b8:	6a 01                	push   $0x1
 5ba:	50                   	push   %eax
 5bb:	57                   	push   %edi
 5bc:	e8 11 fe ff ff       	call   3d2 <write>
 5c1:	83 c4 0c             	add    $0xc,%esp
 5c4:	8d 45 e6             	lea    -0x1a(%ebp),%eax
 5c7:	88 5d e6             	mov    %bl,-0x1a(%ebp)
 5ca:	6a 01                	push   $0x1
 5cc:	50                   	push   %eax
 5cd:	57                   	push   %edi
 5ce:	83 c6 01             	add    $0x1,%esi
 5d1:	e8 fc fd ff ff       	call   3d2 <write>
  for(i = 0; fmt[i]; i++){
 5d6:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
  write(fd, &c, 1);
 5da:	83 c4 10             	add    $0x10,%esp
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 5dd:	31 d2                	xor    %edx,%edx
  for(i = 0; fmt[i]; i++){
 5df:	84 db                	test   %bl,%bl
 5e1:	75 8d                	jne    570 <printf+0x60>
    }
  }
}
 5e3:	8d 65 f4             	lea    -0xc(%ebp),%esp
 5e6:	5b                   	pop    %ebx
 5e7:	5e                   	pop    %esi
 5e8:	5f                   	pop    %edi
 5e9:	5d                   	pop    %ebp
 5ea:	c3                   	ret    
 5eb:	90                   	nop
 5ec:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        printint(fd, *ap, 16, 0);
 5f0:	83 ec 0c             	sub    $0xc,%esp
 5f3:	b9 10 00 00 00       	mov    $0x10,%ecx
 5f8:	6a 00                	push   $0x0
 5fa:	8b 5d d0             	mov    -0x30(%ebp),%ebx
 5fd:	89 f8                	mov    %edi,%eax
 5ff:	8b 13                	mov    (%ebx),%edx
 601:	e8 6a fe ff ff       	call   470 <printint>
        ap++;
 606:	89 d8                	mov    %ebx,%eax
 608:	83 c4 10             	add    $0x10,%esp
      state = 0;
 60b:	31 d2                	xor    %edx,%edx
        ap++;
 60d:	83 c0 04             	add    $0x4,%eax
 610:	89 45 d0             	mov    %eax,-0x30(%ebp)
 613:	e9 4d ff ff ff       	jmp    565 <printf+0x55>
 618:	90                   	nop
 619:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        s = (char*)*ap;
 620:	8b 45 d0             	mov    -0x30(%ebp),%eax
 623:	8b 18                	mov    (%eax),%ebx
        ap++;
 625:	83 c0 04             	add    $0x4,%eax
 628:	89 45 d0             	mov    %eax,-0x30(%ebp)
        if(s == 0)
 62b:	85 db                	test   %ebx,%ebx
 62d:	74 7c                	je     6ab <printf+0x19b>
        while(*s != 0){
 62f:	0f b6 03             	movzbl (%ebx),%eax
 632:	84 c0                	test   %al,%al
 634:	74 29                	je     65f <printf+0x14f>
 636:	8d 76 00             	lea    0x0(%esi),%esi
 639:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
 640:	88 45 e3             	mov    %al,-0x1d(%ebp)
  write(fd, &c, 1);
 643:	8d 45 e3             	lea    -0x1d(%ebp),%eax
 646:	83 ec 04             	sub    $0x4,%esp
 649:	6a 01                	push   $0x1
          s++;
 64b:	83 c3 01             	add    $0x1,%ebx
  write(fd, &c, 1);
 64e:	50                   	push   %eax
 64f:	57                   	push   %edi
 650:	e8 7d fd ff ff       	call   3d2 <write>
        while(*s != 0){
 655:	0f b6 03             	movzbl (%ebx),%eax
 658:	83 c4 10             	add    $0x10,%esp
 65b:	84 c0                	test   %al,%al
 65d:	75 e1                	jne    640 <printf+0x130>
      state = 0;
 65f:	31 d2                	xor    %edx,%edx
 661:	e9 ff fe ff ff       	jmp    565 <printf+0x55>
 666:	8d 76 00             	lea    0x0(%esi),%esi
 669:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
  write(fd, &c, 1);
 670:	83 ec 04             	sub    $0x4,%esp
 673:	88 5d e5             	mov    %bl,-0x1b(%ebp)
 676:	8d 45 e5             	lea    -0x1b(%ebp),%eax
 679:	6a 01                	push   $0x1
 67b:	e9 4c ff ff ff       	jmp    5cc <printf+0xbc>
        printint(fd, *ap, 10, 1);
 680:	83 ec 0c             	sub    $0xc,%esp
 683:	b9 0a 00 00 00       	mov    $0xa,%ecx
 688:	6a 01                	push   $0x1
 68a:	e9 6b ff ff ff       	jmp    5fa <printf+0xea>
        putc(fd, *ap);
 68f:	8b 5d d0             	mov    -0x30(%ebp),%ebx
  write(fd, &c, 1);
 692:	83 ec 04             	sub    $0x4,%esp
        putc(fd, *ap);
 695:	8b 03                	mov    (%ebx),%eax
  write(fd, &c, 1);
 697:	6a 01                	push   $0x1
        putc(fd, *ap);
 699:	88 45 e4             	mov    %al,-0x1c(%ebp)
  write(fd, &c, 1);
 69c:	8d 45 e4             	lea    -0x1c(%ebp),%eax
 69f:	50                   	push   %eax
 6a0:	57                   	push   %edi
 6a1:	e8 2c fd ff ff       	call   3d2 <write>
 6a6:	e9 5b ff ff ff       	jmp    606 <printf+0xf6>
        while(*s != 0){
 6ab:	b8 28 00 00 00       	mov    $0x28,%eax
          s = "(null)";
 6b0:	bb 67 08 00 00       	mov    $0x867,%ebx
 6b5:	eb 89                	jmp    640 <printf+0x130>
 6b7:	66 90                	xchg   %ax,%ax
 6b9:	66 90                	xchg   %ax,%ax
 6bb:	66 90                	xchg   %ax,%ax
 6bd:	66 90                	xchg   %ax,%ax
 6bf:	90                   	nop

000006c0 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 6c0:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 6c1:	a1 60 0b 00 00       	mov    0xb60,%eax
{
 6c6:	89 e5                	mov    %esp,%ebp
 6c8:	57                   	push   %edi
 6c9:	56                   	push   %esi
 6ca:	53                   	push   %ebx
 6cb:	8b 5d 08             	mov    0x8(%ebp),%ebx
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 6ce:	8b 10                	mov    (%eax),%edx
  bp = (Header*)ap - 1;
 6d0:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 6d3:	39 c8                	cmp    %ecx,%eax
 6d5:	73 19                	jae    6f0 <free+0x30>
 6d7:	89 f6                	mov    %esi,%esi
 6d9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
 6e0:	39 d1                	cmp    %edx,%ecx
 6e2:	72 1c                	jb     700 <free+0x40>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 6e4:	39 d0                	cmp    %edx,%eax
 6e6:	73 18                	jae    700 <free+0x40>
{
 6e8:	89 d0                	mov    %edx,%eax
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 6ea:	39 c8                	cmp    %ecx,%eax
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 6ec:	8b 10                	mov    (%eax),%edx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 6ee:	72 f0                	jb     6e0 <free+0x20>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 6f0:	39 d0                	cmp    %edx,%eax
 6f2:	72 f4                	jb     6e8 <free+0x28>
 6f4:	39 d1                	cmp    %edx,%ecx
 6f6:	73 f0                	jae    6e8 <free+0x28>
 6f8:	90                   	nop
 6f9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      break;
  if(bp + bp->s.size == p->s.ptr){
 700:	8b 73 fc             	mov    -0x4(%ebx),%esi
 703:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 706:	39 fa                	cmp    %edi,%edx
 708:	74 19                	je     723 <free+0x63>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 70a:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 70d:	8b 50 04             	mov    0x4(%eax),%edx
 710:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 713:	39 f1                	cmp    %esi,%ecx
 715:	74 23                	je     73a <free+0x7a>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 717:	89 08                	mov    %ecx,(%eax)
  freep = p;
 719:	a3 60 0b 00 00       	mov    %eax,0xb60
}
 71e:	5b                   	pop    %ebx
 71f:	5e                   	pop    %esi
 720:	5f                   	pop    %edi
 721:	5d                   	pop    %ebp
 722:	c3                   	ret    
    bp->s.size += p->s.ptr->s.size;
 723:	03 72 04             	add    0x4(%edx),%esi
 726:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 729:	8b 10                	mov    (%eax),%edx
 72b:	8b 12                	mov    (%edx),%edx
 72d:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 730:	8b 50 04             	mov    0x4(%eax),%edx
 733:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 736:	39 f1                	cmp    %esi,%ecx
 738:	75 dd                	jne    717 <free+0x57>
    p->s.size += bp->s.size;
 73a:	03 53 fc             	add    -0x4(%ebx),%edx
  freep = p;
 73d:	a3 60 0b 00 00       	mov    %eax,0xb60
    p->s.size += bp->s.size;
 742:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 745:	8b 53 f8             	mov    -0x8(%ebx),%edx
 748:	89 10                	mov    %edx,(%eax)
}
 74a:	5b                   	pop    %ebx
 74b:	5e                   	pop    %esi
 74c:	5f                   	pop    %edi
 74d:	5d                   	pop    %ebp
 74e:	c3                   	ret    
 74f:	90                   	nop

00000750 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 750:	55                   	push   %ebp
 751:	89 e5                	mov    %esp,%ebp
 753:	57                   	push   %edi
 754:	56                   	push   %esi
 755:	53                   	push   %ebx
 756:	83 ec 0c             	sub    $0xc,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 759:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
 75c:	8b 15 60 0b 00 00    	mov    0xb60,%edx
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 762:	8d 78 07             	lea    0x7(%eax),%edi
 765:	c1 ef 03             	shr    $0x3,%edi
 768:	83 c7 01             	add    $0x1,%edi
  if((prevp = freep) == 0){
 76b:	85 d2                	test   %edx,%edx
 76d:	0f 84 93 00 00 00    	je     806 <malloc+0xb6>
 773:	8b 02                	mov    (%edx),%eax
 775:	8b 48 04             	mov    0x4(%eax),%ecx
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
 778:	39 cf                	cmp    %ecx,%edi
 77a:	76 64                	jbe    7e0 <malloc+0x90>
 77c:	81 ff 00 10 00 00    	cmp    $0x1000,%edi
 782:	bb 00 10 00 00       	mov    $0x1000,%ebx
 787:	0f 43 df             	cmovae %edi,%ebx
  p = sbrk(nu * sizeof(Header));
 78a:	8d 34 dd 00 00 00 00 	lea    0x0(,%ebx,8),%esi
 791:	eb 0e                	jmp    7a1 <malloc+0x51>
 793:	90                   	nop
 794:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 798:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
 79a:	8b 48 04             	mov    0x4(%eax),%ecx
 79d:	39 cf                	cmp    %ecx,%edi
 79f:	76 3f                	jbe    7e0 <malloc+0x90>
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 7a1:	39 05 60 0b 00 00    	cmp    %eax,0xb60
 7a7:	89 c2                	mov    %eax,%edx
 7a9:	75 ed                	jne    798 <malloc+0x48>
  p = sbrk(nu * sizeof(Header));
 7ab:	83 ec 0c             	sub    $0xc,%esp
 7ae:	56                   	push   %esi
 7af:	e8 86 fc ff ff       	call   43a <sbrk>
  if(p == (char*)-1)
 7b4:	83 c4 10             	add    $0x10,%esp
 7b7:	83 f8 ff             	cmp    $0xffffffff,%eax
 7ba:	74 1c                	je     7d8 <malloc+0x88>
  hp->s.size = nu;
 7bc:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 7bf:	83 ec 0c             	sub    $0xc,%esp
 7c2:	83 c0 08             	add    $0x8,%eax
 7c5:	50                   	push   %eax
 7c6:	e8 f5 fe ff ff       	call   6c0 <free>
  return freep;
 7cb:	8b 15 60 0b 00 00    	mov    0xb60,%edx
      if((p = morecore(nunits)) == 0)
 7d1:	83 c4 10             	add    $0x10,%esp
 7d4:	85 d2                	test   %edx,%edx
 7d6:	75 c0                	jne    798 <malloc+0x48>
        return 0;
 7d8:	31 c0                	xor    %eax,%eax
 7da:	eb 1c                	jmp    7f8 <malloc+0xa8>
 7dc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
      if(p->s.size == nunits)
 7e0:	39 cf                	cmp    %ecx,%edi
 7e2:	74 1c                	je     800 <malloc+0xb0>
        p->s.size -= nunits;
 7e4:	29 f9                	sub    %edi,%ecx
 7e6:	89 48 04             	mov    %ecx,0x4(%eax)
        p += p->s.size;
 7e9:	8d 04 c8             	lea    (%eax,%ecx,8),%eax
        p->s.size = nunits;
 7ec:	89 78 04             	mov    %edi,0x4(%eax)
      freep = prevp;
 7ef:	89 15 60 0b 00 00    	mov    %edx,0xb60
      return (void*)(p + 1);
 7f5:	83 c0 08             	add    $0x8,%eax
  }
}
 7f8:	8d 65 f4             	lea    -0xc(%ebp),%esp
 7fb:	5b                   	pop    %ebx
 7fc:	5e                   	pop    %esi
 7fd:	5f                   	pop    %edi
 7fe:	5d                   	pop    %ebp
 7ff:	c3                   	ret    
        prevp->s.ptr = p->s.ptr;
 800:	8b 08                	mov    (%eax),%ecx
 802:	89 0a                	mov    %ecx,(%edx)
 804:	eb e9                	jmp    7ef <malloc+0x9f>
    base.s.ptr = freep = prevp = &base;
 806:	c7 05 60 0b 00 00 64 	movl   $0xb64,0xb60
 80d:	0b 00 00 
 810:	c7 05 64 0b 00 00 64 	movl   $0xb64,0xb64
 817:	0b 00 00 
    base.s.size = 0;
 81a:	b8 64 0b 00 00       	mov    $0xb64,%eax
 81f:	c7 05 68 0b 00 00 00 	movl   $0x0,0xb68
 826:	00 00 00 
 829:	e9 4e ff ff ff       	jmp    77c <malloc+0x2c>
