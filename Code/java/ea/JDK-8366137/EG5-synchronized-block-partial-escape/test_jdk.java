
class Point {
    public float x;
    public float y;
    public float z;

    public Point(float x, float y, float z) {
        this.x = x;
        this.y = y;
        this.z = z;
    }

    public float compute_distance_from_origin() {
        return (float)Math.sqrt(Math.pow(x, 2) + Math.pow(y, 2) + Math.pow(z, 2));
    }
}

/*
  GRAAL - JIT - Partial escape analysis in action.. no-allocation, no-synchronization block, allocation eliminated, scalar replacement of aggregate.
[Verified Entry Point]
  # {method} {0x00007af7f04014a0} 'micro' '(FFF)F' in 'test_jdk'
  # parm0:    xmm0      = float
  # parm1:    xmm1      = float
  # parm2:    xmm2      = float
  #           [sp+0x30]  (sp of caller)
  0x00007af80b7af6a0:   mov    %eax,-0x14000(%rsp)
  0x00007af80b7af6a7:   sub    $0x28,%rsp
  0x00007af80b7af6ab:   mov    %rbp,0x20(%rsp)
  0x00007af80b7af6b0:   movabs $0xc8e7f578,%r11             ;   {oop(a 'java/lang/Class'{0x00000000c8e7f578} = 'test_jdk')}
  0x00007af80b7af6ba:   mov    0x70(%r11),%eax              //  Klass::_java_mirror holding static oop cached_point.
  0x00007af80b7af6be:   test   %eax,%eax                    //  if cached_point == null goto slow path needing materialization
  0x00007af80b7af6c0:   je     0x00007af80b7af713               
  0x00007af80b7af6c6:   vcvtss2sd 0xc(,%rax,1),%xmm0,%xmm0  //  scalar replacement 
  0x00007af80b7af6cf:   vcvtss2sd 0x10(,%rax,1),%xmm1,%xmm1 //  scalar replacement
  0x00007af80b7af6d8:   vmulsd %xmm0,%xmm0,%xmm0         
  0x00007af80b7af6dc:   vmulsd %xmm1,%xmm1,%xmm1
  0x00007af80b7af6e0:   vaddsd %xmm1,%xmm0,%xmm0
  0x00007af80b7af6e4:   vcvtss2sd 0x14(,%rax,1),%xmm1,%xmm1
  0x00007af80b7af6ed:   vmulsd %xmm1,%xmm1,%xmm1
  0x00007af80b7af6f1:   vaddsd %xmm1,%xmm0,%xmm0
  0x00007af80b7af6f5:   vsqrtsd %xmm0,%xmm0,%xmm0
  0x00007af80b7af6f9:   vcvtsd2ss %xmm0,%xmm0,%xmm0         //  return value from compute_distance_from_origin after ConvD2F
  0x00007af80b7af6fd:   mov    0x20(%rsp),%rbp
  0x00007af80b7af702:   add    $0x28,%rsp
  0x00007af80b7af706:   mov    0x348(%r15),%rcx
  0x00007af80b7af70d:   test   %eax,(%rcx)                  ;   {poll_return}
  0x00007af80b7af70f:   vzeroupper
  0x00007af80b7af712:   ret
*/

