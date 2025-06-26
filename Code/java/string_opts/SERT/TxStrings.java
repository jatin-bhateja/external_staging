package org.spec.sert.strings;

import java.security.NoSuchAlgorithmException;
import java.util.logging.FileHandler;
import java.util.logging.Level;
import java.util.logging.Logger;
import org.spec.chauffeur.FatalWorkletException;
import org.spec.chauffeur.IntervalContext;
import org.spec.chauffeur.Transaction;
import org.spec.chauffeur.TransactionFailedException;
import org.spec.chauffeur.User;
import org.spec.chauffeur.config.InvalidConfigurationException;
import org.spec.chauffeur.config.Size;
import org.spec.sert.common.CpuUser;

public class TxStrings extends Transaction<CpuUser, double[][], Double> {
  private static final Logger fLogger = Logger.getLogger(TxStrings.class.getName());
  
  private long fIterations = 25L;
  
  public int fDebugLevel = 0;
  
  private Strings fStrings;
  
  private Double fMemoryUnderTestInMB = Double.valueOf(1.0D);
  
  private double fHeapSizeInMB = 0.0D;
  
  private FileHandler fh;
  
  private int fNumUsers = 0;
  
  public void setIterations(int paramInt) {
    this.fIterations = paramInt;
  }
  
  public void setDebugLevel(int paramInt) {
    this.fDebugLevel = paramInt;
    if (this.fDebugLevel != 0 && this.fStrings != null)
      this.fStrings.setVerbose(true); 
  }
  
  public void setMemoryUnderTest(Size paramSize) {
    this.fMemoryUnderTestInMB = Double.valueOf(paramSize.inMegabytes());
    autoAdjustMemoryUnderTest();
  }
  
  private void autoAdjustMemoryUnderTest() {
    if (this.fMemoryUnderTestInMB.doubleValue() == -1.0D && this.fNumUsers > 1)
      this.fMemoryUnderTestInMB = Double.valueOf(this.fMemoryUnderTestInMB.doubleValue() * this.fNumUsers); 
    if (this.fStrings != null) {
      this.fStrings.setNumThreadsInJvm(this.fNumUsers);
      this.fStrings.setHeapSizeInMB(this.fHeapSizeInMB);
      this.fStrings.setMemoryUnderTestInMB(this.fMemoryUnderTestInMB);
    } 
  }
  
  private static <U extends CpuUser> int getNumUsers(IntervalContext<U> paramIntervalContext) {
    return paramIntervalContext.getWorklet().getMaxUsers();
  }
  
  public TxStrings() {
    fLogger.log(Level.INFO, "TxStrings instantiated, instance: [tid {0}] ------------------ INSTANTIATE --------------------", Long.valueOf(Thread.currentThread().getId()));
  }
  
  public void init(IntervalContext<? extends CpuUser> paramIntervalContext) throws InvalidConfigurationException {
    fLogger.log(Level.INFO, "Creating Strings object [tid {0}] -- START --------------------", Long.valueOf(Thread.currentThread().getId()));
    this.fStrings = null;
    System.gc();
    try {
      this.fStrings = new Strings();
    } catch (NoSuchAlgorithmException noSuchAlgorithmException) {
      Logger.getLogger(TxStrings.class.getName()).log(Level.SEVERE, (String)null, noSuchAlgorithmException);
    } 
    if (this.fDebugLevel != 0 && this.fStrings != null)
      this.fStrings.setVerbose(true); 
    this.fNumUsers = paramIntervalContext.getInterval().getNumberUsers();
    this.fHeapSizeInMB = paramIntervalContext.getEnvironment().getMaxHeapSize().inBytes() / 1000000.0D;
    if (this.fNumUsers < 0)
      this.fNumUsers = getNumUsers(paramIntervalContext); 
    autoAdjustMemoryUnderTest();
    PrintConfiguration();
    fLogger.log(Level.INFO, "Finished creation and allocation of Strings [tid {0}] -- FINISH --", Long.valueOf(Thread.currentThread().getId()));
  }
  
  private void PrintConfiguration() {
    fLogger.log(Level.INFO, "Strings [tid {0}] -------------------- START --------------------", Long.valueOf(Thread.currentThread().getId()));
    fLogger.log(Level.INFO, "Strings [tid {0}] iterations = {1}", new Object[] { Long.valueOf(Thread.currentThread().getId()), Long.valueOf(this.fIterations) });
    fLogger.log(Level.INFO, "Strings [tid {0}] debugLevel = {1}", new Object[] { Long.valueOf(Thread.currentThread().getId()), Integer.valueOf(this.fDebugLevel) });
    fLogger.log(Level.INFO, "Strings [tid {0}] class name = {1}", new Object[] { Long.valueOf(Thread.currentThread().getId()), this.fStrings.getName() });
    fLogger.log(Level.INFO, "Strings [tid {0}] -------------------- END --------------------", Long.valueOf(Thread.currentThread().getId()));
  }
  
  public Double process(CpuUser paramCpuUser, double[][] paramArrayOfdouble) throws TransactionFailedException {
    Double double_ = Double.valueOf(execute(this.fIterations));
    fLogger.log(Level.INFO, "PROCESS: score {0} -- [tid {1}] -- SCORE --", new Object[] { double_, Long.valueOf(Thread.currentThread().getId()) });
    return double_;
  }
  
  public boolean verifyResults(CpuUser paramCpuUser, double[][] paramArrayOfdouble, Double paramDouble) {
    return true;
  }
  
  public final double execute(long paramLong) {
    this.fStrings.setIterations(paramLong);
    return this.fStrings.runStrings();
  }
  
  public String getTransactionName() {
    return "TxStrings";
  }
  
  public double[][] generateInput(CpuUser paramCpuUser) throws TransactionFailedException, FatalWorkletException {
    if (this.fDebugLevel > 0)
      System.out.println("No input generation required for TxStrings."); 
    return (double[][])null;
  }
}

