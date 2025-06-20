import java.util.Arrays;

public class ArrayCopyTest {
	public static final int LENGTH=4096;
	public static int [] a1 = new int[LENGTH];
	public static int [] a2 = new int[LENGTH];

	public static void init() {
		Arrays.fill(a1, 0x7788);
		Arrays.fill(a2, 0x1122);
	}
	
	public static void test() {
		System.arraycopy(a2, 0, a1, 0, LENGTH);
	}
	public static void validate() {
		if (Arrays.equals(a1, a2)) {
			System.out.println("PASSED");
		} else {
			System.out.println("FAILED");
		}
	}
	
	public static void main(String [] args) {
		init();
		for (int i = 0; i < 10000000; i++) {
			a1[i%LENGTH] = i; 
			test();
		}
		validate();
	}
}
