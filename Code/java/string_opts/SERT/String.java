package org.spec.sert.strings;

import java.lang.management.ManagementFactory;
import java.lang.management.OperatingSystemMXBean;
import java.lang.reflect.Method;
import java.lang.reflect.Modifier;
import java.security.NoSuchAlgorithmException;
import java.util.Random;

public class Strings {
  static final int ONE_MILLION = 1000000;
  
  static final int ONE_BILLION = 1000000000;
  
  static final long ONE_GIGABYTE = 1073741824L;
  
  static final long ONE_MEGABYTE = 1048576L;
  
  static final int ARRAY_ELEMENT_SIZE = 1;
  
  static final String STRING_CHAR_POOL = "0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ .,?;:!-";
  
  private long fIterations = 25L;
  
  private int fRandomSeed = 1;
  
  private double fMemoryUnderTestInMB;
  
  private String fName = "strings";
  
  private boolean fVerbose = false;
  
  private int fArrayElementCount;
  
  private int fNumThreadsInJvm;
  
  private double fHeapSizeInMB;
  
  private double fPhysicalMemorySizeInGB;
  
  private Random fRandomGenerator;
  
  private String fstrCreateMe;
  
  public Strings() throws NoSuchAlgorithmException {
    this.fRandomGenerator = new Random(this.fRandomSeed);
    this.fRandomSeed++;
  }
  
  private String createRandomString(long paramLong) {
    String str = "";
    long l;
    for (l = 0L; str.length() < paramLong; l++)
      str = str + "0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ .,?;:!-".charAt(this.fRandomGenerator
          .nextInt("0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ .,?;:!-".length())); 
    return str;
  }
  
  private void verboseOut(String paramString) {
    if (this.fVerbose)
      System.out.println(paramString); 
  }
  
  public void releaseMemory() {
    verboseOut("Setting string to null...");
    this.fstrCreateMe = "";
    verboseOut("Requesting garbage collection...");
    System.gc();
  }
  
  public double makeString() {
    long l2 = System.nanoTime();
    long l3 = (long)((this.fMemoryUnderTestInMB * 1048576.0D - 40.0D) / 2.0D);
    verboseOut("Creating string of length (characters): " + l3);
    this.fstrCreateMe = createRandomString(l3);
    long l1 = System.nanoTime();
    double d = (l1 - l2);
    if (this.fVerbose) {
      d /= 1.0E9D;
      verboseOut("String creation took (s): " + d);
      verboseOut("String length (characters): " + this.fstrCreateMe.length());
      verboseOut("String value: " + this.fstrCreateMe);
    } 
    return d;
  }
  
  public long getIterations() {
    return this.fIterations;
  }
  
  public void setIterations(long paramLong) {
    this.fIterations = paramLong;
  }
  
  public void setNumThreadsInJvm(int paramInt) {
    this.fNumThreadsInJvm = paramInt;
  }
  
  private double calculateMemoryUnderTest() {
    double d1 = 0.0D;
    double d2 = (150 / this.fNumThreadsInJvm);
    verboseOut("fHeapSizeInMB: " + this.fHeapSizeInMB);
    verboseOut("fNumThreadsInJvm: " + this.fNumThreadsInJvm);
    d1 = 0.75D * this.fHeapSizeInMB / this.fNumThreadsInJvm - d2;
    verboseOut("memory allocation amount (MB): " + d1);
    return d1;
  }
  
  public void setHeapSizeInMB(double paramDouble) {
    this.fHeapSizeInMB = paramDouble;
  }
  
  private double getPhysicalMemorySizeInGB() {
    double d = -1.0D;
    OperatingSystemMXBean operatingSystemMXBean = ManagementFactory.getOperatingSystemMXBean();
    for (Method method : operatingSystemMXBean.getClass().getDeclaredMethods()) {
      method.setAccessible(true);
      if (method
        .getName().startsWith("getTotalPhysicalMemory") && 
        Modifier.isPublic(method.getModifiers()))
        try {
          Object object = method.invoke(operatingSystemMXBean, new Object[0]);
          verboseOut(method.getName() + " = " + object);
          d = Double.parseDouble(object.toString()) / 1.073741824E9D;
        } catch (Exception exception2) {
          Exception exception1 = exception2;
          d = -2.0D;
          verboseOut("getTotalPhysicalMemorySize/getTotalPhysicalMemory is not supported.");
        }  
    } 
    if (d == -1.0D) {
      d = -2.0D;
      verboseOut("getTotalPhysicalMemorySize/getTotalPhysicalMemory is not supported.");
    } 
    return d;
  }
  
  public void setMemoryUnderTestInMB(Double paramDouble) {
    this.fPhysicalMemorySizeInGB = getPhysicalMemorySizeInGB();
    verboseOut("fPhysicalMemorySizeInGB = " + this.fPhysicalMemorySizeInGB);
    if (paramDouble.doubleValue() != this.fMemoryUnderTestInMB) {
      if (paramDouble.doubleValue() > 0.0D) {
        this.fMemoryUnderTestInMB = paramDouble.doubleValue();
      } else if (paramDouble.doubleValue() < 0.0D) {
        this.fMemoryUnderTestInMB = calculateMemoryUnderTest();
        if (this.fMemoryUnderTestInMB < 0.0D)
          this.fMemoryUnderTestInMB = 60.0D; 
      } 
      this.fArrayElementCount = (int)(1048576.0D * this.fMemoryUnderTestInMB / 1.0D);
      verboseOut("Memory under test (MB): " + this.fMemoryUnderTestInMB);
      verboseOut("Array size: " + this.fArrayElementCount);
      releaseMemory();
    } 
  }
  
  public String getName() {
    return this.fName;
  }
  
  public boolean getVerbose() {
    return this.fVerbose;
  }
  
  public void setVerbose(boolean paramBoolean) {
    this.fVerbose = paramBoolean;
  }
  
  public double runStrings() {
    double d2 = 0.0D;
    d2 += makeString();
    verboseOut("Measurement time: " + d2);
    double d1 = this.fMemoryUnderTestInMB * this.fIterations / d2;
    verboseOut("String bandwidth (MB/s): " + d1);
    return d1;
  }
}

