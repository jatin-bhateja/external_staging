import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.zip.Adler32;

public class AdlerTest {
  public static void main(String[] args) throws Exception {
    byte[] bytes = Files.readAllBytes(Paths.get("input"));
    long expected = 1265275828L;
    for (int i = 0; i < 100_000; i++) {
      var adler = new Adler32();
      adler.update(bytes);
      long value = adler.getValue();
      if (value != expected) {
        System.err.printf("failed iteration: %d - expected %d, actual %d\n", i, expected, value);
        break;
      }
    }
  }
}
