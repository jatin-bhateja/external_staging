
public class test {
    public static final int LO_BOUND = 0;
    public static final int HI_BOUND = 100;
 
    //
    //  [HI : LO]
    //    - MIN[HI, MAX[LO, X]]
    //    - MAX(LO, X) will give us a value which is greater than equal to LO, this sets the lower
    //      bound of value range.
    //    - MIN(HI, X) will give us a value which will never be greater than HI, this sets upper bound
    //      of the value range.
    public static int micro(int x) {
        x = Integer.min(100, Integer.max(x, 0));
        // Dead code elimination removed following block since condition is always false,
        // otherwise compiler could have emitted an UCT(for low probability branch) or a
        // true path.
        if (x > 200 || x < 0) {
            throw new AssertionError("OOR error");
        }
        return x;
    }

    public static void main(String [] args) {
        long res = 0;
        for (int i = 0; i < 100000; i++) {
            res += micro(i);    
        }
        System.out.println("[res] " + res);
    }
}