/*
  C2 JIT - no partial escape analysis.


[Verified Entry Point]
  # {method} {0x000077a61c400498} 'micro' '(FFF)F' in 'test_jdk'
  # parm0:    xmm0      = float
  # parm1:    xmm1      = float
  # parm2:    xmm2      = float
  #           [sp+0x30]  (sp of caller)
  0x000077a6447d4280:   mov    %eax,-0x14000(%rsp)
  0x000077a6447d4287:   push   %rbp
  0x000077a6447d4288:   sub    $0x20,%rsp
  0x000077a6447d428c:   cmpl   $0x1,0x20(%r15)
  0x000077a6447d4294:   jne    0x000077a6447d4700
  0x000077a6447d429a:   vmovss %xmm2,0x4(%rsp)
  0x000077a6447d42a0:   vmovss %xmm1,(%rsp)
  0x000077a6447d42a5:   vmovd  %xmm0,%ebp
  0x000077a6447d42a9:   mov    0x1c8(%r15),%rax
  0x000077a6447d42b0:   mov    %rax,%r10
  0x000077a6447d42b3:   add    $0x18,%r10
  0x000077a6447d42b7:   cmp    0x1d8(%r15),%r10
  0x000077a6447d42be:   jae    0x000077a6447d456e
  0x000077a6447d42c4:   mov    %r10,0x1c8(%r15)
  0x000077a6447d42cb:   prefetchw 0xc0(%r10)                // Upfront allocation.
  0x000077a6447d42d3:   movq   $0x1,(%rax)
  0x000077a6447d42da:   movl   $0x1040210,0x8(%rax)         ;   {metadata('Point')}
  0x000077a6447d42e1:   vmovd  %ebp,%xmm1
  0x000077a6447d42e5:   vmovss %xmm1,0xc(%rax)
  0x000077a6447d42ea:   vmovss (%rsp),%xmm0
  0x000077a6447d42ef:   vmovss %xmm0,0x10(%rax)
  0x000077a6447d42f4:   vmovss 0x4(%rsp),%xmm1
  0x000077a6447d42fa:   vmovss %xmm1,0x14(%rax)
  0x000077a6447d42ff:   mov    %rax,%rbp
  0x000077a6447d4302:   lea    0x10(%rsp),%rbx
  0x000077a6447d4307:   mov    0x0(%rbp),%r10
  0x000077a6447d430b:   mov    0x7e8(%r15),%ebx
  0x000077a6447d4312:   test   $0x2,%r10b
  0x000077a6447d4316:   jne    0x000077a6447d4354
  0x000077a6447d431c:   cmp    $0x837,%ebx
  0x000077a6447d4322:   jg     0x000077a6447d4374
  0x000077a6447d4328:   cmp    -0x8(%r15,%rbx,1),%rbp
  0x000077a6447d432d:   je     0x000077a6447d4346
  0x000077a6447d432f:   mov    %r10,%rax
  0x000077a6447d4332:   or     $0x1,%rax
  0x000077a6447d4336:   and    $0xfffffffffffffffe,%r10
  0x000077a6447d433a:   lock cmpxchg %r10,0x0(%rbp)        // No-lock elision, synchronization block still in place.
  0x000077a6447d4340:   jne    0x000077a6447d4374
  0x000077a6447d4346:   mov    %rbp,(%r15,%rbx,1)
  0x000077a6447d434a:   addl   $0x8,0x7e8(%r15)
  0x000077a6447d4352:   jmp    0x000077a6447d4372
  0x000077a6447d4354:   xor    %rax,%rax
  0x000077a6447d4357:   mov    0x520(%r15),%rbx
*/ 
 
public class test_jdk {
    public static Point cached_point = null;

    public static float micro(float x, float y, float z) {
        Point p = new Point(x, y, z);
        
        synchronized(p) {
            if (cached_point != null) {
                // No object materialization needed in this control path.
                return cached_point.compute_distance_from_origin();
            } else {
                // Object must materialization before assignment in this control path.
                cached_point = p; 
                return p.compute_distance_from_origin(); 
            }
        }
    }
  
    public static void main(String [] args) {
        float res = 0.0f;
        for (int i = 0; i < 1000000; i++) {
            res += micro((float)i, (float)i + 10.0f, (float)i + 100.0f);
            if ((i % 100) == 0) {
                cached_point = null;
            }
        }
        long t1 = System.currentTimeMillis();
        for (int i = 0; i < 1000000; i++) {
            res += micro((float)i, (float)i + 10.0f, (float)i + 100.0f);
            if ((i % 100) == 0) {
                cached_point = null;
            }
        }
        long t2 = System.currentTimeMillis();
        System.out.println("[time] " + (t2 - t1) + " ms  [res] " + res);
    }
}
