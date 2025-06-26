import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;
import jdk.internal.vm.annotation.*;

public class myannot {
  @MultiField(value = 16)
  public static final int fld1 = 10;
  @MultiField(value = 16)
  public static final int fld2 = 10;
  public static void main (String [] args) {
    System.out.println(fld1 + fld2);
  }
}
