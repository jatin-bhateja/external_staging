
import jdk.internal.vm.annotation.Strict;
import jdk.internal.vm.annotation.NullRestricted;
import jdk.internal.vm.annotation.LooselyConsistentValue;

//@LooselyConsistentValue
value class ComplexValue {
    public float re1;
    public float im1;

    public ComplexValue(float re, float im) {
        this.re1 = re;
        this.im1 = im;
    }

    ComplexValue add(ComplexValue augend) {
        return new ComplexValue(this.re1 + augend.re1, this.im1 + augend.im1); 
    }

    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append("[complex value] => ");
        sb.append(re1);
        sb.append(" + ");
        sb.append(im1);
        sb.append("i ");
        return sb.toString();
    }
}


public class large_atomics_64bits {
    @Strict
    @NullRestricted
    public ComplexValue init = new ComplexValue(1.0f, 1.0f);

    public void micro(ComplexValue augend) {
        init = init.add(augend);
    } 

    public static void main(String [] args) {
        large_atomics obj = new large_atomics();

        for (int i = 0; i < 10000000; i++) {
            obj.micro(new ComplexValue((float)i, (float)i));
        } 

        long t1 = System.currentTimeMillis();
        for (int i = 0; i < 10000000; i++) {
            obj.micro(new ComplexValue((float)i, (float)i));
        } 
        long t2 = System.currentTimeMillis();

        System.out.println("[time] " + (t2-t1) + "ms [res]" + obj.init);
    }
}
