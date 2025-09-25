
abstract class AbstractPoint {
    public abstract float compute_disatnce();
}

class TwoDPoint extends AbstractPoint {
    public float _x;
    public float _y;

    public TwoDPoint(float x, float y) {
        this._x = x;
        this._y = y;
    }

    public float compute_disatnce() {
        return (float)Math.sqrt(Math.pow(_x, 2) + Math.pow(_y, 2));
    }
}

class ThreeDPoint extends AbstractPoint {
    public float _x;
    public float _y;
    public float _z;

    public ThreeDPoint(float x, float y, float z) {
        this._x = x;
        this._y = y;
        this._z = z;
    }

    public float compute_disatnce() {
        return (float)Math.sqrt(Math.pow(_x, 2) + Math.pow(_y, 2) + Math.pow(_z, 2));
    }
}

/*
   C2 Compiler JIT: Could not remove different sub-class instance allocations converging at merge point.
   ------------------------------------------------------------------------------------------------------

[Verified Entry Point]
  # {method} {0x000074cb8c401480} 'micro' '(FFFI)F' in 'test_jdk'
  # parm0:    xmm0      = float
  # parm1:    xmm1      = float
  # parm2:    xmm2      = float
  # parm3:    rsi       = int
  #           [sp+0x30]  (sp of caller)
  0x000074cbb4cec4a0:   mov    %eax,-0x14000(%rsp)
  0x000074cbb4cec4a7:   push   %rbp
  0x000074cbb4cec4a8:   sub    $0x20,%rsp
  0x000074cbb4cec4ac:   vmovss %xmm2,0x4(%rsp)
  0x000074cbb4cec4b2:   vmovss %xmm1,(%rsp)
  0x000074cbb4cec4b7:   vmovd  %xmm0,%ebp
  0x000074cbb4cec4bb:   cmp    $0xc350,%esi
  0x000074cbb4cec4c1:   jle    0x000074cbb4cec595
  0x000074cbb4cec4c7:   mov    0x108(%r15),%rax
  0x000074cbb4cec4ce:   mov    %rax,%r10
  0x000074cbb4cec4d1:   add    $0x18,%r10
  0x000074cbb4cec4d5:   cmp    0x118(%r15),%r10
  0x000074cbb4cec4dc:   jae    0x000074cbb4cec5e5
  0x000074cbb4cec4e2:   mov    %r10,0x108(%r15)
  0x000074cbb4cec4e9:   prefetchw 0xc0(%r10)
  0x000074cbb4cec4f1:   movq   $0x1,(%rax)
  0x000074cbb4cec4f8:   movl   $0x1000c18,0x8(%rax)         ;   {metadata('ThreeDPoint')}
  0x000074cbb4cec4ff:   vmovd  %ebp,%xmm0
  0x000074cbb4cec503:   vmovss %xmm0,0xc(%rax)
  0x000074cbb4cec508:   vmovss (%rsp),%xmm1
  0x000074cbb4cec50d:   vmovss %xmm1,0x10(%rax)
  0x000074cbb4cec512:   vmovss 0x4(%rsp),%xmm0
  0x000074cbb4cec518:   vmovss %xmm0,0x14(%rax)
  0x000074cbb4cec51d:   mov    0x8(%rax),%r11d
  0x000074cbb4cec521:   cmp    $0x1000c18,%r11d             ;   {metadata('ThreeDPoint')}
  0x000074cbb4cec528:   jne    0x000074cbb4cec568
  0x000074cbb4cec52a:   vcvtss2sd 0xc(%rax),%xmm0,%xmm0
  0x000074cbb4cec52f:   vcvtss2sd 0x14(%rax),%xmm1,%xmm1
  0x000074cbb4cec534:   vmulsd %xmm0,%xmm0,%xmm0
  0x000074cbb4cec538:   vmulsd %xmm1,%xmm1,%xmm1
  0x000074cbb4cec53c:   vcvtss2sd 0x10(%rax),%xmm2,%xmm2
  0x000074cbb4cec541:   vmulsd %xmm2,%xmm2,%xmm2
  0x000074cbb4cec545:   vaddsd %xmm2,%xmm0,%xmm0
  0x000074cbb4cec549:   vaddsd %xmm1,%xmm0,%xmm0
  0x000074cbb4cec54d:   vsqrtsd %xmm0,%xmm0,%xmm0
  0x000074cbb4cec551:   vcvtsd2ss %xmm0,%xmm0,%xmm0
  0x000074cbb4cec555:   add    $0x20,%rsp
  0x000074cbb4cec559:   pop    %rbp
  0x000074cbb4cec55a:   cmp    0x340(%r15),%rsp             ;   {poll_return}
  0x000074cbb4cec561:   ja     0x000074cbb4cec62a
  0x000074cbb4cec567:   ret

  Graal Compiler JIT: Eliminated allocations from both the control paths.
  -----------------------------------------------------------------------

[Verified Entry Point]
  # {method} {0x00007b7ec4401480} 'micro' '(FFFI)F' in 'test_jdk'
  # parm0:    xmm0      = float
  # parm1:    xmm1      = float
  # parm2:    xmm2      = float
  # parm3:    rsi       = int
  #           [sp+0x10]  (sp of caller)
  0x00007b7edf7ae680:   nopl   0x0(%rax,%rax,1)
  0x00007b7edf7ae685:   vcvtss2sd %xmm0,%xmm0,%xmm0
  0x00007b7edf7ae689:   vmulsd %xmm0,%xmm0,%xmm0
  0x00007b7edf7ae68d:   vcvtss2sd %xmm1,%xmm1,%xmm1
  0x00007b7edf7ae691:   vmulsd %xmm1,%xmm1,%xmm1
  0x00007b7edf7ae695:   vaddsd %xmm1,%xmm0,%xmm0
  0x00007b7edf7ae699:   cmp    $0xc351,%esi
  0x00007b7edf7ae69f:   jl     0x00007b7edf7ae6c7
  0x00007b7edf7ae6a5:   vxorpd %xmm1,%xmm1,%xmm1
  0x00007b7edf7ae6a9:   vcvtss2sd %xmm2,%xmm1,%xmm1
  0x00007b7edf7ae6ad:   vmulsd %xmm1,%xmm1,%xmm1
  0x00007b7edf7ae6b1:   vaddsd %xmm0,%xmm1,%xmm0
  0x00007b7edf7ae6b5:   vsqrtsd %xmm0,%xmm0,%xmm0
  0x00007b7edf7ae6b9:   vcvtsd2ss %xmm0,%xmm0,%xmm0
  0x00007b7edf7ae6bd:   mov    0x348(%r15),%rcx
  0x00007b7edf7ae6c4:   test   %eax,(%rcx)                  ;   {poll_return}
  0x00007b7edf7ae6c6:   ret
  0x00007b7edf7ae6c7:   vsqrtsd %xmm0,%xmm0,%xmm0
  0x00007b7edf7ae6cb:   vcvtsd2ss %xmm0,%xmm0,%xmm0
  0x00007b7edf7ae6cf:   mov    0x348(%r15),%rcx
  0x00007b7edf7ae6d6:   test   %eax,(%rcx)                  ;   {poll_return}
  0x00007b7edf7ae6d8:   ret

*/

public class test_jdk {
    public static float micro(float p1, float p2, float p3, int cond) {
        AbstractPoint obj = null;
        if (cond > 50000) {
            obj = new ThreeDPoint(p1, p2, p3);
        } else  {
            obj = new TwoDPoint(p1, p2);
        }
        return obj.compute_disatnce();
    } 

    public static void main(String [] args) {
        float res = 0.0f;
        for (int i = 0; i < 10000000; i++) {
        }
        res = 0.0f;
        long t1 = System.currentTimeMillis();
        for (int i = 0; i < 10000000; i++) {
            res += micro((float)i, (float)i+10, (float)i+20, i);
        }
        long t2 = System.currentTimeMillis();
        System.out.println("[time] " + (t2 - t1) + " ms  [res]  " + res); 
    }
}
