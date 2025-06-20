
/*
  User defined predicate
  jshell> Runtime.getRuntime().exec("cpuid -1").inputReader().lines().filter(new Predicate<String> () { 
   ...>     public boolean test(String str) {
   ...>         return str.matches(".*AVX.*");
   ...>     }
   ...> }).forEach(s -> System.out.println(s))
*/

public class checkCPUfeature {
   public static void main(String [] args) {
      String query = ".*" + args[0]  + ".*";
      // Query Pipeline.
      try { 
          Runtime.getRuntime()
            .exec("cpuid -1")
            .inputReader()
            .lines()
            .filter(s -> s.matches(query))
            .sorted()
            .forEach( n -> System.out.println(n));
      } catch (Exception e) {
          System.out.println(e);
      }
   }
}
