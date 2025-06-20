
import java.io.ByteArrayOutputStream;
import java.io.IOException;

public class SimpleStreamTest {

  public static void main(String[] args) throws IOException {
    long time = System.nanoTime();
    ByteArrayOutputStream stream = new ByteArrayOutputStream(1024 * 1024);
    for (int i = 0; i < 1024 * 1024; i++) {
      stream.write(0);
    }
    stream.close();
    time = System.nanoTime() - time;
    System.out.println(time/1000_000);
  }

}

