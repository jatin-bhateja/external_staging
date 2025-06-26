package org.spec.sert.strings;

import org.spec.chauffeur.common.AbstractVersion;
import org.spec.chauffeur.common.ChauffeurIOException;
import org.spec.chauffeur.common.CommunicatorIn;

public class Version extends AbstractVersion {
  private static final String NAME = "CPU_Strings";
  
  private static final String VERSION = "2.0.4";
  
  private static final String DATE = "20200813";
  
  private static final String TIME = "1828";
  
  private static final String NUMBER = "5";
  
  private static Version instance = new Version();
  
  public Version() {
    super("CPU_Strings", "CPU_Strings", "2.0.4", "20200813", "1828", "5");
  }
  
  public Version(CommunicatorIn paramCommunicatorIn, ClassLoader paramClassLoader) throws ChauffeurIOException {
    super(paramCommunicatorIn, paramClassLoader);
  }
  
  public static Version getInstance() {
    return instance;
  }
  
  public static void main(String[] paramArrayOfString) {
    Version version = getInstance();
    if (paramArrayOfString.length > 0 && paramArrayOfString[0].equals("-full")) {
      System.out.println(version.getFullVersionString());
    } else {
      System.out.println(version.getVersionString());
    } 
  }
}

