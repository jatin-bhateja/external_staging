

public class minmax {
  public static int micro1(int a, int b) {
    return Integer.min(Integer.min(a, b), Integer.max(a,b));
  }
  public static int micro2(int a, int b) {
    return Integer.min(a, b);
  }
  public static int micro3(int a, int b) {
    return Integer.max(Integer.min(a, b), Integer.max(a,b));
  }
  public static int micro4(int a, int b) {
    return Integer.max(a, b);
  }
  public static void main(String [] args) {
    int res = 0;
    long t1 = System.currentTimeMillis();
    for (int i = 0; i < 1000; i++) {
        for(int j = 0; j < 10000; j++) {
            res += micro1(i, j);
        }
    }
    long t2 = System.currentTimeMillis();
    System.out.println("[time] " + (t2-t1) + "ms  res = " + res); 
    res = 0;
    t1 = System.currentTimeMillis();
    for (int i = 0; i < 1000; i++) {
        for(int j = 0; j < 10000; j++) {
            res += micro2(i, j);
        }
    }
    t2 = System.currentTimeMillis();
    System.out.println("[time] " + (t2-t1) + "ms  res = " + res); 
    res = 0;
    t1 = System.currentTimeMillis();
    for (int i = 0; i < 1000; i++) {
        for(int j = 0; j < 10000; j++) {
            res += micro3(i, j);
        }
    }
    t2 = System.currentTimeMillis();
    System.out.println("[time] " + (t2-t1) + "ms  res = " + res); 
    res = 0;
    t1 = System.currentTimeMillis();
    for (int i = 0; i < 1000; i++) {
        for(int j = 0; j < 10000; j++) {
            res += micro4(i, j);
        }
    }
    t2 = System.currentTimeMillis();
    System.out.println("[time] " + (t2-t1) + "ms  res = " + res); 
  }
}
